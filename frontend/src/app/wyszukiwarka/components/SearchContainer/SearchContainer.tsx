'use client';

import { KeyboardEvent, useState } from 'react';
import { searchArticles, ShapedArticleSearchHit } from '@/app/api/articlesService';
import ArticleCard from '../ArticleCard/ArticleCard';
import styles from './SearchContainer.module.scss';

const SearchContainer = () => {
  const [articles, setArticles] = useState<ShapedArticleSearchHit[]>([]);

  const handleKeyDown = async (event: KeyboardEvent<HTMLInputElement>) => {
    if (event.key !== 'Enter') {
      return;
    }
    const query = event.currentTarget.value.trim();
    if (query.length < 2) {
      return;
    }
    setArticles(await searchArticles(query));
  };

  return (
    <section className={styles.section}>
      <h2 className={styles.header}>{messages.header}</h2>
      <input
        className={styles.input}
        type="search"
        placeholder={messages.placeholder}
        onKeyDown={handleKeyDown}
      />
      <div className={styles.cardsContainer}>
        {articles.map((article: ShapedArticleSearchHit) => (
          <ArticleCard key={article.slug} article={article} />
        ))}
      </div>
    </section>
  )
}

export default SearchContainer;

const messages = {
  header: "Wyszukiwarka:",
  placeholder: "Czego szukasz?",
}
