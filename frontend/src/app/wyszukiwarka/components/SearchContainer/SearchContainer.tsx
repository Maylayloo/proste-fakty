'use client';

import { KeyboardEvent, useState } from 'react';
import { searchArticles, ShapedArticleSearchHit } from '@/app/api/articlesService';
import ArticleCard from '../ArticleCard/ArticleCard';
import styles from './SearchContainer.module.scss';

const messages = {
  header: "Wyszukiwarka",
  placeholder: "Czego szukasz?",
};

const SearchContainer = () => {
  const [articles, setArticles] = useState<ShapedArticleSearchHit[]>([]);
  const [isSearching, setIsSearching] = useState(false);

  const handleKeyDown = async (event: KeyboardEvent<HTMLInputElement>) => {
    if (event.key !== 'Enter') {
      return;
    }
    const query = event.currentTarget.value.trim();
    if (query.length < 2) {
      return;
    }

    setIsSearching(true);
    try {
      const results = await searchArticles(query);
      setArticles(results);
    } finally {
      setIsSearching(false);
    }
  };

  return (
    <section className={styles.section}>
      <header className={styles.headerWrapper}>
        <h2 className={styles.header}>{messages.header}</h2>
        
        <div className={styles.inputWrapper}>
          <svg className={styles.searchIcon} width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round">
            <circle cx="11" cy="11" r="8"></circle>
            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
          </svg>
          <input
            className={styles.input}
            type="search"
            placeholder={messages.placeholder}
            onKeyDown={handleKeyDown}
            disabled={isSearching}
          />
        </div>
      </header>

      {articles.length > 0 && (
        <div className={styles.cardsContainer}>
          {articles.map((article: ShapedArticleSearchHit) => (
            <ArticleCard key={article.slug} article={article} />
          ))}
        </div>
      )}
    </section>
  );
};

export default SearchContainer;