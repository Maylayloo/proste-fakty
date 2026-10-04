import { ShapedSitting } from '@/app/api/sittingsService'
import styles from './SittingCard.module.scss'
import Link from 'next/link'

interface Props {
  sitting: ShapedSitting
  id?: string
}

const SittingCard = ({ sitting, id }: Props) => {
  return (
    <Link id={id} href={`/posiedzenia-sejmu/${sitting.number}`} className={styles.card}>
      <div className={styles.leftSection}>
        <span className={styles.sittingLabel}>{messages.sitting}</span>
        <span className={styles.number}>{sitting.number}</span>
      </div>
      
      <div className={styles.rightSection}>
        <div className={styles.metadata}>
          <time dateTime={sitting.startDate}>
            {sitting.startDate} - {sitting.endDate}
          </time>
          <span className={styles.separator}>•</span>
          <span>
            {messages.votings}: <strong>{sitting.votingsCount}</strong>
          </span>
        </div>
        
        <h3 className={styles.title}>{sitting.title}</h3>
        {sitting.description && <p className={styles.description}>{sitting.description}</p>}
        
        <div className={styles.actionRow}>
          <span>{messages.readMore}</span>
          <span aria-hidden="true">&rarr;</span>
        </div>
      </div>
    </Link>
  )
}

export default SittingCard

const messages = {
  sitting: 'Posiedzenie',
  votings: 'Głosowania',
  readMore: 'Zobacz szczegóły',
}