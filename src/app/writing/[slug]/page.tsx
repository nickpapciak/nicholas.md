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
  // Make text fills AND strokes (fraction bars, radicals, matrix brackets…)
  // inherit from CSS so theme colors apply.
  svg = svg.replaceAll('fill="#000"', 'fill="currentColor"');
  svg = svg.replaceAll('stroke="#000"', 'stroke="currentColor"');
  return svg;
}

// For inline rendering — strip the fixed width/height so the SVG fills its
// container. The browser uses viewBox for aspect ratio.
function makeResponsive(svg: string): string {
  return svg.replace(
    /width="[\d.]+" height="[\d.]+"/,
    'width="100%" height="auto"'
  );
}

// For <img>-loaded rendering — keep the intrinsic width/height from the
// Typst output so the browser can compute aspect ratio. Inject a theme color
// by merging into the root svg's existing `style` attribute (Typst output
// already has `style="overflow: visible;"`, so we can't just add a second
// style attribute — that's invalid XML and breaks SVG parsing).
function writeSvgFiles(
  slug: string,
  svg: string
): { light: string; dark: string } {
  const withColor = (hex: string, sourceSvg: string) => {
    const colorDecl = `color:${hex};`;
    if (/^<svg[^>]*\sstyle="/.test(sourceSvg)) {
      return sourceSvg.replace(/(<svg[^>]*\sstyle=")/, `$1${colorDecl}`);
    }
    return sourceSvg.replace(/<svg([^>]*)>/, `<svg$1 style="${colorDecl}">`);
  };

  // Hardcoded colors from the Typst template (proof box bg, section separator
  // strokes) don't follow `currentColor`. Swap them for dark-mode equivalents
  // in the dark file. The dark values mirror the CSS variables in globals.css.
  const darkSvg = svg
    .replaceAll('stroke="#e2e2e2"', 'stroke="#31302E"')
    .replaceAll('fill="#f0edde"', 'fill="#2A2926"')
    .replaceAll('fill="#F0EDDE"', 'fill="#2A2926"');

  const dir = path.join(process.cwd(), "public", "generated", "writing");
  fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(
    path.join(dir, `${slug}.light.svg`),
    withColor("#100F0F", svg)
  );
  fs.writeFileSync(
    path.join(dir, `${slug}.dark.svg`),
    withColor("#CECDC3", darkSvg)
  );

  return {
    light: `/generated/writing/${slug}.light.svg`,
    dark: `/generated/writing/${slug}.dark.svg`,
  };
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
  const urls = oversized ? writeSvgFiles(slug, svg) : null;

  return (
    <article className="max-w-2xl w-full self-start py-12 font-sans writing-article">
      <header className="mb-8">
        <h1 className="font-medium text-lg">{meta.title}</h1>
        {meta.description && (
          <p className="text-muted">{meta.description}</p>
        )}
        <time className="text-muted">{meta.date}</time>
      </header>
      {oversized && urls ? (
        <ClientSvg
          lightSrc={urls.light}
          darkSrc={urls.dark}
          className="typst-render text-fg"
        />
      ) : (
        <div
          className="typst-render text-fg"
          dangerouslySetInnerHTML={{ __html: makeResponsive(svg) }}
        />
      )}
    </article>
  );
}
