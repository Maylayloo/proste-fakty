import { fetchArticle } from '@/app/api/articlesService';

interface Props {
  params: Promise<{ slug: string }>;
}

const ArtykulPage = async ({ params }: Props) => {
  const { slug } = await params;
  const article = await fetchArticle(slug);

  return (
    <main>
      <h1>{article.actTitle}</h1>
      <p>{messages.article} {article.number}</p>
      <p>{article.actDate}</p>
      <h2>{messages.summary}</h2>
      <p>{article.summary}</p>
      <h2>{messages.text}</h2>
      <p>{article.text}</p>
      <h2>{messages.references}</h2>
      <ul>
        {article.references.map((reference) => (
          <li key={reference.slug}>{reference.slug}</li>
        ))}
      </ul>
    </main>
  );
}

export default ArtykulPage;

const messages = {
  article: "Art.",
  summary: "Streszczenie",
  text: "Treść",
  references: "Odesłania",
}
