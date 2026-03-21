#import "../../../utils.typ": *
== The Glucose-Insulin-Beta Cell Feedback Loop

=== Mathematical Review

The blood glucose regulation system is a canonical negative feedback control loop. The pancreatic Beta cells sense glucose, secrete insulin, which then drives glucose uptake in peripheral tissues.

#definition[Control System Analogy][
  - *Reference:* The basal glucose set-point $G_0 approx 90$ mg/dL.
  - *Sensor/Controller:* Beta-cell mass sensing $G$ and secreting insulin $I$.
  - *Actuator:* Insulin circulating in blood, promoting glucose uptake.
  - *Plant:* The bloodstream distributing glucose and insulin.
  - *Feedback:* Rising $I$ reduces $G$, closing the loop (negative feedback).
]

#definition[Minimal Model Structure][
  $ G' &= P_G - k_X G - S_I I G \
    I' &= beta f(G) - gamma I $
  where $P_G$ is hepatic glucose production, $k_X$ is insulin-independent clearance, $S_I$ is insulin sensitivity, $beta$ is beta-cell secretion gain, and $gamma$ is insulin decay.
]

=== Solved Problems

#solved_problem[Equilibrium of the Minimal Model][
  Set $G' = 0$ and $I' = 0$ to find the basal equilibrium $(G^*, I^*)$.
]
#solution[
  From $I' = 0$: $I^* = beta f(G^*)/gamma$.
  Substituting into $G' = 0$: $P_G = G^*(k_X + S_I I^*)$.
  This nonlinear equation in $G^*$ can be solved graphically (load line intersection) or numerically.
]

=== Supplementary Problems

#supplementary[Effect of Insulin Resistance][
  Let $S_I -> 0$. Show that for the same $P_G$, the equilibrium $G^*$ increases unboundedly, representing hyperglycemia.
]
