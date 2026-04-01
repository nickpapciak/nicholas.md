"use client";

import { useState, useEffect, useRef, useCallback } from "react";

// Braille unicode: U+2800 is blank, each char is 2x4 dots
// Dot-to-bit mapping:
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

function makeGrid(w: number, h: number): boolean[][] {
  return Array.from({ length: h }, () => new Array(w).fill(false));
}

function hash(a: number, b: number, seed: number): number {
  let h = (seed * 374761393 + a * 668265263 + b * 2147483647) | 0;
  h = Math.imul(h ^ (h >>> 13), 1274126177);
  h = (h ^ (h >>> 16)) >>> 0;
  return h;
}

// R-pentomino: a classic long-lived Game of Life pattern
function seedRPentomino(grid: boolean[][], w: number, h: number, seed: number) {
  for (let y = 0; y < h; y++) grid[y].fill(false);
  // Place several r-pentominoes at hashed positions for a busy grid
  const count = 3 + (seed % 3);
  for (let i = 0; i < count; i++) {
    const cx = (hash(i, 0, seed) % (w - 4)) + 2;
    const cy = (hash(0, i, seed) % (h - 4)) + 2;
    // R-pentomino shape:  .##
    //                     ##.
    //                     .#.
    const cells = [[0,1],[0,2],[1,0],[1,1],[2,1]];
    for (const [dy, dx] of cells) {
      const py = (cy + dy) % h;
      const px = (cx + dx) % w;
      grid[py][px] = true;
    }
  }
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
interface AnimState { grid: boolean[][]; [k: string]: any }

interface Animation {
  name: string;
  init(w: number, h: number): AnimState;
  step(s: AnimState, t: number, w: number, h: number): void;
}

const ANIMATIONS: Animation[] = [
  // 1. Conway's Game of Life
  {
    name: "game of life",
    init(w, h) {
      const grid = makeGrid(w, h);
      seedRPentomino(grid, w, h, 0);
      return { grid, prevHash: "", stale: 0, seed: 1 };
    },
    step(s, _t, w, h) {
      const next = makeGrid(w, h);
      for (let y = 0; y < h; y++) {
        for (let x = 0; x < w; x++) {
          let n = 0;
          for (let dy = -1; dy <= 1; dy++)
            for (let dx = -1; dx <= 1; dx++) {
              if (!dx && !dy) continue;
              if (s.grid[(y + dy + h) % h][(x + dx + w) % w]) n++;
            }
          next[y][x] = s.grid[y][x] ? n === 2 || n === 3 : n === 3;
        }
      }
      const checksum = next.flat().reduce((a, v, i) => a + (v ? i : 0), 0);
      s.stale = checksum === s.prevHash ? s.stale + 1 : 0;
      s.prevHash = checksum;
      if (s.stale > 5) {
        seedRPentomino(next, w, h, 0);
        s.stale = 0;
      }
      s.grid = next;
    },
  },

  // 2. Rain
  {
    name: "rain",
    init(w, h) { return { grid: makeGrid(w, h) }; },
    step(s, t, _w, h) {
      const pw = s.grid[0].length;
      for (let y = 0; y < h; y++) s.grid[y].fill(false);
      for (let i = 0; i < 18; i++) {
        const dropX = ((i * 7 + 3) * 13) % pw;
        const speed = 0.25 + ((i * 11) % 7) * 0.08;
        const offset = ((i * 19 + 7) % 23) * 4;
        const dropY = ((t * speed + offset) % (h + 8)) - 4;
        for (let y = 0; y < h; y++) {
          if (y >= dropY - 1.5 && y <= dropY && Math.abs(dropX - Math.round(dropX)) < 0.6) {
            const gx = Math.round(dropX);
            if (gx >= 0 && gx < pw) s.grid[y][gx] = true;
          }
        }
      }
    },
  },

  // 3. Langton's Ant
  {
    name: "langton's ant",
    init(w, h) {
      return {
        grid: makeGrid(w, h),
        ax: Math.floor(w / 2), ay: Math.floor(h / 2), ad: 0,
      };
    },
    step(s, _t, w, h) {
      const DX = [0, 1, 0, -1], DY = [-1, 0, 1, 0];
      for (let i = 0; i < 10; i++) {
        const on = s.grid[s.ay][s.ax];
        s.ad = on ? (s.ad + 3) % 4 : (s.ad + 1) % 4;
        s.grid[s.ay][s.ax] = !on;
        s.ax = ((s.ax + DX[s.ad]) % w + w) % w;
        s.ay = ((s.ay + DY[s.ad]) % h + h) % h;
      }
    },
  },

  // 4. Wave interference
  {
    name: "wave interference",
    init(w, h) { return { grid: makeGrid(w, h) }; },
    step(s, t, w, h) {
      const sources = [
        { x: w * 0.25 + Math.sin(t * 0.047) * w * 0.18, y: h * 0.3 + Math.cos(t * 0.067) * h * 0.18 },
        { x: w * 0.75 + Math.cos(t * 0.053) * w * 0.18, y: h * 0.6 + Math.sin(t * 0.041) * h * 0.18 },
        { x: w * 0.5 + Math.sin(t * 0.037) * w * 0.22, y: h * 0.85 + Math.cos(t * 0.059) * h * 0.1 },
      ];
      for (let y = 0; y < h; y++)
        for (let x = 0; x < w; x++) {
          let v = 0;
          for (const p of sources) v += Math.sin(Math.hypot(x - p.x, y - p.y) * 0.9 - t * 0.2);
          s.grid[y][x] = v > 0.3;
        }
    },
  },

  // 5. Lissajous curves
  {
    name: "lissajous",
    init(w, h) { return { grid: makeGrid(w, h) }; },
    step(s, t, w, h) {
      for (let y = 0; y < h; y++) s.grid[y].fill(false);
      const a = 3 + Math.sin(t * 0.008) * 2;
      const b = 2 + Math.cos(t * 0.011) * 1.5;
      const delta = t * 0.03;
      for (let i = 0; i < 400; i++) {
        const theta = (i / 400) * Math.PI * 2;
        const gx = Math.round((Math.sin(a * theta + delta) + 1) / 2 * (w - 1));
        const gy = Math.round((Math.sin(b * theta) + 1) / 2 * (h - 1));
        if (gx >= 0 && gx < w && gy >= 0 && gy < h) s.grid[gy][gx] = true;
      }
    },
  },
];

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
  const pw = cols * 2;
  const ph = rows * 4;
  const [animIndex, setAnimIndex] = useState(0);
  const stateRef = useRef<AnimState | null>(null);
  const frameRef = useRef(0);
  const [, rerender] = useState(0);

  // Init state eagerly on first render, then via effect on changes
  if (!stateRef.current) {
    stateRef.current = ANIMATIONS[animIndex].init(pw, ph);
  }
  useEffect(() => {
    stateRef.current = ANIMATIONS[animIndex].init(pw, ph);
    frameRef.current = 0;
  }, [animIndex, pw, ph]);

  // Render loop
  useEffect(() => {
    let raf: number;
    let last = 0;
    const ms = 1000 / fps;
    const tick = (now: number) => {
      if (now - last >= ms && stateRef.current) {
        ANIMATIONS[animIndex].step(stateRef.current, frameRef.current, pw, ph);
        frameRef.current++;
        rerender((n) => n + 1);
        last = now;
      }
      raf = requestAnimationFrame(tick);
    };
    raf = requestAnimationFrame(tick);
    return () => cancelAnimationFrame(raf);
  }, [animIndex, fps, pw, ph]);

  const handleClick = useCallback(() => {
    setAnimIndex((i) => (i + 1) % ANIMATIONS.length);
  }, []);

  // Encode pixel grid → braille characters
  const state = stateRef.current;
  if (!state) return null;

  const lines: string[] = [];
  for (let r = 0; r < rows; r++) {
    let line = "";
    for (let c = 0; c < cols; c++) {
      let code = 0x2800;
      for (let dy = 0; dy < 4; dy++)
        for (let dx = 0; dx < 2; dx++) {
          const py = r * 4 + dy, px = c * 2 + dx;
          if (state.grid[py]?.[px]) code += DOTS[dy][dx];
        }
      line += String.fromCharCode(code);
    }
    lines.push(line);
  }

  return (
    <div
      className={`leading-none select-none cursor-pointer text-accent/60 ${className}`}
      onClick={handleClick}

      aria-hidden="true"
    >
      {lines.map((line, i) => (
        <div key={i}>{line}</div>
      ))}
    </div>
  );
}
