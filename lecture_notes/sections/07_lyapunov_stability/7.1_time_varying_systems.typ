#import "../../utils.typ": *
== Linear Time-Varying Systems

=== Mathematical Review

Linear Time-Varying (LTV) systems are dynamic systems where the parameters depend on time. Unlike Linear Time-Invariant (LTI) systems, the behavior of LTV systems depends on the specific time frame of operation.

#definition[LTV State-Space Representation][
  A linear time-varying system is described by:
  $ dot(x)(t) = A(t) x(t) + B(t) u(t) $
  $ y(t) = C(t) x(t) + D(t) u(t) $
  where $A(t), B(t), C(t), D(t)$ are time-dependent matrices.
]

#definition[State Transition Matrix][
  The State Transition Matrix (STM) $Phi(t, t_0)$ maps the state from initial time $t_0$ to time $t$ in the absence of input:
  $ x(t) = Phi(t, t_0) x(t_0) $

  Properties:
  1. $Phi(t, t) = I$
  2. $Phi(t_2, t_0) = Phi(t_2, t_1) Phi(t_1, t_0)$
  3. $Phi(t, t_0)^(-1) = Phi(t_0, t)$
  4. $(d)/(d t) Phi(t, t_0) = A(t) Phi(t, t_0)$
]

#theorem[General Solution][
  The complete solution for an LTV system is:
  $ x(t) = Phi(t, t_0) x(t_0) + integral_(t_0)^t Phi(t, tau) B(tau) u(tau) d tau $
]

=== Solved Problems

#solved_problem[STM Calculation][
  Find the state transition matrix for the scalar system $dot(x) = (-1/t) x$ for $t > 0$.
]
#solution[
  Step 1: Identify $A(t)$
  $A(t) = -1/t$

  Step 2: Solve differential equation for STM
  $dot(Phi)(t, t_0) = A(t) Phi(t, t_0)$ with $Phi(t_0, t_0) = 1$
  $ (d Phi)/Phi = -1/t d t $
  $ ln(Phi) = -ln(t) + C $
  $ Phi(t, t_0) = k/t $

  Step 3: Apply initial condition
  $Phi(t_0, t_0) = k/t_0 = 1 => k = t_0$

  Result: $Phi(t, t_0) = t_0/t$
]

#solved_problem[Time-Varying Stability][
  Discuss the stability of $dot(x) = (sin(t)) x$.
]
#solution[
  Step 1: Solve for state transition
  $ A(t) = sin(t) $
  $ Phi(t, 0) = exp(integral_0^t sin(tau) d tau) = exp(-cos(t) + cos(0)) = exp(1 - cos(t)) $

  Step 2: Analyze bounds
  $ -1 <= -cos(t) <= 1 $, so $ 0 <= 1 - cos(t) <= 2 $
  $ 1 <= Phi(t, 0) <= e^2 $

  Step 3: Conclusion
  The state $x(t)$ is bounded for any bounded initial condition, so the system is stable in the sense of Lyapunov, but not asymptotically stable (it doesn't go to 0).
]

=== Supplementary Problems

#supplementary[Peano-Baker Series][
  Derive the first three terms of the Peano-Baker series for $Phi(t, 0)$ given $A(t) = mat(0, 1;0, t)$.
]

#supplementary[Periodically Time-Varying][
  For a system $dot(x) = A(t) x$ where $A(t) = A(t+T)$, explain Floquet theory and its use in stability analysis.
]
