"use client";

import { useEffect, useState } from "react";

export default function ClientSvg({
  src,
  className,
}: {
  src: string;
  className?: string;
}) {
  const [svg, setSvg] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;
    fetch(src)
      .then((r) => r.text())
      .then((text) => {
        if (!cancelled) setSvg(text);
      });
    return () => {
      cancelled = true;
    };
  }, [src]);

  if (!svg) {
    return <div className={className} style={{ minHeight: "50vh" }} />;
  }

  return (
    <div className={className} dangerouslySetInnerHTML={{ __html: svg }} />
  );
}
