"use client";

import Link from "next/link";
import { usePathname } from "next/navigation";

const navItems = [
  { label: "About", href: "/" },
  { label: "Social", href: "/links" },
  { label: "Reading", href: "/reading" },
  { label: "Writing", href: "/writing" },
];

export default function Nav() {
  const pathname = usePathname();

  return (
    <nav className="px-8 py-4">
      <div className="flex flex-wrap gap-x-6 gap-y-1 text-sm">
        {navItems.map((item) => (
          <Link
            key={item.href}
            href={item.href}
            className={
              pathname === item.href || (item.href !== "/" && pathname.startsWith(item.href))
                ? "text-accent tab-activate"
                : "text-muted"
            }
          >
            {item.label}
          </Link>
        ))}
      </div>
    </nav>
  );
}
