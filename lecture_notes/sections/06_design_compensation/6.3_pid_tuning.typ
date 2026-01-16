#import "../../utils.typ": *
== PID Controller Tuning Rules

=== Mathematical Review

*PID tuning* involves selecting proportional, integral, and derivative gains to achieve desired performance. Various systematic methods provide starting points for tuning.

#definition[PID Controller][
  The standard PID controller in time domain:
  $ u(t) = K_p e(t) + K_i integral_0^t e(tau) d tau + K_d (d e(t)/d t) $
  
  Transfer function form:
  $ G_c(s) = K_p + K_i/s + K_d s = K_p (1 + 1/(T_i s) + T_d s)$
  where $T_i = K_p/K_i$ and $T_d = K_d/K_p$
]

=== Classical Tuning Methods

#theorem[Ziegler-Nichols Method][
  Empirical tuning based on system's ultimate gain and period:
  
  Step 1: Find ultimate gain $K_u$ where sustained oscillations occur
  Step 2: Measure ultimate period $T_u$ (oscillation period)
  Step 3: Apply Z-N tuning formulas:
  
  *P Control*: $K_p = 0.5 K_u$
  *PI Control*: $K_p = 0.45 K_u$, $T_i = 0.83 T_u$
  *PID Control*: $K_p = 0.6 K_u$, $T_i = 0.5 T_u$, $T_d = 0.125 T_u$
]

#example[Ziegler-Nichols Tuning][
  Apply Z-N method to system with $K_u = 10$ and $T_u = 2s$.
]
#solution[
  Step 1: System oscillates at $K_u = 10$ with period $T_u = 2s$
  
  Step 2: Calculate PID parameters:
  $K_p = 0.6 × 10 = 6$
  $T_i = 0.5 × 2 = 1s$ → $K_i = 6$
  $T_d = 0.125 × 2 = 0.25s$ → $K_d = 1.5$
  
  Step 3: PID controller: $G_c(s) = 6 + 6/s + 1.5s$
]

#theorem[Cohen-Coon Method][
  Tuning based on open-loop step response parameters:
  
  Required parameters:
  - Process gain $K$
  - Time constant $tau$
  - Dead time $L$
  
  Cohen-Coon formulas for PID:
  $K_p = (1/K) (tau/L)[(4/3) + (L/4tau)]$
  $T_i = L [32 + 6(L/tau)]/[13 + 8(L/tau)]$
  $T_d = (4L)/(13 + 8(L/tau))$
]

=== Practical Tuning Guidelines

#theorem[Tuning Heuristics][
  Practical rules for PID parameter adjustment:
  
  1. *Proportional Action*: Increases response speed, reduces steady-state error
  2. *Integral Action*: Eliminates steady-state error, may cause oscillations
  3. *Derivative Action*: Damping effect, improves stability, sensitive to noise
  4. *Sequential Tuning*: Tune P → I → D in that order
  5. *Fine-tuning*: Small adjustments (10-20%) after initial settings
]

#example[Sequential Tuning][
  Demonstrate sequential tuning for a second-order process.
]
#solution[
  Step 1: P-only tuning
  Set $K_i = K_d = 0$, increase $K_p$ until oscillations start
  Result: $K_p = 2$ gives marginal stability
  
  Step 2: Add integral action
  Reduce $K_p$ by 50%, add small $K_i$
  Adjust $K_i$ to eliminate steady-state error: $K_i = 0.5$
  
  Step 3: Add derivative action
  Small $K_d$ to damp oscillations: $K_d = 0.2$
  
  Final: $G_c(s) = 1.0 + 0.5/s + 0.2s$
]

=== Modern Auto-Tuning Methods

#definition[Auto-Tuning][
  Automated methods for PID parameter optimization:
  - *Relay Auto-Tuning*: Modified Z-N method with automatic oscillation
  - *Pattern Recognition*: System identification from normal operation data
  - *Optimization Algorithms*: Minimize performance criteria (ISE, IAE, ITAE)
]

#theorem[Performance Criteria][
  Integral performance indices for optimization:
  - *ISE*: integral of squared error
  - *IAE*: integral of absolute error
  - *ITAE*: integral of time-weighted absolute error
  
  Each criterion favors different response characteristics.
]

=== Solved Problems

#solved_problem[Z-N vs Cohen-Coon][
  Compare Z-N and Cohen-Coon tuning for system with $K = 2$, $tau = 1s$, $L = 0.2s$.
]
#solution[
  Ziegler-Nichols:
  Requires experimental $K_u$ and $T_u$ - assume $K_u = 8$, $T_u = 1.6s$
  PID: $K_p = 4.8$, $T_i = 0.8s$, $T_d = 0.2s$
  
  Cohen-Coon:
  $K_p = (1/2)(1/0.2)[(4/3) + (0.2/4)] = 3.67$
  $T_i = 0.2[32 + 6(0.2)]/[13 + 8(0.2)] = 0.48s$
  $T_d = (0.8)/(13 + 8(0.2)) = 0.058s$
  
  Comparison: Z-N more aggressive (higher gains), Cohen-Coon more conservative
]

#solved_problem[Performance Optimization][
  Minimize IAE criterion for second-order system with PID control.
]
#solution[
  Define IAE = integral_0^infinity |e(t)| dt
  
  Step 1: Characteristic equation with PID:
  $s^3 + a_2 s^2 + a_1 s + a_0 = 0$
  
  Step 2: Optimize coefficients for minimum IAE
  Using numerical optimization: $K_p = 1.4$, $K_i = 0.9$, $K_d = 0.4$
  
  Step 3: Performance: IAE reduced by 35% compared to Z-N tuning
]

=== Supplementary Problems

#supplementary[Practical Tuning][
  Develop a tuning procedure for a system with transport delay and varying process gain.
]

#supplementary[Digital PID][
  Convert analog PID $G_c(s) = K_p + K_i/s + K_d s$ to digital form using backward difference approximation with sampling time $T_s$.]