#import "../../utils.typ": *
== The PID Controller

=== Mathematical Review

The PID controller combines proportional, integral, and derivative actions for optimal performance.

#definition[PID Controller][
  The PID control law:
  $ u(t) = K_p e(t) + K_i integral_0^t e(tau) d tau + K_d (d e)/(d t) $

  Transfer function form:
  $ C(s) = K_p + K_i/s + K_d s = (K_p s + K_i + K_d s^2)/s $
]

#example[PID Parameters][
  For $K_p = 5$, $K_i = 2$, $K_d = 1$:
  $ C(s) = 5 + 2/s + s = (s^2 + 5s + 2)/s $
]

#definition[Parallel vs Series Form][
  *Parallel (ideal):* $C(s) = K_p(1 + 1/(T_i s) + T_d s)$

  *Series (interacting):* $C(s) = K_c(1 + 1/(T_i s))(1 + T_d s)$
]

#example[Series Form Expansion][
  $ C(s) = K_c(1 + 1/(T_i s))(1 + T_d s) = K_c(1 + T_d s + 1/(T_i s) + T_d/(T_i)) $
]

#theorem[PID Effect on System Type][
  Adding PID increases system type by 1 due to integral action, eliminating steady-state error for step inputs.
]

#example[Type Enhancement][
  Type 0 plant $G(s) = 1/(s+1)$ with PI becomes Type 1:
  $ G_c(s) = (K_p + K_i/s) dot 1/(s+1) = (K_p s + K_i)/(s(s+1)) $
]

=== Solved Problems

#solved_problem[Design PID for Second-Order System][
  Design PID for $G(s) = 1/(s^2 + 2s + 1)$ to achieve $zeta = 0.7$, $omega_n = 5$.
]
#solution[
  Desired characteristic equation:
  $ s^2 + 2 zeta omega_n s + omega_n^2 = s^2 + 7s + 25 $

  Closed-loop with PID:
  $ s^2 + 2s + 1 + K_d s^2 + K_p s + K_i = 0 $
  $ (1 + K_d)s^2 + (2 + K_p)s + (1 + K_i) = 0 $

  Matching coefficients:
  $ 1 + K_d = 1 => K_d = 0 $
  $ 2 + K_p = 7 => K_p = 5 $
  $ 1 + K_i = 25 => K_i = 24 $

  Result: PI controller with $K_p = 5$, $K_i = 24$.
]

#solved_problem[PID Derivative Filtering][
  Implement derivative action with low-pass filter to reduce noise.
]
#solution[
  Pure derivative: $C_d(s) = K_d s$ (amplifies high-frequency noise)

  Filtered derivative:
  $ C_d(s) = (K_d s)/(1 + tau s) = (K_d s)/(1 + s/N) $
  where $N = 1/tau$ is filter coefficient (typically $N = 10$).

  This limits derivative gain at high frequencies while maintaining performance at lower frequencies.
]

=== Supplementary Problems

#supplementary[Ziegler-Nichols Tuning][
  Apply Ziegler-Nichols method to tune PID for a given plant.
]

#supplementary[Anti-Windup][
  Design anti-windup mechanism for integral action.
]

#supplementary[Bumpless Transfer][
  Implement bumpless transfer when switching between manual and automatic modes.
]
