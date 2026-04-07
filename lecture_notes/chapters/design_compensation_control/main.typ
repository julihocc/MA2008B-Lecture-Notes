#import "../../../utils.typ": *
= Design, Compensation, and Control Laws

This chapter covers comprehensive design and compensation techniques, including PID tuning and state-space design for biomedical devices, and the uniquely biological challenges of human-in-the-loop control with Epinephrine disturbances and patient-specific parameter identification.

== Preliminary Concepts and Considerations

=== Mathematical Review

Control system design involves systematically selecting controller structures and parameters to meet specified performance criteria while maintaining stability and robustness.

#definition[Design Specifications][
  Key performance metrics for control systems:
  - *Steady-State Error:* $e_(s s) = lim_(t -> infinity) e(t)$
  - *Rise Time ($t_r$):* Time to rise from 10% to 90% of final value
  - *Settling Time ($t_s$):* Time to reach within 2% of final value
  - *Percent Overshoot ($M_p$):* $(y_(max) - y_(s s))/y_(s s) × 100%$
  - *Bandwidth ($omega_B$):* Frequency range with $abs(T(j omega)) ≥ 0.707 abs(T(j 0))$
]

#theorem[Design Trade-Offs][
  Fundamental trade-offs in control system design:
  1. *Speed vs Stability:* Faster response typically reduces stability margins
  2. *Accuracy vs Robustness:* Higher steady-state accuracy may reduce robustness
  3. *Complexity vs Performance:* Increased controller complexity improves performance
  4. *Sensitivity vs Noise Rejection:* Trade-off between disturbance rejection and noise sensitivity
]



=== Classical vs Modern Design Approaches

#definition[Classical Design Methods][
  Frequency-domain techniques using transfer functions:
  - Root locus analysis
  - Bode plot design
  - Nyquist criterion
  - Frequency response compensation
  Suitable for SISO systems with well-defined models.
]

#definition[Modern Design Methods][
  Time-domain techniques using state-space representations:
  - Pole placement algorithms
  - Optimal control (LQR, LQG)
  - Robust control ($H_∞$, $H_2$)
  - Adaptive control strategies
  Suitable for MIMO systems and complex requirements.
]

=== Solved Problems

#solved_problem[Specification Translation][
  Translate performance specifications into design requirements for a second-order system.
]
#solution[
  Given: $M_p < 5%$ and $t_s < 1s$ for unit step input

  Step 1: Relate to damping ratio and natural frequency
  $ M_p = exp((-zeta pi)/sqrt(1 - zeta^2)) < 0.05 $
  Solving: $zeta > 0.69$

  Step 2: Settling time requirement
  $ t_s = 4/(zeta omega_n) < 1 $
  For $zeta = 0.69$: $omega_n > 5.8$ rad/s

  Step 3: Design requirements
  $ zeta > 0.69$, $omega_n > 5.8$ rad/s
]

#solved_problem[Trade-Off Analysis][
  Analyze trade-offs between rise time and overshoot for a second-order system.
]
#solution[
  For standard second-order system:
  $ t_r approx 1.8/omega_n$ (for $zeta = 0.5$)
  $ M_p = exp((-zeta pi)/sqrt(1 - zeta^2))$

  As $omega_n$ increases: $t_r$ decreases (faster)
  But $zeta$ must increase for lower $M_p$ (slower response)

  Optimal compromise: $zeta ≈ 0.7$ balances speed and overshoot
]




#solved_problem[Design Specification Example][
  Analyze the design specification example.
]
#solution[
  For a unity feedback system:
  - Settling time: $t_s < 2s$
  - Percent overshoot: $M_p < 10%$
  - Steady-state error for step: $e_(s s) = 0$
  - Phase margin: $P_M > 45°$
]

=== Supplementary Problems
#supplementary[Performance Specification][
  Derive the relationship between damping ratio, natural frequency, and 2% settling time for a second-order system.
]

#supplementary[Design Selection][
  When should classical design methods be preferred over modern state-space techniques? Discuss advantages and limitations.
]

== Compensation Techniques

=== Mathematical Review

*Compensation* involves adding networks to improve system performance while maintaining stability. The three primary types are lead, lag, and lead-lag compensators.

#definition[Phase Lead Compensation][
  A lead compensator adds phase advance in a specific frequency range:
  $ G_c(s) = K (1 + alpha tau s)/(1 + tau s)$ where $0 < alpha < 1$
  Maximum phase lead: $phi_m = sin^(-1)((1 - alpha)/(1 + alpha))$
  Occurs at frequency: $omega_m = 1/(tau sqrt(alpha))$
]

#definition[Phase Lag Compensation][
  A lag compensator adds attenuation at high frequencies:
  $ G_c(s) = K (1 + tau s)/(1 + beta tau s)$ where $beta > 1$
  Improves steady-state accuracy while maintaining stability.
]

#definition[Lead-Lag Compensation][
  Combines both phase lead and lag characteristics:
  $ G_c(s) = K (1 + tau_1 s)/(1 + alpha tau_1 s) × (1 + tau_2 s)/(1 + beta tau_2 s)$
  Provides phase lead and improved steady-state performance.
]

=== Design Procedures

#theorem[Lead Compensator Design][
  Design steps for phase lead compensation:
  1. Determine required phase margin $P_M_(r e q)$
  2. Calculate additional phase needed: $phi = P_M_(r e q) - P_M_(c u r r e n t) + s a f e t y m a r g i n$
  3. Compute lead parameter: $alpha = (1 - sin(phi))/(1 + sin(phi))$
  4. Place zero and pole: $omega_z = omega_(g c) sqrt(alpha)$, $omega_p = omega_z/alpha$
  5. Adjust gain for desired crossover frequency
]


#solution[
  Step 1: Current phase margin is $15°$ at $omega = 2$ rad/s
  Step 2: Additional phase needed: $phi = 45° - 15° + 5° = 35°$
  Step 3: $alpha = (1 - sin(35°))/(1 + sin(35°)) = 0.27$
  Step 4: $omega_z = 2 sqrt(0.27) = 1.04$ rad/s, $omega_p = 3.85$ rad/s
  Step 5: $G_c(s) = (1 + 0.96s)/(1 + 0.26s)$
]

=== Lag Compensation

#theorem[Lag Compensator Design][
  Design steps for phase lag compensation:
  1. Determine error constant improvement needed
  2. Choose pole frequency: $omega_p << omega_(g c)$ (typically 1/10 of crossover)
  3. Compute zero location for desired gain
  4. Verify stability margins after compensation
]


#solution[
  Step 1: Required gain increase: factor of 5
  Step 2: Place pole at $omega_p = 0.2$ rad/s (1/10 of current crossover)
  Step 3: Zero at $omega_z = 1.0$ rad/s
  Step 4: $G_c(s) = 5(1 + s)/(1 + 5s)$
]

=== Solved Problems

#solved_problem[Lead-Lag Design][
  Design lead-lag compensator for system $G(s) = 4/(s(s+1)(s+2))$ to achieve $P_M = 50°$ and $e_(s s) < 1%$.
]
#solution[
  Step 1: Current analysis shows $P_M = 25°$, $K_v = 4/2 = 2$
  Step 2: Lead design for additional $30°$:
  $alpha = (1 - sin(30°))/(1 + sin(30°)) = 0.33$
  
  Step 3: Lag design for error improvement:
  Required $K_v = 100$ → gain factor of 50
  $G_(l a g)(s) = 50(1 + 0.5s)/(1 + 25s)$
  
  Step 4: Combined compensator:
  $G_c(s) = (1 + 0.3s)/(1 + 0.1s) × (1 + 0.5s)/(1 + 25s)$
]

#solved_problem[Compensation Selection][
  Compare lead vs lag vs lead-lag for different system types and specifications.
]
#solution[
  *Lead compensation*: Best for improving stability margins and transient response
  *Lag compensation*: Best for improving steady-state accuracy
  *Lead-lag compensation*: Comprehensive improvement for both transient and steady-state
  
  Selection guidelines:
  - Stability problems → Lead compensation
  - Accuracy problems → Lag compensation  
  - Both issues → Lead-lag compensation
]




#solved_problem[Lead Design Example][
  Analyze the lead design example.
]
#solution[
  For system with $G(s) = 10/(s(s+2))$, design lead compensator for $P_M = 45°$.
]

#solved_problem[Lag Design Example][
  Analyze the lag design example.
]
#solution[
  Improve steady-state error for $G(s) = K/(s+1)(s+5)$ from 10% to 2%.
]

=== Supplementary Problems
#supplementary[Network Synthesis][
  Design a passive RC lead network with maximum phase lead of $45°$ at $omega = 10$ rad/s.
]

#supplementary[Digital Implementation][
  Convert an analog lead compensator $G_c(s) = (1 + s)/(1 + 0.1s)$ to digital form using bilinear transformation with $T = 0.01s$.]

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




#solved_problem[Ziegler-Nichols Tuning][
  Analyze the ziegler-nichols tuning.
]
#solution[
  Apply Z-N method to system with $K_u = 10$ and $T_u = 2s$.
]

#solved_problem[Sequential Tuning][
  Analyze the sequential tuning.
]
#solution[
  Demonstrate sequential tuning for a second-order process.
]

=== Supplementary Problems
#supplementary[Practical Tuning][
  Develop a tuning procedure for a system with transport delay and varying process gain.
]

#supplementary[Digital PID][
  Convert analog PID $G_c(s) = K_p + K_i/s + K_d s$ to digital form using backward difference approximation with sampling time $T_s$.]

== Introduction to State-Space Design

=== Mathematical Review

*State-space design* provides a modern approach to controller synthesis using time-domain techniques and pole placement algorithms.

#definition[State Feedback][
  State feedback control law:
  $ u(t) = -K x(t) + r(t) $
  where $K$ is feedback gain matrix, $r(t)$ is reference input

  Closed-loop system:
  $ dot(x) = (A - B K) x + B r $
  Characteristic equation: $det(s I - (A - B K)) = 0$
]

#theorem[Pole Placement][
  Direct specification of closed-loop pole locations:
  Given desired poles $lambda_1, lambda_2, ..., lambda_n$:
  $ d e s(s) = (s - lambda_1)(s - lambda_2)...(s - lambda_n) $
  $ d e s(s) = s^n + a_(n-1) s^(n-1) + ... + a_0$

  Solve Ackermann's formula:
  $ K = mat(0, 0, ..., 1) C^(-1) P_c(A)$
  where $P_c(A)$ is the controllability matrix and $C = mat(a_0, a_1, ..., a_(n-1))$
]


#solution[
  Step 1: Desired characteristic polynomial
  $ d e s(s) = (s + 3 + j 4)(s + 3 - j 4) = s^2 + 6s + 25$

  Step 2: Check controllability
  $P_c = mat(B, A B) = mat(0, 1;1, -2)$, rank$(P_c) = 2$ (controllable)

  Step 3: Using Ackermann's formula
  $K = mat(k_1, k_2) = mat(25, 4)$

  Step 4: Verification
  $ A - B K = mat(0, 1;0, -2) - mat(0, 25;1, 4) = mat(0, -24;0, -6)$
  Closed-loop poles: eigenvalues of $A - B K$ = $-3 ± j 4$ ✓
]

=== Observer-Based Design

#definition[State Observer][
  Estimator for unmeasured states:
  $ dot(hat(x)) = A hat(x) + B u + L(y - C hat(x)) $
  where $L$ is observer gain matrix, $hat(x)$ is estimated state

  Observer error dynamics:
  $ dot(e) = (A - L C) e $
  Choose $L$ to place observer poles faster than system poles.
]

#theorem[Separation Principle][
  Controller and observer can be designed independently:
  1. Design feedback $K$ for desired closed-loop poles
  2. Design observer gain $L$ for fast convergence
  3. Implement using estimated states: $u = -K hat(x)$

  Overall closed-loop poles = system poles ∪ observer poles
]


#solution[
  Step 1: Observability check
  $P_o = mat(C;C A) = mat(1, 0;0, 1)$, rank$(P_o) = 2$ (observable)

  Step 2: Desired observer poles (5x faster)
  $lambda_(o 1,2) = -15 ± j 20$

  Step 3: Observer gain using pole placement
  $ L = vec(40, 200)$

  Step 4: Observer dynamics
  $ A - L C = mat(0, 1;-2, -3) - mat(40;200) mat(1, 0) = mat(-40, 1;-202, -3)$
  Eigenvalues: $-15 ± j 20$ ✓
]

=== Optimal Control Methods

#definition[Linear Quadratic Regulator][
  Optimal control minimizing quadratic cost:
  $ J = integral_0^infinity (x^T Q x + u^T R u) d t$

  Optimal control law:
  $ u = -R^(-1) B^T P x $
  where $P$ solves the Algebraic Riccati Equation:
  $ A^T P + P A - P B R^(-1) B^T P + Q = 0$
]


#solution[
  Step 1: Solve ARE
  $ mat(0, 0;1, 0)P + P mat(0, 1;0, 0) - P vec(0, 1) mat(0, 1) P + mat(1, 0;0, 1) = 0$

  Step 2: Solution for $P$
  $ P = mat(2, 1;1, 1)$

  Step 3: Optimal gain
  $ K = R^(-1) B^T P = mat(0, 1) mat(2, 1;1, 1) = mat(1, 1)$

  Step 4: Closed-loop system
  $ A - B K = mat(0, 1;0, 0) - mat(0, 1;1, 1) = mat(0, 0;-1, -1)$
  Closed-loop poles: $s^2 + s + 1 = 0$ → $s = -0.5 ± j 0.866$
]

=== Solved Problems

#solved_problem[Multi-Input Pole Placement][
  Design state feedback for $dot(x) = mat(0, 1, 0;0, 0, 1;0, 0, 0)x + vec(0, 0, 1)u$ with desired poles at $-2, -5, -10$.
]
#solution[
  Step 1: Controllability
  $P_c = mat(B, A B, A^2 B)$ has rank 3 (controllable)

  Step 2: Desired polynomial
  $ d e s(s) = (s + 2)(s + 5)(s + 10) = s^3 + 17s^2 + 80s + 100$

  Step 3: Feedback gain
  $ K = mat(100, 80, 17)$

  Step 4: Verification
  $ A - B K$ has eigenvalues $-2, -5, -10$ ✓
]

#solved_problem[Observer with State Feedback][
  Combined controller-observer design for same system with only output measurement.
]
#solution[
  Step 1: Observer poles (10x faster)
  $lambda_(o 1,2,3) = -20, -50, -100$

  Step 2: Observer gain
  $ L = vec(20, 400, 8000)$

  Step 3: Separation principle applied
  $ u = -K hat(x) = -mat(100, 80, 17) hat(x)$

  Combined system poles: $-2, -5, -10, -20, -50, -100$
]




#solved_problem[Pole Placement for Second-Order System][
  Analyze the pole placement for second-order system.
]
#solution[
  Design state feedback for $dot(x) = mat(0, 1;0, -2)x + vec(0, 1)u$ with poles at $-3 ± j 4$.
]

#solved_problem[Observer Design][
  Analyze the observer design.
]
#solution[
  Design observer for $dot(x) = mat(0, 1;-2, -3)x + vec(0, 1)u$, $y = mat(1, 0)x$.
]

#solved_problem[LQR Design][
  Analyze the lqr design.
]
#solution[
  Design LQR for $dot(x) = mat(0, 1;0, 0)x + vec(0, 1)u$ with $Q = I$, $R = 1$.
]

=== Supplementary Problems
#supplementary[Partial Pole Placement][
  Design state feedback for uncontrollable system using minimum-norm pseudo-inverse solution.
]

#supplementary[Robust LQR][
  Design LQR with weighting matrices to achieve specified closed-loop damping ratio.
]

== State-Space Analysis and Transfer Matrix

=== Mathematical Review

State-space analysis provides insights into system structure and facilitates multivariable system design through matrix representations.

#definition[State-Space to Transfer Function][
  For single-input single-output (SISO) systems:
  $ G(s) = C(s I - A)^(-1) B + D $
  where $(s I - A)^(-1) = a d j(s I - A)/det(s I - A)$

  For MIMO systems (p inputs, q outputs):
  $ G(s) = mat(g_(i j)(s))_(q×p) = C(s I - A)^(-1) B + D $
]

#theorem[Controllability][
  System is controllable if any state can be reached from any initial condition:
  Controllability matrix: $P_c = mat(B, A B, A^2 B, ..., A^(n-1) B)$
  Rank condition: $r a n k(P_c) = n$ (full state controllability)
]

#theorem[Observability][
  System is observable if any state can be determined from output measurements:
  Observability matrix: $P_o = mat(C;C A;C A^2;...;C A^(n-1))$
  Rank condition: $r a n k(P_o) = n$ (full state observability)
]


#solution[
  Step 1: Form controllability matrix
  $P_c = mat(B, A B) = mat(1, 2;3, 8)$

  Step 2: Calculate rank
  $det(P_c) = 1×26 - 0×8 = 26 ≠ 0$ → rank$(P_c) = 2$

  Step 3: Conclusion
  Since $n = 2$ and $r a n k(P_c) = 2$, system is controllable ✓
]


#solution[
  Step 1: Calculate $s I - A$
  $ s I - A = mat(s, -1;2, s+3)$

  Step 2: Find inverse
  $(s I - A)^(-1) = 1/((s+1)(s+2)) mat(s+3, 1;-2, s)$

  Step 3: Multiply by $C$ and $B$
  $G(s) = mat(1, 0) × 1/((s+1)(s+2)) mat(s+3, 1;-2, s) × vec(0, 1) = 1/((s+1)(s+2))$
]

=== Multivariable Systems

#definition[MIMO Transfer Matrix][
  For systems with multiple inputs and outputs:
  $ G(s) = C(s I - A)^(-1) B + D $
  Each element $g_(i j)(s)$ relates input $j$ to output $i$

  Properties:
  - *Proper*: All elements satisfy $degree(n u m e r a t o r) ≤ degree(d e n o m i n a t o r)$
  - *Strictly proper*: Strict inequality for all elements
  - *Symmetric*: $G^T(s) = G(s)$ for symmetric physical systems
]


#solution[
  Step 1: Transfer matrix calculation
  $G(s) = mat(1/(s^2+3s+2), (s+3)/(s^2+3s+2);1/(s^2+3s+2), 1/(s+3))$

  Step 2: Input-output relationships
  $Y_1(s) = G_(11)(s)U_1(s) + G_(12)(s)U_2(s)$
  $Y_2(s) = G_(21)(s)U_1(s) + G_(22)(s)U_2(s)$

  Step 3: System properties
  - Input 1 affects both outputs
  - Input 2 affects only output 2
  - System is coupled but not fully
]

=== Minimal Realizations

#theorem[Minimal Realization][
  A realization $(A, B, C, D)$ is minimal if:
  1. Controllable and observable
  2. No pole-zero cancellations
  3. Order equals McMillan degree of transfer function

  All minimal realizations are related by similarity transformations.
]

#definition[McMillan Degree][
  For MIMO transfer matrix $G(s)$:
  - Find least common denominator $d(s)$
  - McMillan degree = $degree(d(s))$
  - Represents minimal state-space dimension
]


#solution[
  Step 1: Transfer matrix structure
  $G(s) = mat((s+1)/(s(s+2)), 1/(s+1);1/(s+2), 1/(s+2))$

  Step 2: Common denominator
  $d(s) = s(s+1)(s+2)$
  McMillan degree = 3

  Step 3: Minimal realization
  $A = mat(-2, 0, 0;0, -1, 0;0, 0, 0)$
  $B = mat(1, 0;0, 1;0, 1)$
  $C = mat(1, 1, 1;0, 1, 1)$
  $D = mat(0, 0;0, 0)$
]

=== Solved Problems

#solved_problem[Decomposition][
  Decompose $G(s) = (2s+3)/(s^2+5s+6)$ into minimal state-space form.
]
#solution[
  Step 1: Partial fraction expansion
  $G(s) = 1/(s+2) + 1/(s+3)$

  Step 2: Parallel realization
  $A = mat(-2, 0;0, -3)$, $B = vec(1, 1)$
  $C = mat(1, 1)$, $D = 0$

  Step 3: Verify
  $G(s) = mat(1, 1) mat(s+3, 0;0, s+2) vec(1, 1) = 1/(s+2) + 1/(s+3)$ ✓
]

#solved_problem[Transmission Zeros][
  Find transmission zeros of MIMO system $G(s) = mat((s+1)/(s+2), 1/(s+3);2/(s+2), (s+4)/(s+3))$.
]
#solution[
  Step 1: Find transfer matrix rank
  $r a n k(G(s)) < 2$ at transmission zeros

  Step 2: Calculate determinant
  $det(G(s)) = (s+1)(s+4)/(s+2)(s+3) - 2/(s+2)(s+3) = (s^2+5s+4 - 2)/(s+2)(s+3) = (s^2+5s+2)/(s+2)(s+3)$

  Step 3: Transmission zeros
  $s^2 + 5s + 2 = 0 → s = -0.44, -4.56$

  Step 4: Interpretation
  At $s = -0.44$ and $s = -4.56$, system loses one rank direction
]




#solved_problem[Controllability Analysis][
  Analyze the controllability analysis.
]
#solution[
  Analyze controllability of $dot(x) = mat(1, 2;3, 4)x + vec(1, 0)u$.
]

#solved_problem[Transfer Function Conversion][
  Analyze the transfer function conversion.
]
#solution[
  Convert $A = mat(0, 1;-2, -3)$, $B = vec(0, 1)$, $C = mat(1, 0)$, $D = 0$ to transfer function.
]

#solved_problem[2×2 System Analysis][
  Analyze the 2×2 system analysis.
]
#solution[
  Analyze $dot(x) = mat(0, 1;-2, -3)x + mat(1, 0;0, 1)u$, $y = mat(1, 0;0, 1)x$.
]

#solved_problem[Minimal Realization][
  Analyze the minimal realization.
]
#solution[
  Find minimal realization of $G(s) = mat((s+1)/(s(s+2)), 1/(s+1);1/(s+2), 1/(s+2))$.
]

=== Supplementary Problems
#supplementary[Controllability Test][
  Determine controllability conditions for Jordan form system matrix with repeated eigenvalues.
]

#supplementary[Realization Algorithms][
  Compare Gilbert's method vs. Ho-Kalman algorithm for minimal realization.
]

== Canonical Forms of State Equations

=== Mathematical Review

*Canonical forms* provide standardized state-space representations that reveal system structure and simplify analysis and design.

#definition[Similarity Transformation][
  State-space systems $(A, B, C, D)$ and $(hat(A), hat(B), hat(C), hat(D))$ represent the same system if:
  $ hat(A) = T A T^(-1)$, $hat(B) = T B$, $hat(C) = C T^(-1)$, $hat(D) = D$
  where $T$ is an invertible transformation matrix.

  Transfer function invariance: $hat(G)(s) = G(s)$
]

#definition[Controllable Canonical Form][
  System in controllable canonical form:
  $ A_"cc" = mat(-(a_(n-1)), -(a_(n-2)), ..., -(a_1), -(a_0);1, 0, ..., 0, 0;0, 1, ..., 0;..., ...;0, 0, ..., 0, 1) $
  $ B_"cc" = vec(1, 0, 0, ..., 0) $
  $ C_"cc" = mat(b_(n-1), b_(n-2), ..., b_1, b_0) $

  Characteristic polynomial: $det(s I - A_"cc") = s^n + a_(n-1) s^(n-1) + ... + a_0$
]

#definition[Observable Canonical Form][
  System in observable canonical form:
  $ A_"oc" = mat(-(a_(n-1)), 1, 0, ..., 0;-(a_(n-2)), 0, 1, ..., 0;...;-(a_0), 0, 0, ..., 1) $
  $ B_"oc" = vec(b_(n-1), b_(n-2), ..., b_1, b_0) $
  $ C_"oc" = mat(1, 0, 0, ..., 0) $

  Characteristic polynomial: $det(s I - A_"oc") = s^n + a_(n-1) s^(n-1) + ... + a_0$
]

#definition[Jordan Canonical Form][
  System in Jordan canonical form:
  $ A_J = op("diag")(J_1, J_2, ..., J_k)$
  where each Jordan block:
]
$ J_i = mat(lambda_i, 1, 0, ..., 0;0, lambda_i, 1, ..., 0;..., ...;0, 0, ..., 1) $

Reveals eigenvalue structure and system dynamics.

#theorem[Diagonalization][
  System with distinct eigenvalues can be diagonalized:
  $ A_d = T^(-1) A T = op("diag")(lambda_1, lambda_2, ..., lambda_n) $
  Transformation columns: $T = mat(v_1, v_2, ..., v_n)$ (eigenvectors)
  Decoupled dynamics: $dot(z)_i = lambda_i z_i + (T^(-1) B)_i u$
]


#solution[
  Step 1: Characteristic polynomial
  $det(s I - A) = det(mat(s+2, -3;1, s)) = s^2 + 5s + 6$

  Step 2: Identify coefficients
  $a_1 = 5$, $a_0 = 6$

  Step 3: Controllable form
  $A_"cc" = mat(-5, -6;1, 0)$, $B_"cc" = vec(1, 0)$
  $C_"cc" = mat(b_1, b_0) = mat(5, 6)$

  Step 4: Find transformation matrix
  Solve $T A_"cc" = A T$, $T B_"cc" = B$
  $T = mat(1, 1;0, 1)$
  Verify: $A = T A_"cc" T^(-1)$, $B = T B_"cc"$ ✓
]


#solution[
  Step 1: Identify coefficients
  $a_2 = 4$, $a_1 = 5$, $a_0 = 6$
  $b_2 = 3$, $b_1 = 2$, $b_0 = 0$

  Step 2: Observable canonical matrices
  $A_"oc" = mat(-4, 1, 0;-5, 0, 1;-6, 0, 0)$
  $B_"oc" = vec(3, 2, 0)$
  $C_"oc" = mat(1, 0, 0)$

  Step 3: Verify
  Characteristic polynomial matches: $s^3 + 4s^2 + 5s + 6$ ✓
]


#solution[
  Step 1: Eigenvalue structure
  $lambda = 0$ with algebraic multiplicity 3

  Step 2: Jordan blocks
  One Jordan block of size 3:
  $J = mat(0, 1, 0;0, 0, 1;0, 0, 0)$

  Step 3: Physical interpretation
  $dot(x)_1 = x_2$, $dot(x)_2 = x_3$, $dot(x)_3 = 0$
  Chained integrators with no damping
]

=== Physical Interpretations

#definition[Modal Coordinates][
  Physical meaning of canonical forms:
  - *Controllable form*: Input effects on system modes
]
- *Observable form*: Output contributions from system states
- *Jordan form*: Natural frequencies and mode coupling
- *Diagonal form*: Independent system modes


#solution[
  Physical model: $M diaer(x) + K x = F(t)$
  State-space: $dot(x) = mat(0, I;-M^(-1)K, 0)x + vec(0, M^(-1))F(t)$
  Modal transformation: $x = T z$ where $T$ contains mode shapes
  Result: $diaer(z)_i + omega_i^2 z_i = f_i(t)$
  Each mode: independent second-order system
]

=== Solved Problems

#solved_problem[Canonical Transformation][
  Transform $dot(x) = mat(0, 1;0, -2)x + vec(0, 1)u$ to controllable canonical form.
]
#solution[
  Step 1: Characteristic polynomial
  $det(s I - A) = det(mat(s+1, 0;-1, s+2)) = s^2 + 2s + 3s + 2$

  Step 2: Identify coefficients
  $a_1 = 2$, $a_0 = 3$

  Step 3: Controllable form
  $A_"cc" = mat(-2, -3;1, 0)$, $B_"cc" = vec(1, 0)$
  $C_"cc" = mat(b_1, b_0) = mat(2, 3)$

  Step 4: Transformation matrix
  Solve $T A_"cc" = A T$, $T B_"cc" = B$
  $T = mat(1, 1;0, 1)$
  Verify: $A = T A_"cc" T^(-1)$, $B = T B_"cc"$ ✓
]

#solved_problem[Jordan Application][
  Analyze system with Jordan block $A_J = mat(lambda, 1, 0;0, lambda, 1;0, 0, lambda)$.
]
#solution[
  Step 1: System response
  $x_1(t) = (x_1(0) + x_2(0)t)e^(lambda t)$
  $x_2(t) = (x_2(0) + x_3(0)t)e^(lambda t)$
  $x_3(t) = (x_3(0) + x_3(1)t)e^(lambda t)$

  Step 2: Physical interpretation
  Mode 1: Standard first-order response
  Modes 2,3: Polynomia growth due to chain of integrators

  Step 3: System behavior
  Marginal stability with polynomial growth
]




#solved_problem[Controllable Form Conversion][
  Analyze the controllable form conversion.
]
#solution[
  Convert $dot(x) = mat(-2, -3;1, 0)x + vec(0, 1)u$ to controllable canonical form.
]

#solved_problem[Observable Form Conversion][
  Analyze the observable form conversion.
]
#solution[
  Transform to observable canonical form for $G(s) = (3s + 2)/(s^3 + 4s^2 + 5s + 6)$.
]

#solved_problem[Jordan Form Analysis][
  Analyze the jordan form analysis.
]
#solution[
  Analyze system $A = mat(0, 1, 0;0, 0, 1;0, 0, 0)$ (triple eigenvalue at origin).
]

#solved_problem[Physical System Analysis][
  Analyze the physical system analysis.
]
#solution[
  Analyze coupled mass-spring system using modal decomposition.
]

=== Supplementary Problems
#supplementary[Transform Properties][
  Prove that trace and determinant are invariant under similarity transformations.
]

#supplementary[Numerical Issues][
  Discuss numerical stability problems when computing Jordan forms for nearly repeated eigenvalues.
]

== Human-in-the-Loop: Epinephrine and Exogenous Disturbances

=== Mathematical Review

Designing control for bio-medical devices requires accounting for human physiology as a time-varying, uncertain plant subject to extreme exogenous disturbances.

#definition[Epinephrine as a Disturbance Input][
  Psychological or physiological stress triggers Epinephrine release, acting as a large disturbance $D(t)$ on the glucose-insulin loop:
  1. Hepatic glucose production increases: $P_G -> P_G + P_(G,e)(E)$.
  2. Beta-cell insulin secretion is suppressed: $beta -> beta(1 - alpha E)$.
  3. Peripheral insulin sensitivity decreases: $S_I -> S_I - rho E$.
]

#definition[Parameter Identification][
  Since biological parameters (e.g., $S_I$, $gamma$, $beta$) vary significantly between patients, clinical data ($G(t)$, $I(t)$ time series from blood draws) is used to identify personalized parameters by minimizing the least-squares fit:
  $ min_theta sum_i (y(t_i) - hat(y)(t_i; theta))^2 $
]

=== Solved Problems

#solved_problem[Disturbance Rejection Design][
  Describe qualitatively how a closed-loop insulin pump should respond to a sudden Epinephrine spike that raises $G$ by $80$ mg/dL within 5 minutes.
]
#solution[
  The pump must react with:
  - *Derivative action (D):* Detect the rapid rate-of-rise $G' >> 0$ and immediately deliver an extra bolus to counteract the glucose spike.
  - *Integral action (I):* Maintain a slightly elevated basal infusion rate until glucose returns to within the homeostatic band $[70, 140]$ mg/dL.
]

=== Supplementary Problems

#supplementary[Uncertainty in $S_I$][
  If $S_I$ is uncertain by $plus.minus 30%$, how should the proportional gain $K_p$ of the insulin pump PID controller be adjusted to maintain stability despite this uncertainty?
]

