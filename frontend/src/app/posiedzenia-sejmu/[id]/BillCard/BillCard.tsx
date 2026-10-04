import styles from './BillCard.module.scss'
import { ShapedBill } from '@/app/api/sittingService'

interface Props {
  bill: ShapedBill
}

const BillCard = ({ bill }: Props) => {
  return (
    <article key={bill.printNumber} className={styles.card}>
      <div className={styles.cardHeader}>
        <span className={styles.printNumber}>Druk {bill.printNumber}</span>
        <span className={`${styles.status} ${styles[bill.result] || ''}`}>
          {bill.result === 'passed' ? 'Uchwalono' : bill.result === 'pending' ? 'Procedowany' : bill.result}
        </span>
      </div>
      
      <h3 className={styles.billTitle}>{bill.title}</h3>
      {bill.summary && (
        <p className={styles.billSummary}>{bill.summary}</p>
      )}

      {bill.votes ? (
        <div className={styles.votesBox}>
          <div className={styles.voteRow}>
            <span>Za:</span> <strong className={styles.textGreen}>{bill.votes.yes}</strong>
          </div>
          <div className={styles.voteRow}>
            <span>Przeciw:</span> <strong className={styles.textRed}>{bill.votes.no}</strong>
          </div>
          <div className={styles.voteRow}>
            <span>Wstrzymało się:</span> <strong>{bill.votes.abstain}</strong>
          </div>
        </div>
      ) : (
        <div className={styles.noVotes}>Brak wyników głosowania</div>
      )}

      <a 
        href={bill.sourceUrl} 
        target="_blank" 
        rel="noreferrer" 
        className={styles.actionBtn}
      >
        Zobacz na sejm.gov.pl
      </a>
    </article>
  )
}

export default BillCard
