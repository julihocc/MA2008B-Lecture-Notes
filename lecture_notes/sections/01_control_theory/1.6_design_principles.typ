#import "../../utils.typ": *
== Basic Design Principles of Control Systems

=== Mathematical Review

Control system design involves selecting components and parameters to satisfy performance, stability, and robustness specifications.

#definition[Design Specifications][
  Common metrics include:
  - *Rise Time ($t_r$):* Time to reach the vicinity of the final value.
  - *Settling Time ($t_s$):* Time to stay within a tolerance band (e.g., 2%).
  - *Percent Overshoot ($M_p$):* Peak value relative to steady state.
  - *Phase Margin / Gain Margin:* Measures of relative stability.
]

#theorem[PID Control][
  A Proportional-Integral-Derivative controller has the law:
  $ u(t) = K_p e(t) + K_i integral e(tau) d tau + K_d dot(e)(t) $
  - *P:* Improves speed.
  - *I:* Eliminates steady-state error.
  - *D:* Improves damping (reduces overshoot).
]

=== Solved Problems

#example[Parameter Selection for Damping][
  A second order system has characteristic equation $s^2 + 2 zeta omega_n s + omega_n^2 = 0$. Select $zeta$ for $M_p approx 5\%$.
]
#solution[
  Percentage overshoot is given by $M_p = e^(-pi zeta / sqrt(1 - zeta^2))$.
  For $M_p = 0.05$:
  $ ln(0.05) = -pi zeta / sqrt(1 - zeta^2) approx -3 $
  $ pi^2 zeta^2 approx 9(1 - zeta^2) => (pi^2 + 9) zeta^2 approx 9 $
  $ zeta approx sqrt(9/19) approx 0.69 $
  A damping ratio of $zeta approx 0.7$ typically gives $approx 5\%$ overshoot.
]

#example[Steady State Error][
  Find steady-state error for a unit step input with forward gain $G(s) = 10 / (s+1)$ in unity feedback.
]
#solution[
  System Type is 0 (no integrators in $G(s)$).
  Static position error constant $K_p = lim_(s -> 0) G(s) = 10 / 1 = 10$.
  Steady state error $e_("ss") = 1 / (1 + K_p) = 1 / 11$.
]

=== Supplementary Problems

#exercise[PID Tuning][
  Describe the Ziegler-Nichols tuning method for a PID controller.
]

#exercise[Root Locus Design][
  How does adding a pole at the origin affect the root locus and stability?
]
