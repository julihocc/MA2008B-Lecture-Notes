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
#let definition = thmbox("definition", "Definition", fill: rgb("fff3e0"), stroke: rgb("e65100") + 1pt, base: "heading", breakable: true)

// Theorems
#let theorem = thmbox("theorem", "Theorem", fill: rgb("e8eaf6"), stroke: rgb("283593") + 1pt, base: "heading", breakable: true)

// Propositions
#let proposition = thmbox("proposition", "Proposition", fill: rgb("fce4ec"), stroke: rgb("880e4f") + 1pt, base: "heading", breakable: true)

// Corollaries
#let corollary = thmbox("corollary", "Corollary", fill: rgb("e0f2f1"), stroke: rgb("00695c") + 1pt, base: "heading", breakable: true)

// Examples
#let _example_inner = thmplain("example", "Example", base: "heading").with(numbering: "1.1")
#let example(..args) = {
  block(fill: luma(240), width: 100%, inset: 10pt, breakable: true, _example_inner(..args))
}

// Solved Problems (Schaum's Style)
#let solved_problem = thmbox(
  "solved_problem",
  "Solved Problem",
  fill: rgb("e6f3ff"),
  inset: 8pt,
  radius: 4pt,
  stroke: rgb("0074d9") + 1pt,
  base: "heading",
  breakable: true,
)

// Supplementary Problems (Schaum's Style)
#let supplementary = thmbox(
  "supplementary",
  "Supplementary Problem",
  fill: rgb("fffde7"),
  inset: 8pt,
  radius: 4pt,
  stroke: rgb("fbc02d") + 1pt,
  base: "heading",
  breakable: true,
)

// Exercises (Keeping for backward compatibility or generic use)
#let exercise = thmbox("exercise", "Exercise", fill: rgb("f3e5f5"), stroke: rgb("6a1b9a") + 1pt, base: "heading", breakable: true)

// Proofs
#let proof = thmproof("proof", "Proof")

// Solutions
#let solution = thmproof("solution", "Solution")
