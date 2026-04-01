import BrailleAnimation from "@/components/BrailleAnimation";

export default function About() {
  return (
    <div className="flex flex-col sm:flex-row gap-8 items-center sm:items-start">
      <BrailleAnimation cols={8} rows={5} fps={12} className="text-2xl" />
      <div className="max-w-sm text-sm leading-relaxed">
        <p className="mb-4">
          I&apos;m Nicholas, an aspiring computer scientist. I say{" "}
          <em>aspiring</em>{" "}because so far I&apos;ve only really been an
          engineer.
        </p>
        <p className="mb-4">
          Now, I&apos;m working on{" "}
          <a
            href="https://datafruit.ai"
            target="_blank"
            rel="noopener noreferrer"
            className="underline decoration-muted hover:text-accent"
          >
            Datafruit
          </a>
          . Before, I studied computer science at Georgia Tech.
        </p>
      </div>
    </div>
  );
}
