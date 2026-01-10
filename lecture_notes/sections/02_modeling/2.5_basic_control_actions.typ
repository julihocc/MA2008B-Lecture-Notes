#import "../../utils.typ": *
== Basic Control Actions

=== Mathematical Review

Control actions define how the controller responds to error signals.

#definition[Proportional Action (P)][
  Output is proportional to error:
  $ u(t) = K_p e(t) $
  - *Advantage:* Fast response
  - *Disadvantage:* Steady-state error
]

#example[P Action Response][
  For $e = 0.5$ and $K_p = 10$: $u = 5$
]

#definition[Integral Action (I)][
  Output is proportional to accumulated error:
  $ u(t) = K_i integral_0^t e(tau) d tau $
  - *Advantage:* Eliminates steady-state error
  - *Disadvantage:* Can cause overshoot and oscillation
]

#example[I Action Response][
  For constant $e = 0.1$ over $t = 5"s"$ with $K_i = 2$:
  $ u = 2 times 0.1 times 5 = 1.0 $
]

#definition[Derivative Action (D)][
  Output is proportional to rate of error change:
  $ u(t) = K_d (d e)/(d t) $
  - *Advantage:* Anticipates future error, improves damping
  - *Disadvantage:* Amplifies noise
]

#example[D Action Response][
  For $e(t) = 0.5 t$ (ramp), $dot(e) = 0.5$, $K_d = 4$:
  $ u = 4 times 0.5 = 2.0 $
]

=== Solved Problems

#solved_problem[Compare P vs PI Control][
  Compare steady-state error for P and PI control on $G(s) = 1/(s+1)$.
]
#solution[
  *P Control:* $C(s) = K_p$
  $ e_("ss") = 1/(1 + K_p G(0)) = 1/(1 + K_p) != 0 $

  *PI Control:* $C(s) = K_p + K_i/s$
  System becomes Type 1, so:
  $ e_("ss") = 0 quad "(for step input)" $

  PI eliminates steady-state error.
]

#solved_problem[Effect of Derivative Action][
  Show how D action improves damping for $G(s) = 1/(s^2 + s + 1)$.
]
#solution[
  *Without D:* Closed-loop poles from $s^2 + s + 1 + K_p = 0$

  *With PD:* $C(s) = K_p + K_d s$
  Closed-loop: $s^2 + (1 + K_d)s + (1 + K_p) = 0$

  Damping ratio: $zeta = (1 + K_d)/(2 sqrt(1 + K_p))$

  Increasing $K_d$ increases $zeta$, improving damping.
]

=== Supplementary Problems

#supplementary[PI Tuning][
  Tune $K_p$ and $K_i$ for critically damped response.
]

#supplementary[Noise Sensitivity][
  Analyze how D action amplifies measurement noise.
]

#supplementary[Action Combination][
  Explain why PD control is rarely used alone.
]
