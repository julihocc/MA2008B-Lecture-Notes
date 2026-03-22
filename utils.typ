#import "@preview/ctheorems:1.1.3": *

// Math sets
#let ZZ = $bb(Z)$
#let RR = $bb(R)$
#let QQ = $bb(Q)$
#let CC = $bb(C)$
#let NN = $bb(N)$

// Initialize the counters and rules. This function must be called in a show rule in lecture_notes.typ
// #show: thmrules

// Definitions
#let definition = thmbox(
	"definition",
	"Definition",
	fill: rgb("#F8FAFC"),
	stroke: (left: rgb("#0039A6") + 3pt, rest: rgb("#E2E8F0") + 0.5pt),
	radius: 2pt,
	inset: 12pt,
	base: "heading",
	breakable: true,
)

// Theorems
#let theorem = thmbox(
	"theorem",
	"Theorem",
	fill: rgb("#F8FAFC"),
	stroke: (left: rgb("#6366F1") + 3pt, rest: rgb("#E2E8F0") + 0.5pt),
	radius: 2pt,
	inset: 12pt,
	base: "heading",
	breakable: true,
)

// Propositions
#let proposition = thmbox(
	"proposition",
	"Proposition",
	fill: rgb("fce4ec"),
	stroke: rgb("880e4f") + 0.6pt,
	radius: 0pt,
	inset: 8pt,
	base: "heading",
	breakable: true,
)

// Corollaries
#let corollary = thmbox(
	"corollary",
	"Corollary",
	fill: rgb("e0f2f1"),
	stroke: rgb("00695c") + 0.6pt,
	radius: 0pt,
	inset: 8pt,
	base: "heading",
	breakable: true,
)

// Examples
#let _example_inner = thmplain("example", "Example", base: "heading").with(numbering: "1.1")
#let example(..args) = {
	block(
		fill: luma(240),
		stroke: luma(170) + 0.5pt,
		radius: 0pt,
		width: 100%,
		inset: 10pt,
		breakable: true,
		_example_inner(..args),
	)
}

// Solved Problems (Modern Refinement)
#let solved_problem = thmbox(
	"solved_problem",
	"Solved Problem",
	fill: rgb("#F8FAFC"),
	stroke: (left: rgb("#10B981") + 3pt, rest: rgb("#E2E8F0") + 0.5pt),
	radius: 2pt,
	inset: 12pt,
	base: "heading",
	breakable: true,
)

// Supplementary Problems (Schaum's Style Refined)
#let supplementary = thmbox(
	"supplementary",
	"Supplementary Problem",
	fill: rgb("#FFFBEB"),
	stroke: rgb("#F59E0B") + 0.6pt,
	radius: 0pt,
	inset: 10pt,
	base: "heading",
	breakable: true,
)

// Exercises (Schaum's Style Refined)
#let exercise = thmbox(
	"exercise",
	"Exercise",
	fill: rgb("#F1F5F9"),
	stroke: rgb("#64748B") + 0.6pt,
	radius: 0pt,
	inset: 10pt,
	base: "heading",
	breakable: true,
)

// Proofs
#let proof = thmproof("proof", "Proof")

// Solutions
#let solution = thmproof("solution", "Solution")
