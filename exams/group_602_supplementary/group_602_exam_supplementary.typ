#import "../exam_template.typ": *

#show: exam.with(
  title: "Exam for Group 602",
  date: "",
)

_Covering Sections 6.1, 7.1, 7.2, 5.3, and 8.1_

#selection_grading_rule()

#question(title: "6.1 Directional Field Sign Analysis in a Cubic-Linear System")[
  Consider the planar nonlinear system:
  $ x' &= x - x^3 - y \ y' &= mu (x - y) $
  with parameter $mu > 0$.
  1. Compute the $x$-nullcline and $y$-nullcline equations.
  2. Determine all equilibrium points as functions of $mu$.
  3. Partition the phase plane using nullclines and determine the sign of $(x', y')$ in each region.
  4. State whether the first and third quadrants are forward invariant and justify your answer mathematically.
  *Hint:* Use nullcline intersections to form sign regions and test the vector field orientation on each boundary.
]

#question(title: "7.1 Constructing a Weighted Quadratic Lyapunov Function")[
  Consider the linearized system $delta x' = J delta x$ with $delta x = (delta x_1, delta x_2)^T$.
  1. Propose a weighted quadratic candidate $V = p_1 (delta x_1)^2 + p_2 (delta x_2)^2$ with $p_1, p_2 > 0$.
  2. Compute $dot(V)$ explicitly in terms of the entries of $J$.
  3. Derive sufficient inequalities on $p_1, p_2$ that make $dot(V)$ negative definite.
  4. Interpret how changing $p_1/p_2$ changes the relative penalization of state deviations.
  *Hint:* Write $dot(V)$ as a quadratic form in $(delta G, delta I)$ and apply definiteness conditions.
]

#question(title: "7.2 Indirect Method and Stability Classification")[
  Let the Jacobian at an equilibrium be
  $ J = mat(a, b; c, d). $
  1. Express the trace and determinant of $J$.
  2. Write the linear stability conditions in terms of $text("tr")(J)$ and $det(J)$.
  3. Classify the equilibrium type for each case: (i) $det(J) < 0$, (ii) $det(J) > 0$ and $text("tr")(J) < 0$, (iii) $det(J) > 0$ and $text("tr")(J) > 0$.
  4. Explain why linear asymptotic stability supports a local Lyapunov argument for the nonlinear model.
  *Hint:* Start with the characteristic polynomial $lambda^2 - text("tr")(J) lambda + det(J)=0$.
]

#question(title: "5.3 IVP with Time-Dependent Coefficients")[
  Solve
  $ x' = A(t)x, quad A(t)=mat(1,0;0,-t), quad x(0)=mat(1;1). $
]

#question(title: "8.1 Trace-Determinant Hopf Detection")[
  Consider a planar parameterized system with Jacobian at equilibrium
  $ J(mu) = mat(a(mu), b(mu); c(mu), d(mu)). $
  1. Write $tau(mu) = text("tr")(J(mu))$ and $Delta(mu) = det(J(mu))$.
  2. State the algebraic Hopf conditions in terms of $tau(mu)$ and $Delta(mu)$.
  3. Explain why the transversality condition $d tau / d mu != 0$ at $mu = mu_c$ is required.
  4. Classify whether the equilibrium is locally stable or unstable for $tau < 0$ and $tau > 0$, assuming $Delta > 0$.
  *Hint:* For Hopf in 2D, enforce $Delta(mu_c) > 0$, $tau(mu_c)=0$, and sign-changing trace near $mu_c$.
]
