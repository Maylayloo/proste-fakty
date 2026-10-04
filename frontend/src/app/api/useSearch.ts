type SearchProps = {
    query: string;
}

type Article = {
    slug: string;
    title: string;
    content: string;
}

type SearchResult = {
    articles: [Article];
}

const useSearch = (search: SearchProps) => {
    const getArticle = async () => {
        const url = `http://localhost:8000/api/v1/articles/search?query=${search.query}`;

        const res = await fetch(url, {
        headers: {
            'accept': '*/*'
        },
        });
        const loading = res ? false : true;

        if (!res.ok) {
        throw new Error('Error fetching article');
        }

        const data = await res.json();

        const searchData: SearchResult = data.map((item: any) => {
            return {slug: item.slug, title: item.act.title, content: item.summary}
        })

        return { searchData, loading };
    };
}