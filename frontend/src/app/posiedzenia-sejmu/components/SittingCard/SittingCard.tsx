import { ShapedSitting } from '@/app/api/sittingsService';
import styles from './SittingCard.module.scss';

interface Props {
  sitting: ShapedSitting;
}
const SittingCard = ({ sitting }: Props) => {
  return (
    <div className={styles.card}>
      <div className={styles.leftSection}>
        <span className={styles.number}>{sitting.number}</span>
        <span>{messages.sitting}</span>
      </div>
      <div className={styles.rightSection}>
        <div className={styles.headingContainer}>
          <h3 className={styles.title}>{sitting.title}</h3>
          <span>{sitting.startDate} - {sitting.endDate}</span>
          <span>{messages.votings}: {sitting.votingsCount}</span>
        </div>
        <p>{sitting.description}</p>
      </div>
    </div>
  );
}

export default SittingCard;

const messages = {
  sitting: "Posiedzenie",
  votings: "Głosowania",
}