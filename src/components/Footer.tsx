"use client";

import { useEffect, useCallback } from "react";
import { usePathname, useRouter } from "next/navigation";

const routes = ["/", "/links", "/reading", "/writing"];

export default function Footer() {
  const pathname = usePathname();
  const router = useRouter();

  const toggleTheme = useCallback(() => {
    const html = document.documentElement;
    const next = html.getAttribute("data-theme") === "dark" ? "light" : "dark";
    html.setAttribute("data-theme", next);
    localStorage.setItem("theme", next);
  }, []);

  const navigate = useCallback(
    (dir: -1 | 1) => {
      const idx = routes.indexOf(pathname);
      if (idx === -1) return;
      const next = (idx + dir + routes.length) % routes.length;
      router.push(routes[next]);
    },
    [pathname, router]
  );

  useEffect(() => {
    const saved = localStorage.getItem("theme");
    if (saved === "dark") {
      document.documentElement.setAttribute("data-theme", "dark");
    }
  }, []);

  useEffect(() => {
    const onKey = (e: KeyboardEvent) => {
      if (e.target instanceof HTMLInputElement || e.target instanceof HTMLTextAreaElement) return;
      if (e.key === "ArrowLeft" || e.key === "h") navigate(-1);
      if (e.key === "ArrowRight" || e.key === "l") navigate(1);
      if (e.key === "t") toggleTheme();
    };
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [navigate, toggleTheme]);

  return (
    <footer className="px-8 py-4 text-sm flex items-center justify-between">
      <span className="text-muted">v0.0.1</span>
      <div className="flex gap-6 text-muted">
        <span className="cursor-pointer" onClick={() => navigate(-1)}>
          <span className="text-accent">h</span> prev
        </span>
        <span className="cursor-pointer" onClick={() => navigate(1)}>
          <span className="text-accent">l</span> next
        </span>
        <span className="cursor-pointer" onClick={toggleTheme}>
          <span className="text-accent">t</span> theme
        </span>
      </div>
    </footer>
  );
}
