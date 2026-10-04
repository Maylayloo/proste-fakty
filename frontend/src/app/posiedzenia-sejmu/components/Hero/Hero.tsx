import Image from 'next/image';
import styles from './Hero.module.scss';

const heroImageUrl = "/images/sejm-hero-background.png";

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
            <a href="#first-sitting" className={styles.goToSittingsBtn}>
              <span>{messages.checkSittings}</span>
              <span aria-hidden="true">&rarr;</span>
            </a>
          </div>
        </div>
      </div>
    </section>
  );
}

export default Hero;

const messages = {
  title: "Co się dzieje w sejmie?",
  description: "Posiedzenia, ustawy i ważne rozmowy - zebrane w jednym miejscu, wyjaśnione prostym językiem.",
  checkSittings: "Sprawdź posiedzenia",
  heroImageAlt: "Sala sejmowa",
}