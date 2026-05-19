// Math sets
#let ZZ = $bb(Z)$
#let RR = $bb(R)$
#let QQ = $bb(Q)$
#let CC = $bb(C)$
#let NN = $bb(N)$

#let exam(
  course: "MA2008B",
  title: "Exam",
  date: "",
  show_student_info: true,
  body
) = {
  set document(title: title)
  set page(
    paper: "us-letter",
    margin: (x: 1in, y: 1in),
    header: [
      #set text(10pt)
      #smallcaps(course) #h(1fr) #title #h(1fr) #date
      #v(-0.5em)
      #line(length: 100%, stroke: 0.5pt + black)
    ],
    numbering: "1",
  )
  
  // Set a clean, classic serif font for exams
  set text(size: 11pt)
  set par(justify: true, leading: 0.7em)

  align(center)[
    #text(16pt, weight: "bold")[#course] \
    #v(0.5em)
    #text(14pt)[#title] \
  ]
  
  if show_student_info {
    v(2em)
    grid(
      columns: (1fr, 1fr),
      gutter: 2em,
      [Name: #line(length: 100%, stroke: 0.5pt + black)],
      [Student ID: #line(length: 100%, stroke: 0.5pt + black)]
    )
    v(1em)
    [Date: #line(length: 50%, stroke: 0.5pt + black)]
  }
  
  v(3em)
  
  body
}

// Student-facing selection and grading policy
#let selection_grading_rule() = {
  block[
    *Problem Selection.* This exam contains five problems. Select exactly four problems to be graded by marking the corresponding boxes below. Only the selected problems will be graded.

    #grid(
      columns: (1fr, 1fr, 1fr, 1fr, 1fr),
      gutter: 1em,
      [$square$ Question 1],
      [$square$ Question 2],
      [$square$ Question 3],
      [$square$ Question 4],
      [$square$ Question 5],
    )

    #v(0.75em)

    *Writing Instructions.* Start each selected problem on a new page. A single solution may continue across several pages if necessary, but do not write two different problem solutions on the same page.

    #v(0.75em)

    *Grading Rule.*

    #table(
      columns: 2,
      [Correct selected problems], [Final score],
      [0], [0/10],
      [1], [4/10],
      [2], [7/10],
      [3], [9/10],
      [4], [10/10],
    )
  ]
}

// Question formatting
#let q_counter = counter("question")

#let question(title: none, body) = {
  q_counter.step()
  v(2em, weak: true)
  block(breakable: true)[
    #text(weight: "bold")[Question #context q_counter.display()] #if title != none [-- *#title*]
    #v(0.5em)
    #body
  ]
}

// Solution formatting (simple black bar on the left)
#let solution(body) = {
  v(1em)
  block(
    stroke: (left: 1.5pt + black),
    inset: (left: 10pt, top: 2pt, bottom: 2pt),
    breakable: true,
  )[
    *Solution:* \
    #body
  ]
}
