import NewsCard from '../NewsCard/NewsCard'
import { mockNewsItems } from './mockCards';
import styles from './NewsContainer.module.scss'

const NewsContainer = async () => {
  // DISCLAIMER: THIS IS THE ONLY MOCKED DATA IN OUR PROJECT, 
  // AS IT MAKES NO SENSE TO DO AKTUALNOŚCI WITHOUT USERS
  const mockedCards = mockNewsItems;
  return (
    <section className={styles.section}>
      <h2 className={styles.header}>Aktualności</h2>
      <div className={styles.container}>
        {mockedCards.map((newsItem) => <NewsCard key={newsItem.id} news={newsItem}/>)}
      </div>

    </section>
  )
}

export default NewsContainer
