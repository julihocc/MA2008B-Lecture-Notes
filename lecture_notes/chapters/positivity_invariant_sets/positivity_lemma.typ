#import "../../../utils.typ": *
== Positivity and Positive Invariance of the First Orthant

=== Mathematical Review

#definition[Biological Validity Constraint][
  Biological state variables — glucose $G$, insulin $I$, beta-cell mass $beta$ — are concentrations or counts and cannot be negative. A model is biologically valid only if:
  $ (G(0), I(0), beta(0)) in RR_+^3 arrow.r.double (G(t), I(t), beta(t)) in RR_+^3 quad forall t >= 0 $
]

#theorem[Lema 1 (Positive Invariance Condition)][
  The positive orthant $RR_+^n$ is positively invariant for $x' = f(x)$ if and only if at each boundary face $x_i = 0$:
  $ f_i(x_1, dots, x_(i-1), 0, x_(i+1), dots, x_n) >= 0 $
  for all $x_j >= 0$, $j != i$.
]

=== Solved Problems

#solved_problem[Glucose Boundary — Lema 1][
  Verify the glucose equation $G' = P_G - k_1 G - k_2 I G$ satisfies Lema 1 at $G = 0$.
]
#solution[
  At $G = 0$ with $I >= 0$:
  $ G'|_(G=0) = P_G - k_1(0) - k_2 I (0) = P_G > 0 $
  Since hepatic production $P_G > 0$, the vector field points strictly inward. $square$
]

#solved_problem[Insulin Boundary — Lema 1][
  Verify the insulin equation $I' = beta f(G) - gamma I$ satisfies Lema 1 at $I = 0$.
]
#solution[
  At $I = 0$ with $G >= 0$ and $beta >= 0$:
  $ I'|_(I=0) = beta f(G) - gamma(0) = beta f(G) >= 0 $
  Since $beta >= 0$ and $f(G) >= 0$ (the sigmoidal function is non-negative), the condition is satisfied. $square$
]

#solved_problem[Beta-Cell Boundary — Lema 1][
  Verify $beta' = beta(r(G) - d(G))$ at $beta = 0$.
]
#solution[
  At $beta = 0$:
  $ beta'|_(beta=0) = 0 dot (r(G) - d(G)) = 0 $
  The vector field is tangent to the boundary $beta = 0$ — not strictly inward. Therefore $beta = 0$ is an *absorbing boundary*: once all beta-cells are destroyed, the model cannot regenerate them. Biologically, this reflects the irreversibility of complete beta-cell apoptosis in advanced T1D.
]

=== Supplementary Problems

#supplementary[Strict vs. Non-Strict Invariance][
  Explain the clinical difference between the strict positive invariance of $G$ and $I$ (vector field points inward) versus the non-strict invariance of $beta$ (tangent boundary). What intervention is required biologically to cross the $beta = 0$ boundary?
]
