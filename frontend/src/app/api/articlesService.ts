type ArticleSearchHit = {
  slug: string;
  act_key: string;
  act_title: string;
  article_number: string;
  score: number;
  summary_preview: string;
};

type ArticleResponse = {
  slug: string;
  number: string;
  position: number;
  act: {
    act_key: string;
    title: string;
    act_type: string | null;
    act_date: string | null;
  };
  text: string;
  summary: string | null;
  references: {
    slug: string;
    same_act: boolean;
    available: boolean;
  }[];
};

export type ShapedArticleSearchHit = {
  slug: string;
  actTitle: string;
  articleNumber: string;
  summaryPreview: string;
};

export type ShapedArticle = {
  slug: string;
  number: string;
  actTitle: string;
  actType: string | null;
  actDate: string | undefined;
  text: string;
  summary: string | null;
  references: {
    slug: string;
    sameAct: boolean;
    available: boolean;
  }[];
};

const shapeSearchHit = (hit: ArticleSearchHit): ShapedArticleSearchHit => ({
  slug: hit.slug,
  actTitle: hit.act_title,
  articleNumber: hit.article_number,
  summaryPreview: hit.summary_preview,
});

const shapeArticle = (article: ArticleResponse): ShapedArticle => ({
  slug: article.slug,
  number: article.number,
  actTitle: article.act.title,
  actType: article.act.act_type,
  actDate: article.act.act_date ?? "",
  text: article.text,
  summary: article.summary,
  references: article.references.map((reference) => ({
    slug: reference.slug,
    sameAct: reference.same_act,
    available: reference.available,
  })),
});

export async function searchArticles(query: string): Promise<ShapedArticleSearchHit[]> {
  const url = 'http://localhost:8000/api/v1/articles/search';

  const res = await fetch(url, {
    method: 'POST',
    headers: {
      'accept': '*/*',
      'content-type': 'application/json',
    },
    body: JSON.stringify({ query }),
  });

  if (!res.ok) {
    throw new Error('Error searching articles');
  }

  const data: ArticleSearchHit[] = await res.json();

  return data.map(shapeSearchHit);
}

export async function fetchArticle(slug: string): Promise<ShapedArticle> {
  const url = `http://localhost:8000/api/v1/articles/${encodeURIComponent(slug)}`;

  const res = await fetch(url, {
    headers: {
      'accept': '*/*'
    },
  });

  if (!res.ok) {
    throw new Error('Error fetching article');
  }

  const data: ArticleResponse = await res.json();

  return shapeArticle(data);
}
