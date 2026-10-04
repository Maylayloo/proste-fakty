import type { Metadata } from "next";
import { Geist } from "next/font/google";
import { Navbar } from "@/components/Navbar";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-sans",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Proste Fakty",
  description: "Portal informacyjny z aktualnościami i posiedzeniami sejmu.",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="pl" className={geistSans.variable}>
      <body>
        <Navbar />
        {children}
      </body>
    </html>
  );
}
