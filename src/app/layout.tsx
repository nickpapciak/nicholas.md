import type { Metadata } from "next";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";
import Nav from "@/components/Nav";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Nicholas Papciak",
  description: "Nicholas Papciak — engineer, cofounder at Datafruit",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en" className={`${geistSans.variable} ${geistMono.variable}`}>
      <body className="min-h-screen flex flex-col font-mono">
        <Nav />
        <main className="flex-1 flex items-center justify-center px-8">
          {children}
        </main>
        <footer className="px-8 py-4 text-muted text-sm">
          v0.0.1
        </footer>
      </body>
    </html>
  );
}
