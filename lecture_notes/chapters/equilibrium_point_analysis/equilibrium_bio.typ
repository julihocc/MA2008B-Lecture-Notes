#import "../../../utils.typ": *
== Physiological vs. Pathological Equilibria

=== Mathematical Review

#definition[Physiological Equilibrium $P_1$][
  A stable equilibrium where $G^* approx 90$ mg/dL. Local asymptotic stability at $P_1$ implies all eigenvalues of the Jacobian $J(P_1)$ have strictly negative real parts.
]

#definition[Pathological Equilibrium $P_3$][
  A stable equilibrium where $G^(**) >> 90$ mg/dL and $beta^(**) approx 0$, representing Type 2 Diabetes. Trajectories trapped in the basin of attraction of $P_3$ cannot return to health without external intervention.
]

#definition[The Topp / Mohammed Model][
  An extended glucose-insulin system including beta-cell mass dynamics $beta(t)$:
  $ G' &= P_G - k_1 G - k_2 I G \
    I' &= beta f(G) - gamma I \
    beta' &= beta (r(G) - d(G)) $
  where $r(G)$ is beta-cell replication and $d(G)$ is apoptosis. Chronic hyperglycaemia increases $d(G)$, depleting $beta$ and driving the system to $P_3$.
]

=== Solved Problems

#solved_problem[Geometric Location of P1, P2, P3][
  Explain how the three equilibrium points emerge from the phase-plane nullclines.
]
#solution[
  Setting $G' = 0$: $I = (P_G - k_1 G)/(k_2 G)$ — a decreasing hyperbola.
  Setting $I' = 0$: $I = beta f(G)/gamma$ — an increasing sigmoidal curve.
  These intersect at up to three points: $P_1$ (low G, stable node), $P_2$ (intermediate G, unstable saddle), $P_3$ (high G, stable node).
]

#solved_problem[Step-by-Step Numerical P1, P2, P3 (RMIB 2024 Parameters)][
  Using RMIB 2024 nominal parameters: $P_G = 864$ mg/dL/day, $k_1 = 6.6$ $"day"^(-1)$, $k_2 = 36$ dL/(mg$dot$day), $gamma = 0.2$ $"day"^(-1)$, $beta_0 = 1.0$, $f(G) = G^2/(13000 + G^2)$. Find the three equilibria numerically by finding the roots of the load-line equation.
]
#solution[
  At equilibrium, combine $G' = 0$ and $I' = 0$:
  $ P_G - k_1 G - k_2 dot (beta_0 f(G)) / gamma dot G = 0 $
  Substituting $f(G) = G^2/(13000 + G^2)$:
  $ 864 = G dot (6.6 + 36 dot 1/(0.2) dot G^2/(13000 + G^2)) $
  Solving numerically:
  - $P_1$: $G_1^* approx 100$ mg/dL (physiological — healthy)
  - $P_2$: $G_2^* approx 250$ mg/dL (unstable saddle — threshold)
  - $P_3$: $G_3^* approx 600$ mg/dL (pathological — diabetic)

  *Note:* The precise values depend sensitively on $beta_0$. As beta-cell mass depletes ($beta_0 -> 0$), $P_1$ and $P_2$ merge and annihilate (saddle-node bifurcation), leaving only the diabetic $P_3$.
]

=== Supplementary Problems

#supplementary[Jacobian Eigenvalue Classification][
  For each of $P_1$, $P_2$, $P_3$, compute the $2 times 2$ Jacobian of the $(G, I)$ subsystem (treating $beta$ as fixed) and classify the equilibrium type from the sign pattern of eigenvalues.
]
