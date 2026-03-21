#import "../../../utils.typ": *
== Positivity and Positive Invariance of the First Orthant

=== Mathematical Review

#definition[Biological Validity Constraint][
  Since variables like glucose concentration $G$, insulin level $I$, and beta-cell mass $beta$ cannot be negative, any valid biological model must satisfy: if $(G(0), I(0), beta(0)) in RR_+^3$, then $(G(t), I(t), beta(t)) in RR_+^3$ for all $t >= 0$.
]

#theorem[Lema 1 (Positive Invariance Condition)][
  The positive orthant $RR_+^n$ is positively invariant for $x' = f(x)$ if and only if:
  $ f_i(x_1, dots, x_(i-1), 0, x_(i+1), dots, x_n) >= 0 $
  for all $x_j >= 0$ ($j != i$), at each boundary face $x_i = 0$.
]

=== Solved Problems

#solved_problem[Verifying Positivity of the Glucose Equation][
  Prove that $G' = P_G - k_1 G - k_2 I G$ satisfies Lema 1 at $G = 0$.
]
#solution[
  Evaluate $G'$ at $G = 0$ with $I >= 0$:
  $ G'|_(G=0) = P_G - k_1(0) - k_2 I (0) = P_G > 0 $
  Since $P_G > 0$, the vector field points strictly into the interior of $RR_+^3$ at $G = 0$. Condition satisfied. $square$
]

=== Supplementary Problems

#supplementary[Beta-Cell Boundary][
  Apply Lema 1 to the beta-cell equation $beta' = beta(r(G) - d(G))$ at $beta = 0$. Is the positive orthant strictly invariant? What does the result mean biologically?
]
