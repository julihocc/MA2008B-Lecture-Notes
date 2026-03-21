#import "../../../utils.typ": *
== Human-in-the-Loop: Epinephrine and Exogenous Disturbances

=== Mathematical Review

Designing control for bio-medical devices requires accounting for human physiology as a time-varying, uncertain plant subject to extreme exogenous disturbances.

#definition[Epinephrine as a Disturbance Input][
  Psychological or physiological stress triggers Epinephrine release, acting as a large disturbance $D(t)$ on the glucose-insulin loop:
  1. Hepatic glucose production increases: $P_G -> P_G + P_(G,e)(E)$.
  2. Beta-cell insulin secretion is suppressed: $beta -> beta(1 - alpha E)$.
  3. Peripheral insulin sensitivity decreases: $S_I -> S_I - rho E$.
]

#definition[Parameter Identification][
  Since biological parameters (e.g., $S_I$, $gamma$, $beta$) vary significantly between patients, clinical data ($G(t)$, $I(t)$ time series from blood draws) is used to identify personalized parameters by minimizing the least-squares fit:
  $ min_theta sum_i (y(t_i) - hat(y)(t_i; theta))^2 $
]

=== Solved Problems

#solved_problem[Disturbance Rejection Design][
  Describe qualitatively how a closed-loop insulin pump should respond to a sudden Epinephrine spike that raises $G$ by $80$ mg/dL within 5 minutes.
]
#solution[
  The pump must react with:
  - *Derivative action (D):* Detect the rapid rate-of-rise $G' >> 0$ and immediately deliver an extra bolus to counteract the glucose spike.
  - *Integral action (I):* Maintain a slightly elevated basal infusion rate until glucose returns to within the homeostatic band $[70, 140]$ mg/dL.
]

=== Supplementary Problems

#supplementary[Uncertainty in $S_I$][
  If $S_I$ is uncertain by $plus.minus 30%$, how should the proportional gain $K_p$ of the insulin pump PID controller be adjusted to maintain stability despite this uncertainty?
]
