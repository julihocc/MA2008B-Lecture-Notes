#import "../../utils.typ": *
== Industrial Automatic Controllers

=== Mathematical Review

Industrial controllers are devices that automatically regulate process variables to maintain desired setpoints.

#definition[Automatic Controller][
  A controller measures the error $e(t) = r(t) - y(t)$ between reference $r$ and output $y$, then generates control signal $u(t)$ to minimize error.
]

#example[Thermostat][
  Simple on-off controller: $u = cases(u_("max") quad &"if" e > 0, 0 quad &"if" e <= 0)$
]

#definition[Controller Types][
  Common industrial controllers:
  - *On-Off:* Binary control (bang-bang)
  - *Proportional (P):* $u = K_p e$
  - *Integral (I):* $u = K_i integral e d t$
  - *Derivative (D):* $u = K_d dot(e)$
  - *PID:* Combination of all three
]

#example[Proportional Controller][
  For $K_p = 5$, if $e = 0.2$, then $u = 5 times 0.2 = 1.0$
]

#theorem[Steady-State Error with P Control][
  Pure proportional control always leaves steady-state error for step inputs in Type 0 systems.
]

#example[P Control Limitation][
  For plant $G(s) = 1/(s+1)$ with $K_p = 10$:
  $ e_("ss") = 1/(1 + K_p G(0)) = 1/(1 + 10) = 0.091 $
]

=== Solved Problems

#solved_problem[Design P Controller][
  Design proportional controller for $G(s) = 1/(s(s+2))$ to achieve $e_("ss") = 0.05$ for unit step.
]
#solution[
  System is Type 1 (one integrator), so $e_("ss") = 0$ for step input regardless of $K_p$.

  For ramp input $r(t) = t$:
  $ e_("ss") = 1/(K_p K_v) = 1/(K_p lim_(s->0) s G(s)) = 1/(K_p dot 1/2) = 2/K_p $

  To get $e_("ss") = 0.05$:
  $ 2/K_p = 0.05 => K_p = 40 $
]

#solved_problem[On-Off Controller Oscillation][
  Explain why on-off control causes oscillations.
]
#solution[
  On-off control switches between two states, causing:
  1. Output overshoots setpoint → controller turns off
  2. Output falls below setpoint → controller turns on
  3. Cycle repeats, creating sustained oscillation

  Oscillation amplitude depends on system inertia and switching hysteresis.
]

=== Supplementary Problems

#supplementary[Level Control][
  Design a controller for liquid level in a tank.
]

#supplementary[Pressure Regulator][
  Analyze a pneumatic pressure controller.
]

#supplementary[Speed Control][
  Design proportional controller for motor speed regulation.
]
