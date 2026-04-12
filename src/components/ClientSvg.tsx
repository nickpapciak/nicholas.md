"use client";

import { useEffect, useState, type CSSProperties } from "react";

export default function ClientSvg({
  lightSrc,
  darkSrc,
  className,
}: {
  lightSrc: string;
  darkSrc: string;
  className?: string;
}) {
  const [isDark, setIsDark] = useState(false);
  const [lightLoaded, setLightLoaded] = useState(false);
  const [darkLoaded, setDarkLoaded] = useState(false);

  // Track the site's manual theme toggle on <html data-theme="...">.
  useEffect(() => {
    const read = () =>
      setIsDark(
        document.documentElement.getAttribute("data-theme") === "dark"
      );
    read();
    const observer = new MutationObserver(read);
    observer.observe(document.documentElement, {
      attributes: true,
      attributeFilter: ["data-theme"],
    });
    return () => observer.disconnect();
  }, []);

  const currentLoaded = isDark ? darkLoaded : lightLoaded;

  return (
    <div className={className} style={{ position: "relative" }}>
      {!currentLoaded && (
        <div className="svg-skeleton" aria-busy="true" aria-live="polite">
          {SKELETON_WIDTHS.map((w, i) => (
            <div
              key={i}
              className="svg-skeleton-bar"
              style={{ width: `${w}%` }}
            />
          ))}
        </div>
      )}
      {/* Both images are always in the DOM so both load in parallel. The
          inactive one is taken out of layout with position:absolute+opacity:0
          (never display:none, which can skip fetches). */}
      <img
        src={lightSrc}
        alt=""
        onLoad={() => setLightLoaded(true)}
        style={imgStyle(currentLoaded && !isDark)}
      />
      <img
        src={darkSrc}
        alt=""
        onLoad={() => setDarkLoaded(true)}
        style={imgStyle(currentLoaded && isDark)}
      />
    </div>
  );
}

function imgStyle(visible: boolean): CSSProperties {
  if (visible) {
    return { display: "block", width: "100%", height: "auto" };
  }
  return {
    position: "absolute",
    top: 0,
    left: 0,
    width: "100%",
    height: "auto",
    opacity: 0,
    pointerEvents: "none",
  };
}

// Randomized-looking widths to mimic real text wrapping.
const SKELETON_WIDTHS = [
  96, 88, 92, 74, 60, 95, 82, 90, 68, 40, 94, 86, 91, 78, 55, 93, 89, 72, 84,
  66, 45, 96, 80, 87, 70,
];
