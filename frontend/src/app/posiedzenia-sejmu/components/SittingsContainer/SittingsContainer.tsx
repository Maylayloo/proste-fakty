import { fetchSittings, ShapedSitting } from '@/app/api/sittingsService';
import SittingCard from '../SittingCard/SittingCard';
import styles from './SittingsContainer.module.scss';

const SittingsContainer = async () => {
  const data = await fetchSittings();
  return (
    <section className={styles.section}>
      <h2 className={styles.header}>Posiedzenia Sejmu:</h2>
      <div className={styles.cardsContainer}>
        {data.items.map((sitting: ShapedSitting) => (
          <SittingCard key={sitting.number} sitting={sitting} />
        ))}
      </div>
    </section>
  )
}

export default SittingsContainer;