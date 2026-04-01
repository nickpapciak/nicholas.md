import BrailleAnimation from "@/components/BrailleAnimation";

export default function About() {
  return (
    <div className="flex flex-col sm:flex-row gap-8 items-center sm:items-start">
      <BrailleAnimation cols={8} rows={5} fps={12} className="text-2xl" />
      <div className="max-w-sm text-sm leading-relaxed">
        <p className="mb-4">
          Nicholas Papciak is a cofounder at{" "}
          <a
            href="https://datafruit.com"
            target="_blank"
            rel="noopener noreferrer"
            className="underline decoration-muted hover:text-accent transition-colors"
          >
            Datafruit
          </a>{" "}
          (YC S25) in San Francisco.
        </p>
        <p>
          He received his MS in Computer Science (Machine Learning) and BS in
          Computer Science (Intelligence &amp; Theory) from Georgia Institute of
          Technology.
        </p>
      </div>
    </div>
  );
}
