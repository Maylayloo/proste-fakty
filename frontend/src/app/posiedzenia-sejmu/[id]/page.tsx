import { fetchSitting } from '@/app/api/sittingService';
import styles from './posiedzenie.module.scss';
import BillCard from './BillCard/BillCard';

export default async function SittingDetailsPage({ params }: { params: Promise<{ id: string }> }) {
  const resolvedParams = await params;
  const data = await fetchSitting(Number(resolvedParams.id));

  return (
    <div className={styles.container}>
      <header className={styles.header}>
        <div className={styles.metaInfo}>
          <span className={styles.badge}>Posiedzenie nr {data.number}</span>
          <span className={styles.dates}> {data.startDate} do {data.endDate}</span>
          {data.turnout !== null && (
            <span className={styles.turnout}>Frekwencja: {(data.turnout * 100).toFixed(1)}%</span>
          )}
        </div>
        
        <h1>{data.title}</h1>
        {data.description && (
          <p className={styles.description}>{data.description}</p>
        )}
        
        <div className={styles.stats}>
          Liczba głosowań: <strong>{data.votingsCount}</strong> | Projekty ustaw: <strong>{data.bills.length}</strong>
        </div>
      </header>

      <section className={styles.billsSection}>
        <h2>Rozpatrywane projekty i ustawy</h2>
        
        <div className={styles.grid}>
          {data.bills.map((bill) => (
           <BillCard bill={bill} key={bill.printNumber} />
          ))}
        </div>
      </section>
    </div>
  );
}