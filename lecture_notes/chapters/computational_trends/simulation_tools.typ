#import "../../../utils.typ": *
== Computational Validation of Bio-System Models

=== Mathematical Review

#definition[ODE45 / Adaptive Runge-Kutta][
  The numerical solver ODE45 uses a 4th/5th-order Runge-Kutta pair with adaptive step size to solve stiff initial value problems. For the glucose-insulin-epinephrine system:
  $ x' = f(x, t), quad x(0) = x_0 $
  The solver adaptively controls the local truncation error, making it ideal for capturing the abrupt dynamics during an epinephrine stress event followed by slow recovery.
]

#definition[UVA/Padova Type 1 Diabetes Simulator][
  The FDA-accepted UVA/Padova simulator is the industry standard for "in silico" clinical trials of closed-loop insulin delivery (artificial pancreas). Control algorithms (MPC, PID, reinforcement learning) can be validated against a cohort of $n = 100$ virtual patients spanning pediatric, adolescent, and adult physiology — with no human risk.
]

=== Solved Problems

#solved_problem[Verifying the Analytical $G_"max"$ Bound Numerically][
  Describe the numerical experiment used to validate the analytically derived LCIS bound $G_"max" = (P_G + P_{G,e}(E^*)) / k_1$ for the stressed model.
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
