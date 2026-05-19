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
#let grading_blank() = line(length: 100%, stroke: 0.45pt + black)

#let final_score_table() = {
  text(size: 9pt)[
    #table(
      columns: 2,
      inset: 5pt,
      stroke: 0.45pt + black,
      [*Correct selected problems*], [*Final score*],
      [0], [0/10],
      [1], [4/10],
      [2], [7/10],
      [3], [9/10],
      [4], [10/10],
    )
  ]
}

#let problem_grading_table() = {
  text(size: 9pt)[
    #table(
      columns: (0.65fr, 1fr, 1fr, 1.1fr),
      align: (center, center, center, center),
      inset: 5pt,
      stroke: 0.45pt + black,
      [*Problem*], [*Progress %*], [*Max points*], [*Awarded points*],
      [1], [#grading_blank()], [#grading_blank()], [#grading_blank()],
      [2], [#grading_blank()], [#grading_blank()], [#grading_blank()],
      [3], [#grading_blank()], [#grading_blank()], [#grading_blank()],
      [4], [#grading_blank()], [#grading_blank()], [#grading_blank()],
      [5], [#grading_blank()], [#grading_blank()], [#grading_blank()],
      [*Total*], [], [], [#grading_blank()],
    )
    #v(0.25em)
    #text(size: 8.5pt)[Awarded points = progress percentage $times$ maximum points.]
  ]
}

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

    *Writing Instructions.*
    - Start each selected problem on a new page. A single solution may continue across several pages if necessary, but do not write two different problem solutions on the same page.
    - At the top center of the first page of each selected solution, write the problem name exactly as it appears in the exam.
    - If one solution uses multiple pages, number those pages clearly, for example: "Page 1 of 3", "Page 2 of 3", "Page 3 of 3".
    - Write the selected problems in increasing question order.
    - Include the main computations or reasoning; unsupported final answers may not be counted as correct.
    - Clearly state the final answer or classification for each selected problem.

    #v(0.75em)

    *Grading Rule.*

    Partial credit may be awarded for partially correct selected problems. Fractional correctness is assigned to maximize the student's score using the same marginal weights: the first correct problem is worth 4 points, the second 3 points, the third 2 points, and the fourth 1 point. For example, one fully correct problem, one problem graded as $2/3$ correct, one problem graded as $1/3$ correct, and one problem graded as $0$ correct gives $4 + 3 dot (2/3) + 2 dot (1/3) + 1 dot 0 = 20/3 approx 6.67$ points out of 10.

    #v(0.75em)

    #grid(
      columns: (0.8fr, 1.8fr),
      gutter: 1.25em,
      [#final_score_table()],
      [#problem_grading_table()],
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
