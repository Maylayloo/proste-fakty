'use client'

import styles from './NewsCard.module.scss'

const NewsCard = () => {
  return (
    <div className={styles.card}>
      <div className={styles.top}>
        <p>Category</p>
        <p>Date</p>
      </div>
      <div className={styles.titleBar}>
        <div>
          <h2>Tytuł</h2>
          <p>
            Opis ustawy: Lorem ipsum, dolor sit amet consectetur adipisicing
            elit. Iusto, in?
          </p>
        </div>
        <div className={styles.status}>
          √<p>przyjęta w sejmie</p>
        </div>
      </div>
      <div className={styles.diffs}>
        <div className={styles.diffsCard}>
          <p className={styles.diffTitle}>Przed zmianą</p>
          <p className={styles.diffDescription}>
            Lorem ipsum dolor sit, amet consectetur adipisicing elit. Laborum
            sit doloremque rerum nostrum in est.
          </p>
        </div>
        <div className={styles.diffsCard}>
          <p className={styles.diffTitle}>Propozycja zmiany</p>
          <p className={styles.diffDescription}>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Laboriosam,
            quasi beatae laudantium ut alias corrupti!
          </p>
        </div>
      </div>
    </div>
  )
}

export default NewsCard
