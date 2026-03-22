#import "../../../utils.typ": *
== Computational Validation of Bio-System Models

=== Mathematical Review

#definition[Numerical Integration: Runge-Kutta Methods][
  Advanced solvers like ODE45 use adaptive step sizes based on the Runge-Kutta framework to solve stiff initial value problems:
  $ x' = f(x, t), quad x(t_0) = x_0 $
  The standard 4th-order Runge-Kutta (RK4) step to approximate $x(t_{n+1})$ from $x(t_n)$ with step-size $h$ is defined by intermediate slopes:
  $
  k_1 &= f(t_n, x_n) \
  k_2 &= f(t_n + h/2, x_n + h k_1 / 2) \
  k_3 &= f(t_n + h/2, x_n + h k_2 / 2) \
  k_4 &= f(t_n + h, x_n + h k_3)
  $
  The state is then updated via the weighted average:
  $ x_{n+1} = x_n + h / 6 (k_1 + 2 k_2 + 2 k_3 + k_4) $
  For stressed biological systems (like epinephrine bolus kinetics), adaptive solvers continually resize $h$ to bound the local truncation error, ensuring stability across both fast and slow timescales.
]

#definition[In Silico Clinical Trials (UVA/Padova Simulator)][
  The FDA-accepted UVA/Padova simulator is the industry standard for "in silico" clinical trials of closed-loop insulin delivery (e.g. Artificial Pancreas). Control algorithms (MPC, PID, LQR) can be rigorously validated continuously against a cohort of $n = 100$ mathematical differential models representing virtual patients—spanning pediatric, adolescent, and adult physiology—with zero human risk.
]

=== Solved Problems

#solved_problem[Verifying the Analytical $G_"max"$ Bound Numerically][
  Describe the numerical experiment used to validate the analytically derived LCIS bound $G_"max" = (P_G + P_(G,e)(E^*)) / k_1$ for the stressed model.
]
#solution[
  1. Set model parameters and extreme initial condition: $G(0) = G_"max" - epsilon$, $I(0) = 0$, $E(0) = E^*$.
  2. Run ODE45 for $T_"sim" = 500$ minutes.
  3. Plot $G(t)$ and verify numerically that $G(t) <= G_"max"$ for all $t$.
  4. Confirm the trajectory is bounded and eventually converges toward an equilibrium inside the LCIS-computed set.
]

=== Supplementary Problems

#supplementary[Adaptive Step Size Importance][
  Explain why fixed-step Euler integration would produce incorrect results when simulating the sharp epinephrine bolus. What is the minimum step size $h$ required for Euler stability given the stiffness ratio of the model?
]
