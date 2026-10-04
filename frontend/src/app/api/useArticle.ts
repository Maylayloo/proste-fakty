type ArticleProps = {
    id: string;
}


const useArticle = (article: ArticleProps) => {
    const getArticle = async () => {
        const url = `http://localhost:8000/api/v1/articles/${article.id}`;

        
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

        const articleData = {
            slug: data.slug,
            title: data.act.title,
            content: data.summary,
        }

        return { articleData, loading };
    };
}