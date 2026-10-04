import styles from './posiedzenie.module.scss'
import { fetchSitting } from '@/app/api/sittingService'
import {
  ShapedSittingDetail,
  ShapedBill,
  ShapedClubVotes,
  ShapedVotes,
} from '@/app/api/sittingsService'
import BillCard from './BillCard/BillCard'

const page = async (props: PageProps<'/posiedzenia-sejmu/[id]'>) => {
  const { id } = await props.params
  const data = await fetchSitting(Number(`${id}`))
  console.log(data)
  return (
    <main>
      <h1>{data.title}</h1>
      <p>
        {data.startDate} - {data.endDate}
      </p>
      <p>{data.description}</p>
      <div>
        {data.bills.map((bill: ShapedBill) => (
          <BillCard key={bill.printNumber} bill={bill} />
        ))}
      </div>
    </main>
  )
}

export default page
