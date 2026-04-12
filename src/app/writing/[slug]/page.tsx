import { getAllPosts, getPostMeta, getPostPath } from "@/lib/posts";
import { notFound } from "next/navigation";
import { NodeCompiler } from "@myriaddreamin/typst-ts-node-compiler";
import fs from "fs";
import path from "path";
import ClientSvg from "@/components/ClientSvg";

// Vercel's pre-rendered response body limit is 19.07 MB. The inlined SVG is
// written into both the static HTML and the RSC payload inside a <script>
// tag, so the on-disk .html ends up roughly 2–2.5× the SVG size. Keep the
// threshold conservative to stay well under the limit.
const INLINE_SVG_LIMIT = 5 * 1024 * 1024;

export function generateStaticParams() {
  return getAllPosts().map((post) => ({ slug: post.slug }));
}

function compileTypst(filePath: string): string {
  const compiler = NodeCompiler.create({
    workspace: path.join(process.cwd()),
  });
  let svg = compiler.svg({ mainFilePath: filePath });

  // Make colors inherit from CSS for theme support
  svg = svg.replaceAll('fill="#000"', 'fill="currentColor"');
  // Proof box fill — handled by CSS class below

  // Make SVG responsive
  svg = svg.replace(
    /width="[\d.]+" height="[\d.]+"/,
    'width="100%" height="auto"'
  );

  return svg;
}

function writeSvgToPublic(slug: string, svg: string): string {
  const dir = path.join(process.cwd(), "public", "generated", "writing");
  fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(path.join(dir, `${slug}.svg`), svg);
  return `/generated/writing/${slug}.svg`;
}

export default async function Post(props: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await props.params;
  let meta;
  try {
    meta = getPostMeta(slug);
  } catch {
    notFound();
  }

  const filePath = getPostPath(slug);
  const svg = compileTypst(filePath);
  const oversized = svg.length > INLINE_SVG_LIMIT;
  const svgUrl = oversized ? writeSvgToPublic(slug, svg) : null;

  return (
    <article className="max-w-2xl w-full self-start py-12 font-sans writing-article">
      <header className="mb-8">
        <h1 className="font-medium text-lg">{meta.title}</h1>
        {meta.description && (
          <p className="text-muted">{meta.description}</p>
        )}
        <time className="text-muted">{meta.date}</time>
      </header>
      {oversized && svgUrl ? (
        <ClientSvg src={svgUrl} className="typst-render text-fg" />
      ) : (
        <div
          className="typst-render text-fg"
          dangerouslySetInnerHTML={{ __html: svg }}
        />
      )}
    </article>
  );
}
