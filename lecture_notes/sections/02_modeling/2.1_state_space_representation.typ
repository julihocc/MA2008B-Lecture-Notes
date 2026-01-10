#import "../../utils.typ": *
== State-Space Representation of Dynamic Systems

=== Mathematical Review

State-space representation provides a unified framework for modeling dynamic systems regardless of their physical nature.

#definition[State-Space Model][
  A dynamic system can be represented by:
  $ dot(x)(t) = f(x(t), u(t), t) $
  $ y(t) = g(x(t), u(t), t) $
  where $x in RR^n$ is the state vector, $u in RR^m$ is the input, and $y in RR^p$ is the output.
]

#example[Mass-Spring-Damper System][
  For $M diaer(x) + B dot(x) + K x = F$, let $x_1 = x, x_2 = dot(x)$:
  $ dot(x)_1 = x_2 $
  $ dot(x)_2 = -K/M x_1 - B/M x_2 + 1/M F $
]

#definition[Linear Time-Invariant (LTI) Systems][
  For LTI systems:
  $ dot(x) = A x + B u $
  $ y = C x + D u $
  where $A, B, C, D$ are constant matrices.
]

#example[RC Circuit State-Space][
  For an RC circuit with $dot(v)_C = -1/(R C) v_C + 1/(R C) v_("in")$:
  $ A = [-1/(R C)], quad B = [1/(R C)], quad C = [1], quad D = [0] $
]

=== Solved Problems

#solved_problem[Derive State Equations for RLC Circuit][
  Given an RLC series circuit with input voltage $v_("in")$ and output $v_C$, derive state equations.
]
#solution[
  Choose states: $x_1 = v_C$ (capacitor voltage), $x_2 = i_L$ (inductor current).

  From circuit laws:
  $ C dot(v)_C = i_L => dot(x)_1 = 1/C x_2 $
  $ L dot(i)_L = v_("in") - R i_L - v_C => dot(x)_2 = -1/L x_1 - R/L x_2 + 1/L v_("in") $

  In matrix form:
  $ dot(x) = mat(0, 1/C; -1/L, -R/L) x + mat(0; 1/L) v_("in") $
  $ y = mat(1, 0) x $
]

#solved_problem[Convert Transfer Function to State-Space][
  Convert $G(s) = (s+2)/(s^2 + 3s + 2)$ to state-space form.
]
#solution[
  Rewrite as $Y(s)/U(s) = (s+2)/((s+1)(s+2))$.

  The denominator gives characteristic equation: $s^2 + 3s + 2 = 0$.

  Using controllable canonical form:
  $ A = mat(0, 1; -2, -3), quad B = mat(0; 1) $
  $ C = mat(2, 1), quad D = 0 $

  Verify: $C(s I - A)^(-1)B = (s+2)/(s^2+3s+2)$ ✓
]

=== Supplementary Problems

#supplementary[Mechanical System][
  Derive state-space equations for a cart-pendulum system.
]

#supplementary[Thermal System][
  Model a heated tank with state-space representation where states are temperatures.
]
