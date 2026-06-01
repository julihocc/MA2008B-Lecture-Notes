# Group 602 Supplementary Exam Source Audit

Date: 2026-06-01

Checked file:
`exams/group_602_supplementary/group_602_exam_supplementary.typ`

Reference file:
`docs/lecture_notes-April-2026.pdf`

## Result

Every problem in the Group 602 supplementary exam is taken from a supplementary problem in `lecture_notes-April-2026.pdf`.

## Problem Mapping

| Exam question | Exam title | Source in April 2026 PDF | Status |
| --- | --- | --- | --- |
| Question 1 | 6.1 Directional Field Sign Analysis in a Cubic-Linear System | Supplementary Problem 6.1.4.2, PDF page 108 | Matches the supplementary problem. |
| Question 2 | 7.1 Constructing a Weighted Quadratic Lyapunov Function | Supplementary Problem 7.1.3.1, PDF page 116 | Matches the supplementary problem. |
| Question 3 | 7.2 Indirect Method and Stability Classification | Supplementary Problem 7.1.3.3, PDF pages 116-117 | Matches the supplementary problem. |
| Question 4 | 5.3 IVP with Time-Dependent Coefficients | Supplementary Problem 5.3.3.3, PDF page 103 | Uses the same IVP statement and adds a three-step grading scaffold: solve $x_1$, solve $x_2$, then apply the initial condition. |
| Question 5 | 8.1 Trace-Determinant Hopf Detection | Supplementary Problem 8.1.3.2, PDF page 123 | Matches the supplementary problem. |

## Change Made

Question 4 previously used the title "5.3 Time-Dependent Linear IVP". The mathematical IVP was the same as in the April 2026 PDF, but the title did not match the source supplementary problem. It was updated in both:

- `exams/group_602_supplementary/group_602_exam_supplementary.typ`
- `exams/group_602_supplementary/group_602_exam_supplementary_solutions.typ`

The updated prompt keeps the original supplementary IVP statement and adds a three-step scaffold to make grading easier. The scaffold separates solving each scalar equation before applying the initial condition:

```typst
#question(title: "5.3 IVP with Time-Dependent Coefficients")[
  Solve
  $ x' = A(t)x, quad A(t)=mat(1,0;0,-t), quad x(0)=mat(1;1). $
  1. Solve the scalar equation for $x_1(t)$ without using the initial condition.
  2. Solve the scalar equation for $x_2(t)$ without using the initial condition.
  3. Use the initial condition to determine the constants and write the solution vector $x(t)$.
]
```
