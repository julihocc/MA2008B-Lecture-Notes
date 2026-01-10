#import "../../utils.typ": *
== Steady-State Error Analysis

=== Mathematical Review

Steady-state error quantifies the difference between desired and actual output as $t -> infinity$.

#definition[Steady-State Error][
  $ e_("ss") = lim_(t -> infinity) e(t) = lim_(s -> 0) s E(s) $
  where $E(s) = R(s) - Y(s)$ for unity feedback.
]

#example[Step Input Error][
  For $R(s) = 1/s$ (unit step):
  $ e_("ss") = lim_(s -> 0) s dot 1/s dot 1/(1+G(s)) = 1/(1+G(0)) $
]

#definition[System Type][
  System type $N$ is the number of integrators ($1/s$ terms) in open-loop transfer function $G(s)H(s)$.

  $ G(s)H(s) = K s^N (1 + T_1 s)(1 + T_2 s).../(1 + T_a s)(1 + T_b s)... $
]

#example[Type Classification][
  - $G(s) = K/(s+1)$: Type 0
  - $G(s) = K/(s(s+1))$: Type 1
  - $G(s) = K/(s^2(s+1))$: Type 2
]

#theorem[Error Constants][
  - *Position error constant:* $K_p = lim_(s -> 0) G(s)$
  - *Velocity error constant:* $K_v = lim_(s -> 0) s G(s)$
  - *Acceleration error constant:* $K_a = lim_(s -> 0) s^2 G(s)$
]

#example[Error Constant Calculation][
  For $G(s) = 10/(s(s+2))$:
  - $K_p = lim_(s -> 0) 10/(s(s+2)) = infinity$ (Type 1)
  - $K_v = lim_(s -> 0) s dot 10/(s(s+2)) = 5$
  - $K_a = lim_(s -> 0) s^2 dot 10/(s(s+2)) = 0$
]

#definition[Steady-State Error Table][
  | Input | Type 0 | Type 1 | Type 2 |
  |-------|--------|--------|--------|
  | Step | $1/(1+K_p)$ | 0 | 0 |
  | Ramp | $infinity$ | $1/K_v$ | 0 |
  | Parabola | $infinity$ | $infinity$ | $1/K_a$ |
]

#example[Error for Ramp][
  Type 1 system with $K_v = 5$ tracking ramp $r(t) = t$:
  $ e_("ss") = 1/K_v = 1/5 = 0.2 $
]

=== Solved Problems

#solved_problem[Design for Error Specification][
  Design Type 1 system with $e_("ss") <= 0.1$ for ramp input.
]
#solution[
  For Type 1 system with ramp:
  $ e_("ss") = 1/K_v $

  Requirement: $1/K_v <= 0.1$
  $ K_v >= 10 $

  For $G(s) = K/(s(s+a))$:
  $ K_v = lim_(s -> 0) s dot K/(s(s+a)) = K/a $

  Choose $K = 10a$ (e.g., $a=1, K=10$):
  $ G(s) = 10/(s(s+1)) $
]

#solved_problem[Error with Disturbance][
  Find steady-state error due to disturbance $D(s) = 1/s$ for system with $G(s) = 5/(s+1)$, unity feedback.
]
#solution[
  For disturbance at plant output:
  $ Y(s) = (G/(1+G))R(s) + (1/(1+G))D(s) $

  With $R(s) = 0$ (no reference):
  $ Y(s) = (1/(1+G(s))) dot 1/s $

  Steady-state output:
  $ y_("ss") = lim_(s -> 0) s dot 1/(1+G(s)) dot 1/s = 1/(1+G(0)) = 1/(1+5) = 1/6 $

  This is the steady-state error due to disturbance.
]

=== Supplementary Problems

#supplementary[Non-Unity Feedback][
  Derive error formula for $H(s) != 1$.
]

#supplementary[Disturbance Rejection][
  Compare Type 0 vs Type 1 for disturbance rejection.
]

#supplementary[Tracking Error][
  Find error for sinusoidal input $r(t) = sin(omega t)$.
]
