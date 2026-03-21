#import "../../../utils.typ": *
== Global Stability of Metabolic Models (Lyapunov Direct Method)

=== Mathematical Review

#theorem[Lyapunov Direct Method for Bio-Systems][
  If there exists a continuously differentiable scalar function $V(x) > 0$ with $V(x^*) = 0$ at the equilibrium $x^*$, and $dot(V)(x) < 0$ along all trajectories of $x' = f(x)$, then $x^*$ is globally asymptotically stable.
]

#definition[Candidate Lyapunov Function for Glucose-Insulin][
  For the minimal model with equilibrium $(G^*, I^*)$, define:
  $ V(G, I) = (G - G^*)^2 + c (I - I^*)^2 $
  for some constant $c > 0$. Then $dot(V)$ is evaluated along the system trajectories. Negative definiteness of $dot(V)$ guarantees all glucose-insulin trajectories return to the healthy equilibrium.
]

=== Solved Problems

#solved_problem[Checking Negative Definiteness][
  For the linearized system $delta x' = J delta x$ near $P_1$, verify that the quadratic Lyapunov function $V = delta x^T P delta x$ yields $dot(V) = delta x^T (J^T P + P J) delta x < 0$ when $P$ is chosen as the identity (i.e., both eigenvalues of $J^T + J$ are negative).
]
#solution[
  Compute $J^T + J$ (the symmetric part of $J$). If all eigenvalues of this symmetric matrix are strictly negative, then $dot(V) < 0$ for all $delta x != 0$. This confirms local stability and, under appropriate conditions on the nonlinear terms, global stability.
]

=== Supplementary Problems

#supplementary[Energy Interpretation][
  Explain why $V(G, I)$ can be interpreted as the "metabolic energy distance" from the healthy state $(G^*, I^*)$, and what it means clinically when $dot(V) < 0$.
]
