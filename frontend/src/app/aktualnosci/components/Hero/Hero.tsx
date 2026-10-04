import Image from 'next/image'
import Link from 'next/link'
import styles from './Hero.module.scss'

const heroImageUrl = '/images/sejm-hero-background.png'

const Hero = () => {
  return (
    <section className={styles.hero}>
      <div className={styles.backgroundContainer}>
        <Image
          src={heroImageUrl}
          alt={messages.heroImageAlt}
          className={styles.backgroundImage}
          fill
          loading="eager"
        />
      </div>
      <div className={styles.container}>
        <div className={styles.textContent}>
          <h1>{messages.title}</h1>

          <div className={styles.divider} />

          <p>{messages.description}</p>

          <div className={styles.actions}>
            <Link href="" className={styles.goToSittingsBtn}>
              <span>{messages.checkSittings}</span>
              <span aria-hidden="true">&rarr;</span>
            </Link>
          </div>
        </div>
      </div>
    </section>
  )
}

export default Hero

const messages = {
  title: 'Co się ostatnio wydarzyło w sejmie?',
  description: 'Zobacz co ostatnio wydarzyło się w sejmie lorem ipsum dolar ',
  checkSittings: 'Sprawdź posiedzenia',
  heroImageAlt: 'Sejm assembly hall',
}
