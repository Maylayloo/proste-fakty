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
              <span>{messages.primaryCta}</span>
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
  title: 'Najważniejsze zmiany wokół Ciebie',
  description: 'Przeglądaj najświeższe aktualności, wyjaśnienia, wnioski. Czy wpłynie to na Twoje życie?',
  primaryCta: 'Przeglądaj aktualności',
  heroImageAlt: 'Tło sekcji aktualności legislacyjnych',
}
