import asyncio

import pytest
from google.genai import types

from app.db.articles import normalize_article_number
from app.utils.gemini_client import GeminiClient, GeminiTool


def _response(*parts: types.Part) -> types.GenerateContentResponse:
    return types.GenerateContentResponse(
        candidates=[types.Candidate(content=types.Content(role="model", parts=list(parts)))]
    )


class FakeGeminiClient(GeminiClient):
    def __init__(self, responses: list[types.GenerateContentResponse], max_tool_rounds: int = 5) -> None:
        super().__init__(api_key="test", model="test-model", max_tool_rounds=max_tool_rounds)
        self.responses = responses
        self.requests: list[tuple[list[types.Content], types.GenerateContentConfig]] = []

    async def _generate_content(self, model, contents, config):
        self.requests.append((list(contents), config.model_copy()))
        return self.responses.pop(0)


def _article_tool(calls: list[dict]) -> GeminiTool:
    async def get_article(act_name: str, article_number: str) -> dict:
        calls.append({"act_name": act_name, "article_number": article_number})
        return {"found": True, "text": "Art. 5. Treść."}

    return GeminiTool(name="get_article", description="", parameters={"type": "object"}, handler=get_article)


def test_tool_call_is_executed_and_result_sent_back():
    calls: list[dict] = []
    call_part = types.Part(
        function_call=types.FunctionCall(id="c1", name="get_article", args={"act_name": "KP", "article_number": "5"})
    )
    client = FakeGeminiClient([_response(call_part), _response(types.Part.from_text(text="Gotowe"))])

    result = asyncio.run(client.generate("Wyjaśnij", tools=[_article_tool(calls)]))

    assert result.text == "Gotowe"
    assert calls == [{"act_name": "KP", "article_number": "5"}]
    assert result.tool_calls[0].result["found"] is True
    second_contents = client.requests[1][0]
    function_response = second_contents[-1].parts[0].function_response
    assert (function_response.id, function_response.name) == ("c1", "get_article")
    assert second_contents[-2].parts[0].function_call.name == "get_article"  # model turn kept as-is


def test_unknown_tool_and_tool_errors_are_reported_to_model():
    async def broken(**_):
        raise ValueError("db down")

    tool = GeminiTool(name="broken", description="", parameters={"type": "object"}, handler=broken)
    client = FakeGeminiClient(
        [
            _response(
                types.Part(function_call=types.FunctionCall(name="broken", args={})),
                types.Part(function_call=types.FunctionCall(name="missing", args={})),
            ),
            _response(types.Part.from_text(text="ok")),
        ]
    )

    result = asyncio.run(client.generate("x", tools=[tool]))

    assert [r.result["error"] for r in result.tool_calls] == ["ValueError: db down", "Unknown tool: missing"]


def test_tool_budget_forces_final_answer():
    call_part = types.Part(function_call=types.FunctionCall(name="get_article", args={"act_name": "a", "article_number": "1"}))
    client = FakeGeminiClient(
        [_response(call_part), _response(types.Part.from_text(text="final"))], max_tool_rounds=1
    )

    result = asyncio.run(client.generate("x", tools=[_article_tool([])]))

    assert result.text == "final"
    last_config = client.requests[-1][1]
    assert last_config.tool_config.function_calling_config.mode == types.FunctionCallingConfigMode.NONE


@pytest.mark.parametrize(
    ("raw", "expected"),
    [("Art. 178a", "178a"), ("art.26¹", "26^1"), ("26(1)", "26^1"), ("§ 5", "5"), ("12", "12")],
)
def test_normalize_article_number(raw, expected):
    assert normalize_article_number(raw) == expected
