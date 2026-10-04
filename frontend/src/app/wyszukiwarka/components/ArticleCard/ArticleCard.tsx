import Link from 'next/link';
import { ShapedArticleSearchHit } from '@/app/api/articlesService';
import styles from './ArticleCard.module.scss';

interface Props {
  article: ShapedArticleSearchHit;
}
const ArticleCard = ({ article }: Props) => {
  return (
    <Link href={`/wyszukiwarka/${article.slug}`} className={styles.card}>
      <svg 
        className={styles.arrowIcon} 
        width="20" 
        height="20" 
        viewBox="0 0 24 24" 
        fill="none" 
        stroke="currentColor" 
        strokeWidth="2" 
        strokeLinecap="round" 
        strokeLinejoin="round"
      >
        <line x1="7" y1="17" x2="17" y2="7"></line>
        <polyline points="7 7 17 7 17 17"></polyline>
      </svg>
      <h3 className={styles.title}>{article.actTitle} – {messages.article} {article.articleNumber}</h3>
      <p>{article.summaryPreview}</p>
    </Link>
  );
}

export default ArticleCard;

const messages = {
  article: "art.",
}
