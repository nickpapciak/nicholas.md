"use client";

import { useEffect } from "react";

const emojis = ["🫠", "😄", "😳", "😶", "🤩", "🫡"];

export default function RandomFavicon() {
  useEffect(() => {
    const emoji = emojis[Math.floor(Math.random() * emojis.length)];
    const svg = `data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>${emoji}</text></svg>`;
    let link = document.querySelector<HTMLLinkElement>("link[rel='icon']");
    if (!link) {
      link = document.createElement("link");
      link.rel = "icon";
      document.head.appendChild(link);
    }
    link.href = svg;
  }, []);

  return null;
}
