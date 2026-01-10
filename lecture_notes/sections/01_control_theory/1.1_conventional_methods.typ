#import "../../utils.typ": *
== Conventional and State-Space Methods

=== Mathematical Review

Control theory serves as the foundation for analyzing and designing systems that maintain desired behaviors. We distinguish between two primary frameworks:

#definition[Conventional Control (Classical)][
  A frequency-domain approach using *Transfer Functions* ($G(s)$). It is primarily used for Single-Input Single-Output (SISO), Linear, Time-Invariant (LTI) systems. Key metrics include overshoot, settling time, and steady-state error.
]

#definition[State-Space Methods (Modern)][
  A time-domain approach using *differential equations*. It models systems via state variables:
  $ dot(x)(t) = A x(t) + B u(t) $
  $ y(t) = C x(t) + D u(t) $
  This method handles Multiple-Input Multiple-Output (MIMO), non-linear, and time-varying systems.
]

The relationship between the two representations for LTI systems is given by:
$ G(s) = C(s I - A)^(-1) B + D $

=== Solved Problems

#example[Transfer Function to State-Space][
  Given the transfer function $G(s) = 1 / (s^2 + 3s + 2)$, find a state-space representation.
]
#solution[
  The differential equation corresponds to $diaer(y) + 3 dot(y) + 2y = u$.
  Let $x_1 = y$ and $x_2 = dot(y)$. Then:
  $ dot(x)_1 = x_2 $
  $ dot(x)_2 = -2 x_1 - 3 x_2 + u $
  In matrix form:
  $ A = mat(0, 1; -2, -3), quad B = mat(0; 1), quad C = mat(1, 0), quad D = 0 $
]

#example[State-Space to Transfer Function][
  Given $A = mat(-1, 0; 0, -2)$, $B=mat(1; 1)$, $C=mat(1, 1)$, $D=0$. Find $G(s)$.
]
#solution[
  Calculate $(s I - A)^(-1)$:
  $ s I - A = mat(s+1, 0; 0, s+2) => (s I - A)^(-1) = mat(1/(s+1), 0; 0, 1/(s+2)) $
  Then $G(s) = C (s I - A)^(-1) B$:
  $ G(s) = mat(1, 1) mat(1/(s+1); 1/(s+2)) = 1/(s+1) + 1/(s+2) = (2s + 3) / ((s+1)(s+2)) $
]

=== Supplementary Problems

#exercise[System Classification][
  Classify the system $dot(x) = -x + x^3$ as linear or non-linear, and time-invariant or time-varying.
]

#exercise[Dimensionality][
  For a MIMO system with 2 inputs and 3 outputs, what are the dimensions of the $D$ matrix?
]
