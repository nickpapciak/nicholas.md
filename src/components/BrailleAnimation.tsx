"use client";

import { useState, useEffect, useRef, useCallback } from "react";

// Braille unicode encoding: U+2800 is blank
// Each character is a 2x4 dot grid, dots map to bits:
//   (col0,row0)=1   (col1,row0)=8
//   (col0,row1)=2   (col1,row1)=16
//   (col0,row2)=4   (col1,row2)=32
//   (col0,row3)=64  (col1,row3)=128
const DOTS = [
  [1, 8],
  [2, 16],
  [4, 32],
  [64, 128],
];

type PixelFn = (
  x: number,
  y: number,
  t: number,
  w: number,
  h: number
) => boolean;

const animations: Record<string, PixelFn> = {
  breathe: (x, y, t, w, h) => {
    const cx = (w - 1) / 2;
    const cy = (h - 1) / 2;
    const dist = Math.sqrt((x - cx) ** 2 + (y - cy) ** 2);
    const maxR = Math.min(w, h) / 2 - 0.5;
    const radius = (Math.sin(t * 0.1) * 0.5 + 0.5) * maxR + 1.5;
    return dist <= radius;
  },

  orbit: (x, y, t, w, h) => {
    const cx = (w - 1) / 2;
    const cy = (h - 1) / 2;
    const r = Math.min(w, h) * 0.32;
    for (let i = 0; i < 3; i++) {
      const angle = t * 0.14 + (i * Math.PI * 2) / 3;
      const ox = cx + Math.cos(angle) * r;
      const oy = cy + Math.sin(angle) * r;
      if ((x - ox) ** 2 + (y - oy) ** 2 < 2.8) return true;
    }
    return false;
  },

  wave: (x, y, t, w, h) => {
    const mid = (h - 1) / 2;
    const waveY = Math.sin((x / w) * Math.PI * 2.5 - t * 0.13) * (h * 0.3) + mid;
    const waveY2 =
      Math.sin((x / w) * Math.PI * 2.5 - t * 0.13 + 1.5) * (h * 0.2) + mid;
    return Math.abs(y - waveY) < 1.3 || Math.abs(y - waveY2) < 0.8;
  },

  rain: (x, y, t, _w, h) => {
    for (let i = 0; i < 18; i++) {
      const dropX = ((i * 7 + 3) * 13) % 16;
      const speed = 0.25 + ((i * 11) % 7) * 0.08;
      const offset = ((i * 19 + 7) % 23) * 4;
      const dropY = ((t * speed + offset) % (h + 8)) - 4;
      if (Math.abs(x - dropX) < 0.6 && y >= dropY - 1.5 && y <= dropY) {
        return true;
      }
    }
    return false;
  },

  sparkle: (x, y, t) => {
    const frame = Math.floor(t * 0.4);
    const h1 = (((x + 1) * 7919 + (y + 1) * 104729 + frame * 31) >>> 0) % 997;
    const h2 =
      (((x + 1) * 2393 + (y + 1) * 7877 + (frame - 1) * 31) >>> 0) % 997;
    return h1 < 28 || h2 < 14;
  },

  helix: (x, y, t, w, h) => {
    const cx = (w - 1) / 2;
    const r = w * 0.35;
    const normalY = y / h;
    const angle = normalY * Math.PI * 3.5 - t * 0.1;
    const s1x = cx + Math.sin(angle) * r;
    const s2x = cx - Math.sin(angle) * r;
    return Math.abs(x - s1x) < 1.1 || Math.abs(x - s2x) < 1.1;
  },

  columns: (x, y, t, w, h) => {
    const phase = (x / w) * Math.PI * 4 - t * 0.12;
    const fill = (Math.sin(phase) * 0.5 + 0.5) * h;
    return y >= h - fill;
  },
};

const ANIM_NAMES = Object.keys(animations);

interface Props {
  cols?: number;
  rows?: number;
  fps?: number;
  className?: string;
}

export default function BrailleAnimation({
  cols = 8,
  rows = 5,
  fps = 12,
  className = "",
}: Props) {
  const [frame, setFrame] = useState(0);
  const [animIndex, setAnimIndex] = useState(0);
  const rafRef = useRef<number>(0);
  const lastRef = useRef(0);
  const interval = 1000 / fps;

  useEffect(() => {
    const tick = (time: number) => {
      if (time - lastRef.current >= interval) {
        setFrame((f) => f + 1);
        lastRef.current = time;
      }
      rafRef.current = requestAnimationFrame(tick);
    };
    rafRef.current = requestAnimationFrame(tick);
    return () => cancelAnimationFrame(rafRef.current);
  }, [interval]);

  const handleClick = useCallback(() => {
    setAnimIndex((i) => (i + 1) % ANIM_NAMES.length);
    setFrame(0);
  }, []);

  const animFn = animations[ANIM_NAMES[animIndex]];
  const pw = cols * 2;
  const ph = rows * 4;

  const lines: string[] = [];
  for (let row = 0; row < rows; row++) {
    let line = "";
    for (let col = 0; col < cols; col++) {
      let code = 0x2800;
      for (let dy = 0; dy < 4; dy++) {
        for (let dx = 0; dx < 2; dx++) {
          if (animFn(col * 2 + dx, row * 4 + dy, frame, pw, ph)) {
            code += DOTS[dy][dx];
          }
        }
      }
      line += String.fromCharCode(code);
    }
    lines.push(line);
  }

  return (
    <div
      className={`leading-none select-none cursor-pointer text-accent/60 ${className}`}
      onClick={handleClick}
      title="click to change animation"
      aria-hidden="true"
    >
      {lines.map((line, i) => (
        <div key={i}>{line}</div>
      ))}
    </div>
  );
}
