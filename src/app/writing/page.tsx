import { getAllPosts } from "@/lib/posts";
import Link from "next/link";

export default function Writing() {
  const posts = getAllPosts();

  if (posts.length === 0) {
    return (
      <div className="max-w-md text-sm leading-relaxed text-muted">
        Coming soon.
      </div>
    );
  }

  return (
    <div className="max-w-lg w-full">
      <ul className="space-y-6 text-sm">
        {posts.map((post) => (
          <li key={post.slug}>
            <Link href={`/writing/${post.slug}`} className="group block">
              <span className="text-muted text-xs">{post.date}</span>
              <div className="group-hover:text-accent transition-colors">
                {post.title}
              </div>
              {post.description && (
                <div className="text-muted text-xs">{post.description}</div>
              )}
            </Link>
          </li>
        ))}
      </ul>
    </div>
  );
}
