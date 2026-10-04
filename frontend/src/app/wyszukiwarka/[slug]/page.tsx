import Link from 'next/link';
import cx from 'clsx';
import { fetchArticle } from '@/app/api/articlesService';
import styles from './details.module.scss';

interface Props {
  params: Promise<{ slug: string }>;
}



const ArtykulPage = async ({ params }: Props) => {
  const { slug } = await params;
  const article = await fetchArticle(slug);

  return (
    <main className={styles.pageContainer}>
      <article className={styles.articleWrapper}>
        
        <header className={styles.header}>
          <div className={styles.metaCluster}>
            <span className={styles.pillArticle}>
              {messages.article} {article.number}
            </span>
            <div className={styles.dateInfo}>
              <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                <line x1="16" y1="2" x2="16" y2="6"></line>
                <line x1="8" y1="2" x2="8" y2="6"></line>
                <line x1="3" y1="10" x2="21" y2="10"></line>
              </svg>
              <time dateTime={article.actDate}>{article.actDate}</time>
            </div>
          </div>
          <h1 className={styles.title}>{article.actTitle}</h1>
        </header>

        <section className={styles.summarySection}>
          <div className={styles.summaryHeader}>
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
              <path d="M9 18h6m-3-13v4m-5.657 1.343l1.414 1.414M17.657 6.343l-1.414 1.414M12 2a10 10 0 1 0 10 10h-2a8 8 0 1 1-8-8V2z"></path>
            </svg>
            <h2>{messages.summary}</h2>
          </div>
          <p className={styles.summaryText}>{article.summary}</p>
        </section>

        {article.references && article.references.length > 0 && (
          <section className={styles.referencesSection}>
            <h2 className={styles.sectionTitle}>{messages.references}</h2>
            <ul className={styles.referencesList}>
              {article.references.map((reference) => (
                <li key={reference.slug}>
                  {reference.available ? (
                    <Link href={`/wyszukiwarka/${reference.slug}`} className={styles.referenceLink}>
                      <div className={styles.referenceContent}>
                        <span className={styles.referenceIcon}>🔗</span>
                        {reference.slug}
                      </div>
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                        <polyline points="12 5 19 12 12 19"></polyline>
                      </svg>
                    </Link>
                  ) : (
                    <div className={cx(styles.referenceLink, styles.referenceUnavailable)}>
                      <div className={styles.referenceContent}>
                        <span className={styles.referenceIcon}>🔗</span>
                        {reference.slug}
                      </div>
                    </div>
                  )}
                </li>
              ))}
            </ul>
          </section>
        )}
      </article>
    </main>
  );
};

export default ArtykulPage;

const messages = {
  article: "Art.",
  summary: "Streszczenie",
  text: "Treść",
  references: "Źródła i powiązane artykuły",
};