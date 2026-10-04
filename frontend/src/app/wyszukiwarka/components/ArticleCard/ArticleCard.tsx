import Link from 'next/link';
import { ShapedArticleSearchHit } from '@/app/api/articlesService';
import styles from './ArticleCard.module.scss';

interface Props {
  article: ShapedArticleSearchHit;
}
const ArticleCard = ({ article }: Props) => {
  return (
    <Link href={`/wyszukiwarka/${article.slug}`} className={styles.card}>
      <h3 className={styles.title}>{article.actTitle} – {messages.article} {article.articleNumber}</h3>
      <p>{article.summaryPreview}</p>
    </Link>
  );
}

export default ArticleCard;

const messages = {
  article: "art.",
}
