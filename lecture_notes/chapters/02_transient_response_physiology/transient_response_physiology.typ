#import "../../../utils.typ": *
= Transient Response in Physiology

This chapter extends classical transient analysis to physiological contexts, contrasting continuous infusion (step response) with bolus injection (impulse response), and formalising Homeostasis as biological steady state.

== Impulse Response Function

=== Mathematical Review

The impulse response characterizes a system's behavior to an instantaneous input.

#definition[Impulse Response][
  The impulse response $h(t)$ is the output when input is the Dirac delta function $delta(t)$:
  $ h(t) = cal(L)^(-1){G(s)} $
  where $G(s)$ is the transfer function.
]



#theorem[Convolution Integral][
  The output $y(t)$ for any input $u(t)$ can be computed via convolution:
  $ y(t) = integral_0^t h(tau) u(t - tau) d tau = h(t) * u(t) $
]



#definition[Frequency Response][
  The frequency response is the Fourier transform of the impulse response:
  $ G(j omega) = integral_(-infinity)^infinity h(t) e^(-j omega t) d t $
]



=== Solved Problems

#solved_problem[Impulse Response from Transfer Function][
  Find impulse response for $G(s) = (s+2)/(s^2 + 3s + 2)$.
]
#solution[
  Factor denominator: $G(s) = (s+2)/((s+1)(s+2)) = 1/(s+1)$

  Taking inverse Laplace:
  $ h(t) = e^(-t) u(t) $
]

#solved_problem[Convolution Calculation][
  Find output for $h(t) = 2e^(-2t)$ with input $u(t) = 3u(t)$.
]
#solution[
  $ y(t) = integral_0^t 2e^(-2tau) dot 3 d tau = 6 integral_0^t e^(-2tau) d tau $
  $ = 6 [(-1/2)e^(-2tau)]_0^t = 3(1 - e^(-2t)) $
]




#solved_problem[First-Order Impulse Response][
  Analyze the first-order impulse response.
]
#solution[
  For $G(s) = 1/(s+a)$:
  $ h(t) = e^(-a t) u(t) $
  where $u(t)$ is the unit step function.
]

#solved_problem[Convolution Application][
  Analyze the convolution application.
]
#solution[
  For $h(t) = e^(-t)$ and $u(t) = u(t)$ (unit step):
  $ y(t) = integral_0^t e^(-tau) d tau = 1 - e^(-t) $
]

#solved_problem[Frequency Response Magnitude][
  Analyze the frequency response magnitude.
]
#solution[
  For $G(s) = 1/(s+1)$:
  $ |G(j omega)| = 1/sqrt(1 + omega^2) $
]

=== Supplementary Problems
#supplementary[Second-Order Impulse][
  Find impulse response for $G(s) = omega_n^2/(s^2 + 2 zeta omega_n s + omega_n^2)$ with $zeta < 1$.
]

#supplementary[Convolution Properties][
  Prove that convolution is commutative: $h * u = u * h$.
]

== First-Order Systems

=== Mathematical Review

First-order systems are the simplest dynamic systems, characterized by a single energy storage element.

#definition[First-Order Transfer Function][
  Standard form:
  $ G(s) = K/(tau s + 1) $
  where $K$ is DC gain and $tau$ is time constant.
]



#theorem[Step Response][
  For unit step input:
  $ y(t) = K(1 - e^(-t/tau)) $
  - Reaches 63.2% of final value at $t = tau$
  - Reaches 95% at $t = 3tau$
  - Reaches 98% at $t = 4tau$
]



#definition[Performance Metrics][
  - *Rise time ($t_r$):* Time to go from 10% to 90% of final value: $t_r approx 2.2 tau$
  - *Settling time ($t_s$):* Time to stay within 2% of final value: $t_s approx 4 tau$
]



=== Solved Problems

#solved_problem[Design for Settling Time][
  Design first-order system with $t_s = 0.2"s"$.
]
#solution[
  From $t_s = 4 tau$:
  $ tau = t_s/4 = 0.2/4 = 0.05"s" $

  Transfer function: $G(s) = K/(0.05 s + 1)$
]

#solved_problem[Ramp Response][
  Find steady-state error for ramp input $r(t) = t$ with $G(s) = 2/(s+1)$.
]
#solution[
  For ramp input $R(s) = 1/s^2$:
  $ Y(s) = G(s)R(s) = 2/(s(s+1)) dot 1/s = 2/(s^2(s+1)) $

  Steady-state error:
  $ e_("ss") = lim_(t -> infinity) (r(t) - y(t)) = lim_(s -> 0) s E(s) $
  $ E(s) = R(s) - Y(s) = 1/s^2 - 2/(s^2(s+1)) = (s+1-2)/(s^2(s+1)) = (s-1)/(s^2(s+1)) $
  $ e_("ss") = lim_(s -> 0) s dot (s-1)/(s^2(s+1)) = lim_(s -> 0) (s-1)/(s(s+1)) = -1/0 = infinity $

  First-order system cannot track ramp with zero error.
]




#solved_problem[RC Circuit][
  Analyze the rc circuit.
]
#solution[
  For RC circuit: $G(s) = 1/(R C s + 1)$ with $tau = R C$.
]

#solved_problem[Time Constant Calculation][
  Analyze the time constant calculation.
]
#solution[
  For $tau = 2"s"$, $K = 5$:
  - At $t = 2"s"$: $y = 5(1 - e^(-1)) = 3.16$
  - At $t = 6"s"$: $y = 5(1 - e^(-3)) = 4.75$
]

#solved_problem[Performance Calculation][
  Analyze the performance calculation.
]
#solution[
  For $tau = 0.5"s"$:
  - $t_r = 2.2 times 0.5 = 1.1"s"$
  - $t_s = 4 times 0.5 = 2"s"$
]

=== Supplementary Problems
#supplementary[Thermal System][
  A room has time constant $tau = 30"min"$. How long to reach 90% of desired temperature?
]

#supplementary[Multiple Time Constants][
  Analyze system with two cascaded first-order blocks.
]

== Second-Order Systems

=== Mathematical Review

Second-order systems exhibit rich dynamic behavior including oscillations and overshoot.

#definition[Standard Second-Order Form][
  $ G(s) = (omega_n^2)/(s^2 + 2 zeta omega_n s + omega_n^2) $
  where:
  - $omega_n$: natural frequency (rad/s)
  - $zeta$: damping ratio (dimensionless)
]



#definition[Damping Cases][
  - *Underdamped ($zeta < 1$):* Oscillatory response
  - *Critically damped ($zeta = 1$):* Fastest non-oscillatory
  - *Overdamped ($zeta > 1$):* Slow, non-oscillatory
]



#theorem[Step Response (Underdamped)][
  For $zeta < 1$:
  $ y(t) = 1 - (e^(-zeta omega_n t))/sqrt(1 - zeta^2) sin(omega_d t + phi) $
  where $omega_d = omega_n sqrt(1 - zeta^2)$ is damped frequency.
]



=== Solved Problems

#solved_problem[Design for 10% Overshoot][
  Find $zeta$ for $M_p = 10\%$ and calculate $t_s$ if $omega_n = 5$ rad/s.
]
#solution[
  From overshoot formula:
  $ 0.10 = e^((-pi zeta)/sqrt(1-zeta^2)) $
  $ ln(0.10) = (-pi zeta)/sqrt(1-zeta^2) $
  $ -2.303 = (-pi zeta)/sqrt(1-zeta^2) $

  Solving: $zeta approx 0.591$

  Settling time:
  $ t_s = 4/(zeta omega_n) = 4/(0.591 times 5) = 1.35"s" $
]

#solved_problem[Pole Placement][
  Place poles at $s = -2 plus.minus 3j$ for $G(s) = omega_n^2/(s^2 + 2 zeta omega_n s + omega_n^2)$.
]
#solution[
  From pole locations:
  $ -zeta omega_n = -2 => zeta omega_n = 2 $
  $ omega_n sqrt(1-zeta^2) = 3 $

  Squaring second equation:
  $ omega_n^2(1-zeta^2) = 9 $
  $ omega_n^2 - (zeta omega_n)^2 = 9 $
  $ omega_n^2 - 4 = 9 $
  $ omega_n = sqrt(13) = 3.606 "rad/s" $
  $ zeta = 2/3.606 = 0.555 $
]




#solved_problem[Mass-Spring-Damper][
  Analyze the mass-spring-damper.
]
#solution[
  For $M diaer(x) + B dot(x) + K x = F$:
  $ omega_n = sqrt(K/M), quad zeta = B/(2 sqrt(K M)) $
]

#solved_problem[Pole Locations][
  Analyze the pole locations.
]
#solution[
  Poles: $s = -zeta omega_n plus.minus omega_n sqrt(zeta^2 - 1)$

  For $zeta < 1$: $s = -zeta omega_n plus.minus j omega_n sqrt(1 - zeta^2)$
]

#solved_problem[Performance Specs][
  Analyze the performance specs.
]
#solution[
  - *Peak time:* $t_p = pi/omega_d$
  - *Percent overshoot:* $M_p = e^((-pi zeta)/sqrt(1-zeta^2)) times 100\%$
  - *Settling time:* $t_s approx 4/(zeta omega_n)$ (2% criterion)
]

=== Supplementary Problems
#supplementary[Critically Damped Design][
  Design system for fastest response without overshoot.
]

#supplementary[Bandwidth Calculation][
  Find bandwidth for second-order system with $omega_n = 10$, $zeta = 0.7$.
]

#supplementary[Resonance Peak][
  Calculate resonance peak $M_r$ for underdamped system.
]

== Steady-State Error Analysis

=== Mathematical Review

Steady-state error quantifies the difference between desired and actual output as $t -> infinity$.

#definition[Steady-State Error][
  $ e_("ss") = lim_(t -> infinity) e(t) = lim_(s -> 0) s E(s) $
  where $E(s) = R(s) - Y(s)$ for unity feedback.
]



#definition[System Type][
  System type $N$ is the number of integrators ($1/s$ terms) in open-loop transfer function $G(s)H(s)$.

  $ G(s)H(s) = K s^N (1 + T_1 s)(1 + T_2 s).../(1 + T_a s)(1 + T_b s)... $
]



#theorem[Error Constants][
  - *Position error constant:* $K_p = lim_(s -> 0) G(s)$
  - *Velocity error constant:* $K_v = lim_(s -> 0) s G(s)$
  - *Acceleration error constant:* $K_a = lim_(s -> 0) s^2 G(s)$
]



#definition[Steady-State Error Table][
  | Input | Type 0 | Type 1 | Type 2 |
  |-------|--------|--------|--------|
  | Step | $1/(1+K_p)$ | 0 | 0 |
  | Ramp | $infinity$ | $1/K_v$ | 0 |
  | Parabola | $infinity$ | $infinity$ | $1/K_a$ |
]



=== Solved Problems

#solved_problem[Design for Error Specification][
  Design Type 1 system with $e_("ss") <= 0.1$ for ramp input.
]
#solution[
  For Type 1 system with ramp:
  $ e_("ss") = 1/K_v $

  Requirement: $1/K_v <= 0.1$
  $ K_v >= 10 $

  For $G(s) = K/(s(s+a))$:
  $ K_v = lim_(s -> 0) s dot K/(s(s+a)) = K/a $

  Choose $K = 10a$ (e.g., $a=1, K=10$):
  $ G(s) = 10/(s(s+1)) $
]

#solved_problem[Error with Disturbance][
  Find steady-state error due to disturbance $D(s) = 1/s$ for system with $G(s) = 5/(s+1)$, unity feedback.
]
#solution[
  For disturbance at plant output:
  $ Y(s) = (G/(1+G))R(s) + (1/(1+G))D(s) $

  With $R(s) = 0$ (no reference):
  $ Y(s) = (1/(1+G(s))) dot 1/s $

  Steady-state output:
  $ y_("ss") = lim_(s -> 0) s dot 1/(1+G(s)) dot 1/s = 1/(1+G(0)) = 1/(1+5) = 1/6 $

  This is the steady-state error due to disturbance.
]




#solved_problem[Step Input Error][
  Analyze the step input error.
]
#solution[
  For $R(s) = 1/s$ (unit step):
  $ e_("ss") = lim_(s -> 0) s dot 1/s dot 1/(1+G(s)) = 1/(1+G(0)) $
]

#solved_problem[Type Classification][
  Analyze the type classification.
]
#solution[
  - $G(s) = K/(s+1)$: Type 0
  - $G(s) = K/(s(s+1))$: Type 1
  - $G(s) = K/(s^2(s+1))$: Type 2
]

#solved_problem[Error Constant Calculation][
  Analyze the error constant calculation.
]
#solution[
  For $G(s) = 10/(s(s+2))$:
  - $K_p = lim_(s -> 0) 10/(s(s+2)) = infinity$ (Type 1)
  - $K_v = lim_(s -> 0) s dot 10/(s(s+2)) = 5$
  - $K_a = lim_(s -> 0) s^2 dot 10/(s(s+2)) = 0$
]

#solved_problem[Error for Ramp][
  Analyze the error for ramp.
]
#solution[
  Type 1 system with $K_v = 5$ tracking ramp $r(t) = t$:
  $ e_("ss") = 1/K_v = 1/5 = 0.2 $
]

=== Supplementary Problems
#supplementary[Non-Unity Feedback][
  Derive error formula for $H(s) != 1$.
]

#supplementary[Disturbance Rejection][
  Compare Type 0 vs Type 1 for disturbance rejection.
]

#supplementary[Tracking Error][
  Find error for sinusoidal input $r(t) = sin(omega t)$.
]

== Bolus vs. Continuous Infusion (Step vs. Impulse in Physiology)

=== Mathematical Review

Two fundamental drug administration strategies map directly to classical control test signals:

#definition[Continuous Infusion (Step Input)][
  Drug is administered at a constant rate $R(t) = R_0 u(t)$. The blood concentration rises exponentially to a new steady state: $C(t) = C^*(1 - e^(-k t))$. This mirrors a step response in a first-order system.
]

#definition[Bolus Injection (Impulse Input)][
  The total dose $D_0$ is delivered instantaneously at $t=0$, modeled as $R(t) = D_0 delta(t)$. The subsequent washout follows: $C(t) = D_0/V dot e^(-k t)$. This mirrors an impulse response.
]

=== Solved Problems

#solved_problem[Bolus vs. Infusion Concentration Profiles][
  Sketch the qualitative $C(t)$ for a $100$ mg bolus versus a $100$ mg/hr infusion in a one-compartment system with $k = 1$ $"hr"^(-1)$.
]
#solution[
  - *Bolus:* $C(0^+) = 100/V$ mg/L, decaying as $C(t) = (100/V) e^(-t)$.
  - *Infusion:* $C(0) = 0$, rising to $C^* = 100/(k V)$ mg/L asymptotically. Both reach the same $C^*$ but via opposite trajectories.
]

=== Supplementary Problems

#supplementary[Repeated Dosing Steady State][
  For a bolus administered every $T$ hours, show the average steady-state concentration equals $D_0 / (k T V)$.
]

== Homeostasis as Biological Steady State

=== Mathematical Review

#definition[Homeostasis][
  The self-regulatory process by which a biological system maintains its internal state near a reference set-point despite external disturbances. Formally, a system is homeostatic if its equilibrium $x^*$ is stable: $lim_(t -> infinity) x(t) = x^*$ for all initial conditions in a neighborhood.
]

#definition[Type 1 Biological Regulation][
  For a system to exhibit zero steady-state error to persistent disturbances (e.g., constant glucose intake), it must act as a Type 1 controller — i.e., possess at least one integrator in the closed-loop. Endocrine systems often achieve this through integral-like feedback (slow protein synthesis and degradation).
]

=== Solved Problems

#solved_problem[Homeostatic Controller Classification][
  A simple hormone system follows $H'(t) = -a H + b (G - G_0)$ where $H$ is hormone level, $G$ is glucose, and $G_0$ is the set-point. Identify the control action type.
]
#solution[
  This is a *proportional* controller. The hormone output is proportional to the current error $(G - G_0)$. In steady state: $H^* = b(G^* - G_0)/a$. If $G^* != G_0$, there is a non-zero steady-state error.
]

=== Supplementary Problems

#supplementary[Integral Adaptation][
  Modify the above system so that it adds an integral term. Show how this eliminates steady-state error even in the presence of a constant glucose disturbance.
]

