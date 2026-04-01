"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

const navItems = [
  { label: "About", href: "/" },
  { label: "Links", href: "/links" },
];

export default function Nav() {
  const pathname = usePathname();

  return (
    <nav className="flex items-center justify-between px-8 py-4">
      <div className="flex gap-6 text-sm">
        {navItems.map((item) => (
          <Link
            key={item.href}
            href={item.href}
            className={
              pathname === item.href
                ? "text-accent"
                : "text-muted hover:text-fg transition-colors"
            }
          >
            {item.label}
          </Link>
        ))}
      </div>
      <div className="flex items-center text-accent text-sm">
        <span>[</span>
        <div className="overflow-hidden w-40">
          <div className="marquee-track">
            <span>under construction</span>
            <span>under construction</span>
          </div>
        </div>
        <span>]</span>
      </div>
    </nav>
  );
}
