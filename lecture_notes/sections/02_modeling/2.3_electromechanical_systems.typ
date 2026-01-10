#import "../../utils.typ": *
== Electromechanical Systems

=== Mathematical Review

Electromechanical systems couple electrical and mechanical domains through energy conversion.

#definition[DC Motor][
  A DC motor converts electrical energy to mechanical rotation:
  - *Electrical equation:* $L dot(i) + R i + K_b omega = v$
  - *Mechanical equation:* $J dot(omega) + B omega = K_t i - tau_L$
  where $K_b$ is back-EMF constant, $K_t$ is torque constant.
]

#example[Armature-Controlled DC Motor][
  For $L approx 0$:
  $ R i + K_b omega = v $
  $ J dot(omega) + B omega = K_t i $
]

#definition[Electromechanical Coupling][
  The coupling constants relate electrical and mechanical quantities:
  $ K_t = K_b quad "(for ideal motors)" $
]

#example[Motor Power Balance][
  Electrical power in: $P_("in") = v i$
  Mechanical power out: $P_("out") = tau omega = K_t i omega$
  Back-EMF power: $P_("back") = K_b omega i$
]

=== Solved Problems

#solved_problem[DC Motor State-Space Model][
  Derive state-space model for DC motor with states $x_1 = omega$, $x_2 = i$.
]
#solution[
  From motor equations:
  $ dot(omega) = -B/J omega + K_t/J i $
  $ dot(i) = -K_b/L omega - R/L i + 1/L v $

  State-space form:
  $ dot(x) = mat(-B/J, K_t/J; -K_b/L, -R/L) x + mat(0; 1/L) v $
  $ y = mat(1, 0) x quad "(if output is" omega")" $
]

#solved_problem[Motor Transfer Function][
  Find $Omega(s)/V(s)$ for DC motor with $J=0.01$, $B=0.1$, $K_t=K_b=0.5$, $R=1$, $L=0.5$.
]
#solution[
  From Laplace transform of motor equations:
  $ (L s + R) I(s) + K_b Omega(s) = V(s) $
  $ (J s + B) Omega(s) = K_t I(s) $

  Eliminate $I(s)$:
  $ Omega(s)/V(s) = K_t / ((L s + R)(J s + B) + K_t K_b) $

  Substituting values:
  $ Omega(s)/V(s) = 0.5 / (0.005 s^2 + 0.06 s + 0.35) $
]

=== Supplementary Problems

#supplementary[Generator Model][
  Derive equations for a DC generator operating in reverse mode.
]

#supplementary[Servo Motor][
  Model a servo motor with position feedback.
]

#supplementary[Stepper Motor][
  Analyze the step response of a stepper motor system.
]
