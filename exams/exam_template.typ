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
  compact: false,
  body
) = {
  let page_margin = if compact { (x: 0.62in, y: 0.55in) } else { (x: 1in, y: 1in) }
  let body_text_size = if compact { 9.2pt } else { 10pt }
  let body_leading = if compact { 0.45em } else { 0.7em }
  let title_gap = if compact { 0.25em } else { 0.5em }
  let student_info_gap = if compact { 0.8em } else { 2em }
  let body_gap = if compact { 1em } else { 3em }

  set document(title: title)
  set page(
    paper: "us-letter",
    margin: page_margin,
    header: [
      #set text(10pt)
      #smallcaps(course) #h(1fr) #title #h(1fr) #date
      #v(-0.5em)
      #line(length: 100%, stroke: 0.5pt + black)
    ],
    numbering: "1",
  )
  
  // Set a clean, classic serif font for exams
  set text(size: body_text_size)
  set par(justify: true, leading: body_leading)

  align(center)[
    #text(16pt, weight: "bold")[#course] \
    #v(title_gap)
    #text(14pt)[#title] \
  ]
  
  if show_student_info {
    v(student_info_gap)
    grid(
      columns: (1fr, 1fr),
      gutter: 2em,
      [Name: #line(length: 100%, stroke: 0.5pt + black)],
      [Student ID: #line(length: 100%, stroke: 0.5pt + black)]
    )
    v(if compact { 0.45em } else { 1em })
    [Date: #line(length: 50%, stroke: 0.5pt + black)]
  }
  
  v(body_gap)
  
  body
}

// Student-facing selection and grading policy
#let grading_cell() = box(width: 100%, height: 1.15em)

#let final_score_table(compact: false) = {
  text(size: if compact { 9pt } else { 10pt })[
    #table(
      columns: 2,
      inset: if compact { 3pt } else { 4pt },
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

#let problem_grading_table(compact: false) = {
  text(size: if compact { 9pt } else { 10pt })[
    #table(
      columns: (0.65fr, 1fr, 1fr, 1.1fr),
      align: (center, center, center, center),
      inset: if compact { 3pt } else { 4pt },
      stroke: 0.45pt + black,
      [*Problem*], [*Progress %*], [*Max points*], [*Awarded points*],
      [1], [#grading_cell()], [#grading_cell()], [#grading_cell()],
      [2], [#grading_cell()], [#grading_cell()], [#grading_cell()],
      [3], [#grading_cell()], [#grading_cell()], [#grading_cell()],
      [4], [#grading_cell()], [#grading_cell()], [#grading_cell()],
      [5], [#grading_cell()], [#grading_cell()], [#grading_cell()],
      [*Total*], [], [], [#grading_cell()],
    )
    #v(0.25em)
    #text(size: 8.5pt)[Awarded points = progress percentage $times$ maximum points.]
  ]
}

#let selection_grading_rule(compact: false) = {
  let rule_text_size = if compact { 9.2pt } else { 10pt }
  let rule_leading = if compact { 0.42em } else { 0.55em }
  let rule_gap = if compact { 0.25em } else { 0.45em }

  block[
    #set text(size: rule_text_size)
    #set par(justify: true, leading: rule_leading)

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

    #v(rule_gap)

    *Writing Instructions.*
    - The maximum time allowed for the exam is 90 minutes.
    - Start each selected problem on a new page. A single solution may continue across several pages if necessary, but do not write two different problem solutions on the same page.
    - At the top center of the first page of each selected solution, write the problem name exactly as it appears in the exam.
    - If one solution uses multiple pages, number those pages clearly, for example: "Page 1 of 3", "Page 2 of 3", "Page 3 of 3".
    - Write the selected problems in increasing question order.
    - Include the main computations or reasoning; unsupported final answers may not be counted as correct.
    - Clearly state the final answer or classification for each selected problem.

    #v(rule_gap)

    *Grading Rule.*

    Partial credit may be awarded for partially correct selected problems. Fractional correctness is assigned to maximize the student's score using the same marginal weights: the first correct problem is worth 4 points, the second 3 points, the third 2 points, and the fourth 1 point. For example, one fully correct problem, one problem graded as $2/3$ correct, one problem graded as $1/3$ correct, and one problem graded as $0$ correct gives $4 + 3 dot (2/3) + 2 dot (1/3) + 1 dot 0 = 20/3 approx 6.67$ points out of 10.

    #v(rule_gap)

    #grid(
      columns: (0.8fr, 1.8fr),
      gutter: if compact { 0.75em } else { 1.25em },
      [#final_score_table(compact: compact)],
      [#problem_grading_table(compact: compact)],
    )
  ]
  if not compact {
    pagebreak()
  }
}

// Question formatting
#let q_counter = counter("question")

#let question(title: none, compact: false, body) = {
  q_counter.step()
  v(if compact { 0.9em } else { 2em }, weak: true)
  block(breakable: true)[
    #text(weight: "bold")[Question #context q_counter.display()] #if title != none [-- *#title*]
    #v(if compact { 0.25em } else { 0.5em })
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

#let solution_pagebreak() = pagebreak()
