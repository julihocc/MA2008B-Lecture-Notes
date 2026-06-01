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
| Question 4 | 5.3 IVP with Time-Dependent Coefficients | Supplementary Problem 5.3.3.3, PDF page 103 | Updated to match the supplementary problem title and prompt wording. |
| Question 5 | 8.1 Trace-Determinant Hopf Detection | Supplementary Problem 8.1.3.2, PDF page 123 | Matches the supplementary problem. |

## Change Made

Question 4 previously used the title "5.3 Time-Dependent Linear IVP" and expanded the source prompt into three subitems. The mathematical IVP was the same as in the April 2026 PDF, but the wording was not strict. It was updated in both:

- `exams/group_602_supplementary/group_602_exam_supplementary.typ`
- `exams/group_602_supplementary/group_602_exam_supplementary_solutions.typ`

The updated prompt now reads:

```typst
#question(title: "5.3 IVP with Time-Dependent Coefficients")[
  Solve
  $ x' = A(t)x, quad A(t)=mat(1,0;0,-t), quad x(0)=mat(1;1). $
]
```

