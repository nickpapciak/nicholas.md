import { getPost, getAllPosts } from "@/lib/posts";
import { MDXRemote } from "next-mdx-remote/rsc";
import remarkMath from "remark-math";
import rehypeKatex from "rehype-katex";
import { notFound } from "next/navigation";
import "katex/dist/katex.min.css";

export function generateStaticParams() {
  return getAllPosts().map((post) => ({ slug: post.slug }));
}

export default async function Post(props: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await props.params;
  let post;
  try {
    post = getPost(slug);
  } catch {
    notFound();
  }

  return (
    <article className="max-w-2xl w-full self-start py-12 font-sans writing-article">
      <header className="mb-8">
        <h1 className="font-medium text-lg">{post.meta.title}</h1>
        {post.meta.description && (
          <p className="text-muted">{post.meta.description}</p>
        )}
        <time className="text-muted">{post.meta.date}</time>
      </header>
      <div className="writing-content leading-relaxed">
        <MDXRemote
          source={post.content}
          options={{
            mdxOptions: {
              remarkPlugins: [remarkMath],
              rehypePlugins: [rehypeKatex as never],
            },
          }}
        />
      </div>
    </article>
  );
}
