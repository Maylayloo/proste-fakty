import styles from './BillCard.module.scss'
import { ShapedBill } from '@/app/api/sittingService'

interface Props {
  bill: ShapedBill
}

const BillCard = ({ bill }: Props) => {
  return (
    <div className={styles.card}>
      <div className={styles.title}>
        <p>{bill.title}</p>
        <p>{bill.printNumber}</p>
      </div>
    </div>
  )
}

export default BillCard
