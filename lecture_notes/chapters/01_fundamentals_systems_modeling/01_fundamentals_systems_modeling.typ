#import "../../../utils.typ": *
= Fundamentals of Systems Modeling

This chapter establishes the mathematical and physical foundations of dynamic systems modeling, extending classical techniques to bio-system applications including compartmental analysis, mass balance, and the glucose-insulin feedback loop.

== Transfer Function

=== Mathematical Review

The *Transfer Function* $G(s)$ of a Linear Time-Invariant (LTI) system is defined as the ratio of the Laplace transform of the output $Y(s)$ to the Laplace transform of the input $U(s)$, assuming all initial conditions are zero.

#definition[Transfer Function][
  $ G(s) = Y(s) / U(s) = (b_m s^m + ... + b_1 s + b_0) / (a_n s^n + ... + a_1 s + a_0) $
  where $n >= m$ for physical realizability. The roots of the denominator are the *poles*, and the roots of the numerator are the *zeros*.
]



*Impulse Response:* The system output when the input is a Dirac delta function $delta(t)$. Its Laplace transform is $G(s)$.

=== Solved Problems

#solved_problem[RC Circuit][
  Consider a series RC circuit where the input is voltage $v_{in}(t)$ and output is capacitor voltage $v_c(t)$. Find $G(s)$.
]
#solution[
  Kirchhoff's voltage law:
  $ v_{in}(t) = R i(t) + v_c(t) $
  Current relation: $i(t) = C dot(v)_c(t)$.
  Substituting:
  $ v_{in}(t) = R C dot(v)_c(t) + v_c(t) $
  Taking Laplace transform (zero initial conditions):
  $ V_{in}(s) = (R C s + 1) V_c(s) $
  Transfer function:
  $ G(s) = V_c(s) / V_{in}(s) = 1 / (R C s + 1) $
]

#solved_problem[Poles and Stability][
  Given $G(s) = 10 / (s^2 + 2s + 5)$, find the poles and determine stability.
]
#solution[
  The poles are roots of $s^2 + 2s + 5 = 0$.
  Using quadratic formula:
  $ s = (-2 +- sqrt(4 - 20)) / 2 = -1 +- 2j $
  Since the real part ($-1$) is negative, the system is *stable*.
]




#solved_problem[Zero-Pole Example][
  Analyze the zero-pole example.
]
#solution[
  $G(s) = (s+2)/(s(s+3))$. Zero at $s=-2$. Poles at $s=0, s=-3$.
]

=== Supplementary Problems
#supplementary[Mechanical System][
  Find transfer function $X(s)/F(s)$ for a mass-spring-damper system: $M diaer(x) + B dot(x) + K x = f(t)$.
]

#supplementary[Zero Locations][
  How do zeros in the right-half plane (non-minimum phase) affect the step response?
]

== Block Diagrams and Signal Flow Graphs

=== Mathematical Review

*Block Diagrams* graphically represent systems where functional blocks are connected by signals.

#definition[Block Diagram Algebra][
  - *Series:* $G_{eq}(s) = G_1(s) G_2(s)$
  - *Parallel:* $G_{eq}(s) = G_1(s) + G_2(s)$
  - *Feedback Loop:* For negative feedback $H(s)$, the closed-loop transfer function is:
    $ T(s) = G(s) / (1 + G(s)H(s)) $
]



*Signal Flow Graphs (SFG)* are directed graphs where nodes represent variables and branches represent gains. *Mason's Gain Formula* computes the transfer function of an SFG.

=== Solved Problems

#solved_problem[Feedback Reduction][
  A system has forward path $G(s) = K / (s+1)$ and unity negative feedback ($H(s)=1$). Find the closed loop transfer function $T(s)$.
]
#solution[
  Using the feedback formula:
  $ T(s) = G(s) / (1 + G(s)) = (K / (s+1)) / (1 + K / (s+1)) $
  Multiply numerator and denominator by $(s+1)$:
  $ T(s) = K / (s + 1 + K) $
]

#solved_problem[Mason's Rule Application][
  Find the transfer function $C/R$ for a simple loop with forward gain $G$ and feedback $H$.
]
#solution[
  - Forward paths: $P_1 = G$.
  - Loops: $L_1 = -G H$.
  - Determinant $Delta = 1 - (sum L_i) = 1 - (-G H) = 1 + G H$.
  - Path cofactor $Delta_1 = 1$ (loop touches the path).
  - Result: $T = (P_1 Delta_1) / Delta = G / (1 + G H)$.
]




#solved_problem[System in Series][
  Analyze the system in series.
]
#solution[
  Two blocks $G_1(s) = s$ and $G_2(s) = 1/s$ in series give $G_{eq}(s) = s dot (1/s) = 1$.
]

=== Supplementary Problems
#supplementary[Multiple Loops][
  Simplify a block diagram with two nested feedback loops.
]

#supplementary[Signal Flow Construction][
  Draw the Signal Flow Graph corresponding to the equations: $x_2 = a x_1 + b x_3$, $x_3 = c x_2$.
]

== State-Space Representation of Dynamic Systems

=== Mathematical Review

State-space representation provides a unified framework for modeling dynamic systems regardless of their physical nature.

#definition[State-Space Model][
  A dynamic system can be represented by:
  $ dot(x)(t) = f(x(t), u(t), t) $
  $ y(t) = g(x(t), u(t), t) $
  where $x in RR^n$ is the state vector, $u in RR^m$ is the input, and $y in RR^p$ is the output.
]



#definition[Linear Time-Invariant (LTI) Systems][
  For LTI systems:
  $ dot(x) = A x + B u $
  $ y = C x + D u $
  where $A, B, C, D$ are constant matrices.
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




#solved_problem[Mass-Spring-Damper System][
  Analyze the mass-spring-damper system.
]
#solution[
  For $M diaer(x) + B dot(x) + K x = F$, let $x_1 = x, x_2 = dot(x)$:
  $ dot(x)_1 = x_2 $
  $ dot(x)_2 = -K/M x_1 - B/M x_2 + 1/M F $
]

#solved_problem[RC Circuit State-Space][
  Analyze the rc circuit state-space.
]
#solution[
  For an RC circuit with $dot(v)_C = -1/(R C) v_C + 1/(R C) v_("in")$:
  $ A = [-1/(R C)], quad B = [1/(R C)], quad C = [1], quad D = [0] $
]

=== Supplementary Problems
#supplementary[Mechanical System][
  Derive state-space equations for a cart-pendulum system.
]

#supplementary[Thermal System][
  Model a heated tank with state-space representation where states are temperatures.
]

== Basic Control Actions

=== Mathematical Review

Control actions define how the controller responds to error signals.

#definition[Proportional Action (P)][
  Output is proportional to error:
  $ u(t) = K_p e(t) $
  - *Advantage:* Fast response
  - *Disadvantage:* Steady-state error
]



#definition[Integral Action (I)][
  Output is proportional to accumulated error:
  $ u(t) = K_i integral_0^t e(tau) d tau $
  - *Advantage:* Eliminates steady-state error
  - *Disadvantage:* Can cause overshoot and oscillation
]



#definition[Derivative Action (D)][
  Output is proportional to rate of error change:
  $ u(t) = K_d (d e)/(d t) $
  - *Advantage:* Anticipates future error, improves damping
  - *Disadvantage:* Amplifies noise
]



=== Solved Problems

#solved_problem[Compare P vs PI Control][
  Compare steady-state error for P and PI control on $G(s) = 1/(s+1)$.
]
#solution[
  *P Control:* $C(s) = K_p$
  $ e_("ss") = 1/(1 + K_p G(0)) = 1/(1 + K_p) != 0 $

  *PI Control:* $C(s) = K_p + K_i/s$
  System becomes Type 1, so:
  $ e_("ss") = 0 quad "(for step input)" $

  PI eliminates steady-state error.
]

#solved_problem[Effect of Derivative Action][
  Show how D action improves damping for $G(s) = 1/(s^2 + s + 1)$.
]
#solution[
  *Without D:* Closed-loop poles from $s^2 + s + 1 + K_p = 0$

  *With PD:* $C(s) = K_p + K_d s$
  Closed-loop: $s^2 + (1 + K_d)s + (1 + K_p) = 0$

  Damping ratio: $zeta = (1 + K_d)/(2 sqrt(1 + K_p))$

  Increasing $K_d$ increases $zeta$, improving damping.
]




#solved_problem[P Action Response][
  Analyze the p action response.
]
#solution[
  For $e = 0.5$ and $K_p = 10$: $u = 5$
]

#solved_problem[I Action Response][
  Analyze the i action response.
]
#solution[
  For constant $e = 0.1$ over $t = 5"s"$ with $K_i = 2$:
  $ u = 2 times 0.1 times 5 = 1.0 $
]

#solved_problem[D Action Response][
  Analyze the d action response.
]
#solution[
  For $e(t) = 0.5 t$ (ramp), $dot(e) = 0.5$, $K_d = 4$:
  $ u = 4 times 0.5 = 2.0 $
]

=== Supplementary Problems
#supplementary[PI Tuning][
  Tune $K_p$ and $K_i$ for critically damped response.
]

#supplementary[Noise Sensitivity][
  Analyze how D action amplifies measurement noise.
]

#supplementary[Action Combination][
  Explain why PD control is rarely used alone.
]

== The PID Controller

=== Mathematical Review

The PID controller combines proportional, integral, and derivative actions for optimal performance.

#definition[PID Controller][
  The PID control law:
  $ u(t) = K_p e(t) + K_i integral_0^t e(tau) d tau + K_d (d e)/(d t) $

  Transfer function form:
  $ C(s) = K_p + K_i/s + K_d s = (K_p s + K_i + K_d s^2)/s $
]



#definition[Parallel vs Series Form][
  *Parallel (ideal):* $C(s) = K_p(1 + 1/(T_i s) + T_d s)$

  *Series (interacting):* $C(s) = K_c(1 + 1/(T_i s))(1 + T_d s)$
]



#theorem[PID Effect on System Type][
  Adding PID increases system type by 1 due to integral action, eliminating steady-state error for step inputs.
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




#solved_problem[PID Parameters][
  Analyze the pid parameters.
]
#solution[
  For $K_p = 5$, $K_i = 2$, $K_d = 1$:
  $ C(s) = 5 + 2/s + s = (s^2 + 5s + 2)/s $
]

#solved_problem[Series Form Expansion][
  Analyze the series form expansion.
]
#solution[
  $ C(s) = K_c(1 + 1/(T_i s))(1 + T_d s) = K_c(1 + T_d s + 1/(T_i s) + T_d/(T_i)) $
]

#solved_problem[Type Enhancement][
  Analyze the type enhancement.
]
#solution[
  Type 0 plant $G(s) = 1/(s+1)$ with PI becomes Type 1:
  $ G_c(s) = (K_p + K_i/s) dot 1/(s+1) = (K_p s + K_i)/(s(s+1)) $
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

== Reduction of Parameter Variation via Feedback

=== Mathematical Review

Feedback control reduces the sensitivity of system performance to parameter variations and disturbances.

#definition[Sensitivity Function][
  Sensitivity of closed-loop transfer function $T$ to plant parameter $p$:
  $ S_p^T = (partial T)/(partial p) dot p/T $
]



#theorem[Feedback Reduces Sensitivity][
  With high loop gain $K G >> 1$:
  $ T approx 1/H quad "(independent of" G")" $
  where $H$ is feedback transfer function.
]



#definition[Disturbance Rejection][
  For disturbance $d$ entering at plant output:
  $ Y(s) = (G/(1 + G H))R(s) + (1/(1 + G H))D(s) $
  High $G H$ reduces disturbance effect.
]



=== Solved Problems

#solved_problem[Calculate Sensitivity Reduction][
  Compare open-loop and closed-loop sensitivity for $G = K/(s+1)$ with unity feedback.
]
#solution[
  *Open-loop:* $T_("ol") = K/(s+1)$
  $ S_K^(T_("ol")) = (partial T_("ol"))/(partial K) dot K/T_("ol") = 1 $

  *Closed-loop:* $T_("cl") = K/(s+1+K)$
  $ S_K^(T_("cl")) = (partial T_("cl"))/(partial K) dot K/T_("cl") = (s+1)/(s+1+K) $

  At steady-state ($s=0$):
  $ S_K^(T_("cl")) = 1/(1+K) $

  For $K=10$: sensitivity reduced by factor of 11.
]

#solved_problem[Disturbance Rejection Design][
  Design controller to reject disturbance by 95% at steady-state.
]
#solution[
  Disturbance transfer function:
  $ Y(s)/D(s) = 1/(1 + G(s)C(s)) $

  At steady-state ($s=0$), require:
  $ |Y(0)/D(0)| = 1/(1 + G(0)C(0)) <= 0.05 $

  Solving:
  $ 1 + G(0)C(0) >= 20 $
  $ G(0)C(0) >= 19 $

  If $G(0) = 2$, then $C(0) >= 9.5$.
  Use PI controller with $K_i$ large enough.
]




#solved_problem[Sensitivity to Gain][
  Analyze the sensitivity to gain.
]
#solution[
  For $T = (K G)/(1 + K G)$:
  $ S_K^T = (partial T)/(partial K) dot K/T = 1/(1 + K G) $
  As $K -> infinity$, $S_K^T -> 0$ (low sensitivity).
]

#solved_problem[Parameter Insensitivity][
  Analyze the parameter insensitivity.
]
#solution[
  Open-loop: $y = G u$ (fully dependent on $G$)
  Closed-loop: $y = G/(1 + G H) r approx 1/H r$ (independent of $G$ for high gain)
]

#solved_problem[Disturbance Attenuation][
  Analyze the disturbance attenuation.
]
#solution[
  With $G H = 100$:
  $ Y(s) = (100/101)R(s) + (1/101)D(s) $
  Disturbance is attenuated by factor of 101.
]

=== Supplementary Problems
#supplementary[Robustness Analysis][
  Analyze robustness to 20% variation in plant gain.
]

#supplementary[Multiple Disturbances][
  Design controller to reject disturbances at different frequencies.
]

#supplementary[Measurement Noise][
  Balance disturbance rejection with noise amplification.
]

== Traditional Systems Analysis

=== Mathematical Review

Traditional systems include mechanical, electrical, and thermal systems, each governed by fundamental physical laws.

#definition[Mechanical Systems][
  Governed by Newton's laws. Key elements:
  - *Mass ($M$):* $F = M a$
  - *Spring ($K$):* $F = K x$
  - *Damper ($B$):* $F = B dot(x)$
]



#definition[Electrical Systems][
  Governed by Kirchhoff's laws. Key elements:
  - *Resistor ($R$):* $v = R i$
  - *Capacitor ($C$):* $i = C dot(v)$
  - *Inductor ($L$):* $v = L dot(i)$
]



#definition[Thermal Systems][
  Governed by heat transfer laws:
  - *Thermal Capacitance ($C$):* $Q = C T$
  - *Thermal Resistance ($R$):* $q = (T_1 - T_2)/R$
]



=== Solved Problems

#solved_problem[Mass-Spring System Response][
  Find natural frequency for $M diaer(x) + K x = 0$ with $M=2 "kg"$, $K=8 "N/m"$.
]
#solution[
  Characteristic equation: $M s^2 + K = 0$
  $ s^2 = -K/M = -8/2 = -4 $
  $ s = plus.minus 2j $
  Natural frequency: $omega_n = 2 "rad/s"$
]

#solved_problem[RC Circuit Time Constant][
  For $R C dot(v)_C + v_C = v_("in")$ with $R=1000 Omega$, $C=10 mu F$, find time constant.
]
#solution[
  Standard form: $tau dot(v)_C + v_C = v_("in")$
  Time constant: $tau = R C = 1000 times 10 times 10^(-6) = 0.01 "s" = 10 "ms"$
]




#solved_problem[Simple Pendulum][
  Analyze the simple pendulum.
]
#solution[
  For small angles: $M L^2 diaer(theta) + B dot(theta) + M g L theta = tau$
]

#solved_problem[RL Circuit][
  Analyze the rl circuit.
]
#solution[
  Series RL: $L dot(i) + R i = v_("in")$
]

#solved_problem[Heated Room][
  Analyze the heated room.
]
#solution[
  $C dot(T) = q_("in") - (T - T_("amb"))/R$
]

=== Supplementary Problems
#supplementary[Coupled Masses][
  Derive equations for two masses connected by springs.
]

#supplementary[Bridge Circuit][
  Analyze a Wheatstone bridge using Kirchhoff's laws.
]

#supplementary[Heat Exchanger][
  Model a counter-flow heat exchanger with thermal resistances.
]

== Compartmental Modeling and Mass Balance

=== Mathematical Review

A computational model of a biological system starts from mass balance principles. Each compartment represents a kinetically homogeneous region where the rate of concentration change equals production minus clearance.

#definition[Mass Balance in a Compartment][
  For a scalar state variable $C(t)$ representing concentration in a compartment with volume $V$:
  $ V dot C'(t) = P(t) - Q(C) $
  where $P(t)$ is the external production/infusion rate and $Q(C)$ is the clearance rate.
  For linear clearance: $Q(C) = k V C$, giving $C' = P(t)/V - k C$.
]

#definition[Production vs. Clearance (Aclaramiento)][
  - *Production:* Inflow from external sources (infusion, endogenous synthesis).
  - *Clearance:* Rate of removal from the compartment, often modeled as first-order decay $k C$ or Michaelis-Menten saturation $V_"max" C / (K_m + C)$.
]

=== Solved Problems

#solved_problem[One-Compartment Equilibrium][
  Find the steady-state drug concentration for constant infusion $P_0$ into a single compartment with first-order clearance rate $k$.
]
#solution[
  At equilibrium, $C' = 0$:
  $ 0 = P_0 - k C^* => C^* = P_0 / k $
]

=== Supplementary Problems

#supplementary[Michaelis-Menten Steady State][
  Replace linear clearance with Michaelis-Menten kinetics. Show that the equilibrium satisfies $P_0 = V_"max" C^* / (K_m + C^*)$ and solve for $C^*$.
]

== The Glucose-Insulin-Beta Cell Feedback Loop

=== Mathematical Review

The blood glucose regulation system is a canonical negative feedback control loop. The pancreatic Beta cells sense glucose, secrete insulin, which then drives glucose uptake in peripheral tissues.

#definition[Control System Analogy][
  - *Reference:* The basal glucose set-point $G_0 approx 90$ mg/dL.
  - *Sensor/Controller:* Beta-cell mass sensing $G$ and secreting insulin $I$.
  - *Actuator:* Insulin circulating in blood, promoting glucose uptake.
  - *Plant:* The bloodstream distributing glucose and insulin.
  - *Feedback:* Rising $I$ reduces $G$, closing the loop (negative feedback).
]

#definition[Minimal Model Structure][
  $ G' &= P_G - k_X G - S_I I G \
    I' &= beta f(G) - gamma I $
  where $P_G$ is hepatic glucose production, $k_X$ is insulin-independent clearance, $S_I$ is insulin sensitivity, $beta$ is beta-cell secretion gain, and $gamma$ is insulin decay.
]

=== Solved Problems

#solved_problem[Equilibrium of the Minimal Model][
  Set $G' = 0$ and $I' = 0$ to find the basal equilibrium $(G^*, I^*)$.
]
#solution[
  From $I' = 0$: $I^* = beta f(G^*)/gamma$.
  Substituting into $G' = 0$: $P_G = G^*(k_X + S_I I^*)$.
  This nonlinear equation in $G^*$ can be solved graphically (load line intersection) or numerically.
]

=== Supplementary Problems

#supplementary[Effect of Insulin Resistance][
  Let $S_I -> 0$. Show that for the same $P_G$, the equilibrium $G^*$ increases unboundedly, representing hyperglycemia.
]

