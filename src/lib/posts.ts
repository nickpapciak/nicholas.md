import fs from "fs";
import path from "path";

const CONTENT_DIR = path.join(process.cwd(), "content/writing");

export interface PostMeta {
  slug: string;
  title: string;
  date: string;
  description: string;
}

function parseTypstMeta(raw: string): { title: string; date: string; description: string } {
  const get = (key: string) =>
    raw.match(new RegExp(`^// ${key}: (.+)$`, "m"))?.[1]?.trim() ?? "";
  return { title: get("title"), date: get("date"), description: get("description") };
}

export function getAllPosts(): PostMeta[] {
  if (!fs.existsSync(CONTENT_DIR)) return [];
  return fs
    .readdirSync(CONTENT_DIR)
    .filter((f) => f.endsWith(".typ"))
    .map((file) => {
      const raw = fs.readFileSync(path.join(CONTENT_DIR, file), "utf-8");
      const data = parseTypstMeta(raw);
      return {
        slug: file.replace(/\.typ$/, ""),
        title: data.title || file,
        date: data.date,
        description: data.description,
      };
    })
    .sort((a, b) => new Date(b.date).getTime() - new Date(a.date).getTime());
}

export function getPostPath(slug: string): string {
  return path.join(CONTENT_DIR, `${slug}.typ`);
}

export function getPostMeta(slug: string): PostMeta {
  const file = getPostPath(slug);
  const raw = fs.readFileSync(file, "utf-8");
  const data = parseTypstMeta(raw);
  return {
    slug,
    title: data.title || slug,
    date: data.date,
    description: data.description,
  };
}
