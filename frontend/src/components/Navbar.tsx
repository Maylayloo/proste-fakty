'use client'

import Link from 'next/link'
import { usePathname } from 'next/navigation'
import styles from './Navbar.module.scss'
import cx from 'clsx'

const navItems = [
  { href: '/aktualnosci', label: 'Aktualności' },
  { href: '/posiedzenia-sejmu', label: 'Posiedzenia Sejmu' },
  { href: '/wyszukiwarka', label: 'Wyszukiwarka' },
]

export function Navbar() {
  const pathname = usePathname()

  return (
    <header className={styles.navbar}>
      <div className={styles.navInner}>
        <Link href="/" className={styles.brand}>
          {messages.logo}
        </Link>

        <nav className={styles.navLinks} aria-label="Główna nawigacja">
          {navItems.map((item) => {
            const isActive = pathname.startsWith(item.href)

            return (
              <Link
                key={item.href}
                href={item.href}
                className={cx(styles.navLink, isActive && styles.active)}
              >
                {item.label}
              </Link>
            )
          })}
        </nav>
      </div>
    </header>
  )
}

const messages = {
  logo: 'Proste Fakty',
}
