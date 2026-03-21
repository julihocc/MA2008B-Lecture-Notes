#import "../../../utils.typ": *
== Physiological vs. Pathological Equilibria

=== Mathematical Review

#definition[Physiological Equilibrium][
  A stable equilibrium $P_1 = (G^*, I^*, beta^*)$ where $G^* approx 90$ mg/dL represents normal healthy homeostasis. Local asymptotic stability at $P_1$ implies the eigenvalues of the Jacobian $J(P_1)$ all have negative real parts.
]

#definition[Pathological Equilibrium][
  A stable equilibrium $P_3 = (G^(**)  , I^(**), beta^(**))$ where $G^(**) >> 90$ mg/dL and $beta^(**) approx 0$ represents severe hyperglycemia (Type 2 Diabetes). Trajectories trapped in the basin of attraction of $P_3$ cannot return to health without external intervention.
]

#definition[The Topp / Mohammed Model][
  An extended glucose-insulin system including beta-cell mass dynamics $beta(t)$:
  $ G' &= P_G - k_1 G - k_2 I G \
    I' &= beta f(G) - gamma I \
    beta' &= beta (r(G) - d(G)) $
  where $r(G)$ is the beta-cell replication rate and $d(G)$ is the apoptosis (death) rate. High chronic glucose increases $d(G)$, depleting $beta$ and trapping the system at $P_3$.
]

=== Solved Problems

#solved_problem[Finding the Equilibria P1, P2, P3][
  Explain geometrically how the three equilibrium points $P_1$ (healthy), $P_2$ (unstable saddle), and $P_3$ (diabetic) emerge from the intersection of the $G$-nullcline and $I$-nullcline in the phase plane.
]
#solution[
  Setting $G' = 0$ gives the $G$-nullcline: $I = (P_G - k_1 G)/(k_2 G)$, a hyperbola decreasing in $I$ as $G$ increases. Setting $I' = 0$ gives $I = beta f(G)/gamma$, an increasing sigmoidal curve. These two curves intersect at up to three points: $P_1$ (low $G$, stable), $P_2$ (intermediate $G$, saddle), and $P_3$ (high $G$, stable).
]

=== Supplementary Problems

#supplementary[Local Stability Classification][
  For each equilibrium point $P_1, P_2, P_3$, state the expected sign pattern of Jacobian eigenvalues ($lambda_1, lambda_2$) and identify the phase portrait type (stable node, saddle, unstable focus, etc.).
]
