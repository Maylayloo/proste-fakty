import Link from 'next/link';
import styles from './NewsCard.module.scss';

export type BillStatus = 'passed' | 'voting' | 'rejected';

export interface NewsItem {
  id: string;
  category: string;
  date: string;
  docNumber: string;
  docType: string;
  status: BillStatus;
  statusLabel: string;
  title: string;
  subtitle: string;
  summary30s: string;
  beforeText: string;
  afterText: string;
  targetAudience: string;
  readTime: string;
  contentType: string;
}

interface Props {
  news: NewsItem;
}

const NewsCard = ({ news }: Props) => {
  const getStatusClass = (status: BillStatus) => {
    switch (status) {
      case 'passed': return styles.statusPassed;
      case 'voting': return styles.statusVoting;
      case 'rejected': return styles.statusRejected;
      default: return '';
    }
  };

  return (
    <article className={styles.card}>
      <div className={styles.metaCluster}>
        <span className={styles.pillCategory}>{news.category}</span>
        <span className={styles.pillDoc}>{news.docNumber} &middot; {news.docType}</span>
        <span className={`${styles.pill} ${getStatusClass(news.status)}`}>
          {news.status === 'passed' && '✓ '}
          {news.status === 'voting' && '⏱ '}
          {news.statusLabel}
        </span>
        <div className={styles.dateInfo}>
          <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
            <line x1="16" y1="2" x2="16" y2="6"></line>
            <line x1="8" y1="2" x2="8" y2="6"></line>
            <line x1="3" y1="10" x2="21" y2="10"></line>
          </svg>
          <time dateTime={news.date}>{news.date}</time>
        </div>
      </div>

      <div className={styles.mainContent}>
        <h2 className={styles.title}>{news.title}</h2>
        <p className={styles.subtitle}>{news.subtitle}</p>
        
        <div className={styles.audienceTags}>
          <span className={styles.audiencePill}>
            <svg width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path>
              <circle cx="9" cy="7" r="4"></circle>
              <path d="M23 21v-2a4 4 0 0 0-3-3.87"></path>
              <path d="M16 3.13a4 4 0 0 1 0 7.75"></path>
            </svg>
            Kogo dotyczy: {news.targetAudience}
          </span>
        </div>
      </div>

      <div className={styles.flatSection}>
        <div className={styles.highlightHeader}>
          <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <path d="M9 18h6m-3-13v4m-5.657 1.343l1.414 1.414M17.657 6.343l-1.414 1.414M12 2a10 10 0 1 0 10 10h-2a8 8 0 1 1-8-8V2z"></path>
          </svg>
          <h4>Najważniejsze w 30 sekund</h4>
        </div>
        
        <p className={styles.summaryText}>{news.summary30s}</p>

        <div className={styles.comparisonGrid}>
          <div className={styles.comparisonSide}>
            <span className={styles.labelBefore}>&minus; PRZED &middot; PRZYKŁAD</span>
            <p>{news.beforeText}</p>
          </div>
          
          <div className={styles.arrowDivider}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <line x1="5" y1="12" x2="19" y2="12"></line>
              <polyline points="12 5 19 12 12 19"></polyline>
            </svg>
          </div>

          <div className={styles.comparisonSide}>
            <span className={styles.labelAfter}>+ PO ZMIANIE &middot; PROPOZYCJA</span>
            <p>{news.afterText}</p>
          </div>
        </div>
      </div>

      <footer className={styles.footer}>
        <Link href={`/aktualnosci/${news.id}`} className={styles.buttonCta}>
          Przeczytaj wyjaśnienie &rarr;
        </Link>
        <span className={styles.footerMeta}>
          {news.contentType} &middot; {news.readTime}
        </span>
      </footer>
    </article>
  );
};

export default NewsCard;