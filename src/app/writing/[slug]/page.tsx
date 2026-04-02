import { getAllPosts, getPostMeta, getPostPath } from "@/lib/posts";
import { notFound } from "next/navigation";
import { NodeCompiler } from "@myriaddreamin/typst-ts-node-compiler";
import path from "path";

export function generateStaticParams() {
  return getAllPosts().map((post) => ({ slug: post.slug }));
}

function compileTypst(filePath: string): string {
  const compiler = NodeCompiler.create({
    workspace: path.join(process.cwd()),
  });
  let svg = compiler.svg({ mainFilePath: filePath });

  // Make text color inherit from CSS for theme support
  svg = svg.replaceAll('fill="#000"', 'fill="currentColor"');

  // Make SVG responsive
  svg = svg.replace(
    /width="[\d.]+" height="[\d.]+"/,
    'width="100%" height="auto"'
  );

  return svg;
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

  return (
    <article className="max-w-2xl w-full self-start py-12 font-sans writing-article">
      <header className="mb-8">
        <h1 className="font-medium text-lg">{meta.title}</h1>
        {meta.description && (
          <p className="text-muted">{meta.description}</p>
        )}
        <time className="text-muted">{meta.date}</time>
      </header>
      <div
        className="typst-render text-fg"
        dangerouslySetInnerHTML={{ __html: svg }}
      />
    </article>
  );
}
