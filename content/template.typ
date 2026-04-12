#import "@preview/ctheorems:1.1.3": *

#let accent = rgb("#DA702C")

#let theorem = thmplain("theorem", "Theorem", titlefmt: strong)
#let definition = thmplain("definition", "Definition", titlefmt: strong)
#let remark = thmplain("remark", "Remark", titlefmt: strong)
#let proof(body) = block(
  width: 100%,
  fill: rgb("#F0EDDE"),
  inset: 12pt,
  radius: 4pt,
  [*Proof.* #body #h(1fr) $square.filled$]
)

#let post(body) = {
  set page(width: 480pt, height: auto, margin: (x: 0pt, top: 0pt, bottom: 8pt))
  set text(size: 13pt)
  set par(justify: true, leading: 0.65em)
  set heading(numbering: none)
  show heading.where(level: 1): set text(size: 13pt, weight: 600)
  show heading.where(level: 1): it => { v(12pt); it; v(4pt) }
  show: thmrules.with(qed-symbol: $square.filled$)
  show link: it => underline(text(fill: accent, it))
  body
}
