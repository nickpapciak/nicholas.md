const links = [
  {
    label: "Website",
    value: "nicholas.md",
    href: "https://nicholas.md",
  },
  {
    label: "X/Twitter",
    value: "@completely_np",
    href: "https://twitter.com/completely_np",
  },
  {
    label: "LinkedIn",
    value: "/in/nickpapciak",
    href: "https://linkedin.com/in/nickpapciak",
  },
  {
    label: "GitHub",
    value: "@nickpapciak",
    href: "https://github.com/nickpapciak",
  },
];

export default function Links() {
  return (
    <div className="grid grid-cols-2 gap-x-16 gap-y-8 text-sm">
      {links.map((link) => (
        <a
          key={link.href}
          href={link.href}
          target="_blank"
          rel="noopener noreferrer"
          className="group"
        >
          <div className="font-medium">{link.label}</div>
          <div className="text-muted group-hover:text-accent transition-colors">
            {link.value}
          </div>
        </a>
      ))}
    </div>
  );
}
