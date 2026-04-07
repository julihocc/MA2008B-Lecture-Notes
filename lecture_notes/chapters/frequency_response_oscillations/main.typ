#import "../../../utils.typ": *
= Frequency Response and Oscillations

This chapter covers frequency-domain analysis of control systems — Bode plots, Nyquist criterion, and stability — extended to biological rhythms and oscillatory physiological phenomena.

== Bode Plots

=== Mathematical Review

The *frequency response* of a system is obtained by evaluating the transfer function along the imaginary axis $s = j omega$, where $omega$ is the angular frequency in radians per second.

#definition[Frequency Response][
  The frequency response $G(j omega)$ is obtained from the transfer function $G(s)$ by substituting $s = j omega$:
  $ G(j omega) = G(s)|_(s=j omega) = abs(G(j omega)) e^(j angle(G(j omega))) $
  where $abs(G(j omega))$ is the magnitude and $angle(G(j omega))$ is the phase angle.
]

#definition[Bode Plots][
  Bode plots consist of two separate graphs:
  1. *Magnitude plot*: $20 log_(10) abs(G(j omega))$ (in decibels) vs $log_(10)(omega)$
  2. *Phase plot*: $angle(G(j omega))$ (in degrees) vs $log_(10)(omega)$
]



=== Construction Rules

#theorem[First-Order Terms][
  For a term $(1 + j omega/omega_c)$:
  - Low frequency asymptote: 0 dB
  - High frequency asymptote: $+20 log_(10)(omega/omega_c)$ dB
  - Break frequency: $omega_c$
  - Phase: $0°$ to $+90°$ over 2 decades
]

#theorem[Second-Order Terms][
  For $1 + 2 zeta (j omega/omega_n) + (j omega/omega_n)^2$:
  - Natural frequency: $omega_n$
  - Damping ratio: $zeta$
  - Resonant peak occurs for $zeta < 1/sqrt(2)$
]

=== Solved Problems

#solved_problem[Bode Plot Construction][
  Construct the Bode plot for $G(s) = 10(s+2)/(s(s+5)(s+10))$.
]
#solution[
  Rewrite in standard form:
  $ G(s) = (10 × 2/5 × 10) (s/2 + 1)/(s/1 (s/5 + 1) (s/10 + 1)) = 0.4 (s/2 + 1)/(s (s/5 + 1) (s/10 + 1)) $

  *Magnitude plot:*
  - Low frequency: $-20 log_(10)(omega)$ (integrator)
  - Break frequencies: $omega = 2, 5, 10$ rad/s
  - High frequency: $-40 log_(10)(omega)$

  *Phase plot:*
  - Start at $-90°$ (integrator)
  - Add $+90°$ at $omega = 2$ (zero)
  - Add $-90°$ at $omega = 5$ (pole)
  - Add $-90°$ at $omega = 10$ (pole)
  - End at $-180°$
]

#solved_problem[System Identification][
  From Bode magnitude data, identify the transfer function if the magnitude decreases by 20 dB/decade at high frequencies and has a break frequency at $omega = 1$ rad/s.
]
#solution[
  A 20 dB/decade slope indicates one pole more than zeros.
  The break frequency at $omega = 1$ suggests a pole at $s = -1$.
  Possible transfer function: $G(s) = K/(s + 1)$
  The gain $K$ is determined from the low-frequency magnitude.
]




#solved_problem[First-Order System][
  Analyze the first-order system.
]
#solution[
  For $G(s) = K/(tau s + 1)$, the frequency response is:
  $ G(j omega) = K/(j omega tau + 1) $
  Magnitude: $abs(G(j omega)) = K/sqrt(1 + (omega tau)^2)$
  Phase: $angle(G(j omega)) = -tan^(-1)(omega tau)$
]

=== Supplementary Problems
#supplementary[Second-Order System][
  Construct the Bode plot for $G(s) = 25/(s^2 + 4s + 25)$. Identify the natural frequency and damping ratio.
]

#supplementary[Phase Margin][
  For $G(s) = 100/(s+1)(s+10)$, find the frequency where the phase is $-180°$ and calculate the gain margin.
]

== Logarithmic Magnitude Plots

=== Mathematical Review

*Logarithmic magnitude plots* (also called Nichols charts) plot the logarithmic magnitude in decibels versus the phase angle, providing a compact representation of frequency response data.

#definition[Nichols Chart][
  A Nichols chart is a plot of $20 log_(10) abs(G(j omega))$ (in dB) versus $angle(G(j omega))$ (degrees) with frequency $omega$ as a parameter.
]

#definition[Log-Magnitude Coordinates][
  The log-magnitude is expressed in decibels:
  $ M = 20 log_(10) abs(G(j omega)) $ (in dB)
  The phase angle is measured in degrees:
  $ phi = angle(G(j omega)) = tan^(-1)(text(Im)[G(j omega)]/text(Re)[G(j omega)]) $
]



=== Frequency Response Data

#theorem[Experimental Data Representation][
  Experimental frequency response data can be plotted on a Nichols chart to:
  1. Identify system parameters
  2. Assess stability margins
  3. Compare with theoretical models
  4. Validate system identification results
]

#definition[M-Contours][
  M-contours are curves of constant closed-loop magnitude $abs(T(j omega))$ on the Nichols chart, useful for assessing closed-loop performance from open-loop data.
]

=== Solved Problems

#solved_problem[Nichols Chart Construction][
  Construct the Nichols chart data for $G(s) = 10/(s+1)(s+5)$ at frequencies $omega = [0.1, 1, 10]$ rad/s.
]
#solution[
  Calculate $G(j omega)$ at each frequency:

  $omega = 0.1$:
  $G(j 0.1) = 10/((j 0.1 + 1)(j 0.1 + 5)) = 10/((1 - 0.01) + j(0.6))$
  $abs(G(j 0.1)) approx 10/sqrt(0.99^2 + 0.6^2) approx 8.5 = 18.6$ dB
  $angle approx -tan^(-1)(0.6/0.99) approx -31°$

  $omega = 1$:
  $G(j 1) = 10/((j 1 + 1)(j 1 + 5)) = 10/((1 - 5) + j(6))$
  $abs(G(j 1)) = 10/sqrt(16 + 36) = 10/sqrt(52) = 1.39 = 2.9$ dB
  $angle = -tan^(-1)(6/-4) = -123°$

  $omega = 10$:
  $G(j 10) = 10/((j 10 + 1)(j 10 + 5)) = 10/((-99) + j(60))$
  $abs(G(j 10)) = 10/sqrt(9801 + 3600) = 0.089 = -21$ dB
  $angle = -tan^(-1)(60/-99) = -149°$
]

#solved_problem[Performance Specification][
  From Nichols chart data, determine if a system meets the specification of gain margin $> 6$ dB and phase margin $> 30°$.
]
#solution[
  The gain margin is the negative of the magnitude at the phase crossover frequency (where phase = $-180°$).
  The phase margin is $180°$ plus the phase at the gain crossover frequency (where magnitude = 0 dB).

  From the Nichols chart:
  - At phase = $-180°$, magnitude = $-8$ dB → Gain margin = $8$ dB ✓
  - At magnitude = 0 dB, phase = $-145°$ → Phase margin = $180° - 145° = 35°$ ✓

  Both specifications are satisfied.
]




#solved_problem[First-Order System][
  Analyze the first-order system.
]
#solution[
  For $G(s) = 1/(tau s + 1)$:
  At $omega = 1/tau$: $abs(G(j omega)) = 1/sqrt(2) = -3$ dB, $angle = -45°$
  This point appears at $(-3, -45°)$ on the Nichols chart.
]

=== Supplementary Problems
#supplementary[System Identification][
  Given Nichols chart data points: (0 dB, $-90°$), (-3 dB, $-135°$), (-20 dB, $-170°$), identify the system type and approximate transfer function.
]

#supplementary[M-Contour Analysis][
  For a system with Nichols plot passing through point (2 dB, $-60°$), determine the closed-loop resonant peak if the M-contour at that point represents $M_r = 1.4$.
]

== Polar Plots

=== Mathematical Review

*Polar plots* (also called Nyquist plots) provide a graphical representation of the frequency response $G(j omega)$ in the complex plane, with frequency as a parameter.

#definition[Polar Plot][
  A polar plot is a parametric plot of $G(j omega)$ in the complex plane as $omega$ varies from $0$ to $infinity$:
  $ G(j omega) = text(Re)[G(j omega)] + j text(Im)[G(j omega)] $
  where the horizontal axis represents the real part and the vertical axis represents the imaginary part.
]



=== Construction Techniques

#theorem[Polar Plot Characteristics][
  Key features for polar plot construction:
  1. Starting point ($omega = 0$): $G(j 0)$
  2. Ending point ($omega -> infinity$): $lim_(omega -> infinity) G(j omega)$
  3. Intersection with imaginary axis: $text(Re)[G(j omega)] = 0$
  4. Intersection with real axis: $text(Im)[G(j omega)] = 0$
]

#theorem[Type Number Effects][
  The system type affects the low-frequency behavior:
  - Type 0: Starts at finite point on real axis
  - Type 1: Starts at infinity along negative imaginary axis
  - Type 2: Starts at infinity along negative real axis
]

=== Solved Problems

#solved_problem[Polar Plot Construction][
  Construct the polar plot for $G(s) = 10/(s+1)(s+2)$.
]
#solution[
  First, find $G(j omega)$:
  $ G(j omega) = 10/((j omega + 1)(j omega + 2)) = 10/((1 - omega^2) + j(3 omega)) $
  
  Multiply numerator and denominator by the complex conjugate:
  $ G(j omega) = 10((1 - omega^2) - j(3 omega))/((1 - omega^2)^2 + 9 omega^2) $
  
  Key points:
  - $omega = 0$: $G(j 0) = 10/2 = 5$ (on real axis)
  - $omega -> infinity$: $G(j omega) -> 0$ (origin)
  - Imaginary axis intersection: Set real part to zero
    $1 - omega^2 = 0 => omega = 1$ rad/s
    At $omega = 1$: $G(j 1) = -j(10 × 3)/(9 + 0) = -j(10/3)$
]

#solved_problem[Nyquist Plot for Type 1 System][
  Sketch the Nyquist plot for $G(s) = K/(s(s+1)(s+2))$.
]
#solution[
  This is a Type 1 system with three poles.
  
  Key characteristics:
  - $omega -> 0^+$: $G(j omega) approx K/(j omega × 1 × 2) = K/(j 2 omega) -> -j infinity$
  - $omega -> infinity$: $G(j omega) -> 0$ (origin)
  - The plot starts at $-j infinity$ and approaches the origin
  - For $K > 0$, the plot remains in the third and fourth quadrants
  - The curve is convex and approaches the origin at an angle of $-270°$
]




#solved_problem[First-Order System][
  Analyze the first-order system.
]
#solution[
  For $G(s) = 1/(tau s + 1)$:
  $ G(j omega) = 1/(j omega tau + 1) = (1 - j omega tau)/(1 + (omega tau)^2) $
  Real part: $text(Re)[G(j omega)] = 1/(1 + (omega tau)^2)$
  Imaginary part: $text(Im)[G(j omega)] = -omega tau/(1 + (omega tau)^2)$
]

=== Supplementary Problems
#supplementary[Second-Order System][
  Construct the polar plot for $G(s) = omega_n^2/(s^2 + 2 zeta omega_n s + omega_n^2)$ with $zeta = 0.5$ and $omega_n = 2$.
]

#supplementary[Stability Assessment][
  For $G(s) = 5/(s-1)(s+2)$, determine if the polar plot encircles the $-1 + j 0$ point.
]

== Nyquist Stability Criterion

=== Mathematical Review

The *Nyquist stability criterion* provides a powerful graphical method for determining the stability of closed-loop systems from the open-loop frequency response.

#definition[Nyquist Contour][
  The Nyquist contour is a closed path in the s-plane that encloses the entire right half-plane. It consists of:
  1. Imaginary axis from $-j infinity$ to $+j infinity$
  2. Semicircle of infinite radius in the right half-plane
]

#theorem[Argument Principle][
  For a transfer function $F(s)$ with $P$ poles and $Z$ zeros inside a contour:
  $ N = Z - P $
  where $N$ is the net number of clockwise encirclements of the origin by $F(s)$ as $s$ traverses the contour.
]

#definition[Nyquist Stability Criterion][
  For a closed-loop system with characteristic equation $1 + G(s)H(s) = 0$:
  $ Z = N + P $
  where:
  - $Z$ = number of unstable closed-loop poles
  - $N$ = net clockwise encirclements of $-1 + j 0$ point by Nyquist plot of $G(s)H(s)$
  - $P$ = number of unstable open-loop poles of $G(s)H(s)$
]

=== Special Cases

#theorem[Poles on Imaginary Axis][
  When open-loop poles lie on the imaginary axis, the Nyquist contour must be modified:
  1. Use small semicircular detours around each pole
  2. These detours produce $±180°$ arcs in the Nyquist plot
  3. The direction depends on whether the contour goes above or below the pole
]



=== Solved Problems

#solved_problem[Nyquist Stability Analysis][
  Apply the Nyquist criterion to $G(s) = K/(s(s+1)(s+2))$.
]
#solution[
  Step 1: Determine $P$ (unstable open-loop poles)
  Open-loop poles: $s = 0, -1, -2$ → $P = 1$ (pole at origin is on imaginary axis)
  
  Step 2: Sketch Nyquist plot for different $K$ values
  - $omega -> 0^+$: $G(j omega) -> -j infinity$
  - $omega -> infinity$: $G(j omega) -> 0$
  - Real axis intersection: Find $omega$ where imaginary part = 0
  
  Step 3: Count encirclements
  For stability: $Z = N + P = 0$ → $N = -1$ (one counterclockwise encirclement)
  
  Step 4: Determine stability range
  The plot will encircle $-1 + j 0$ once counterclockwise if $0 < K < 6$.
  Therefore, the system is stable for $0 < K < 6$.
]

#solved_problem[Conditional Stability][
  Analyze the conditional stability of $G(s) = K(1+s)/(s^2(1+0.1s)(1+0.2s))$.
]
#solution[
  This is a conditionally stable system where stability depends on gain $K$.
  
  Open-loop poles: $s = 0$ (double pole), $s = -10$, $s = -5$ → $P = 2$
  
  Nyquist plot characteristics:
  - Starts at $-j infinity$ due to double pole at origin
  - Has complex shape due to zero at $s = -1$
  - Can encircle $-1 + j 0$ multiple times depending on $K$
  
  Stability conditions:
  - For low $K$: Unstable (insufficient encirclements)
  - For medium $K$: Stable (correct number of encirclements)
  - For high $K$: Unstable (excessive encirclements)
  
  The system is stable only in a specific range of $K$ values.
]




#solved_problem[Poles at Origin][
  Analyze the poles at origin.
]
#solution[
  For $G(s)H(s) = K/s(s+1)$, the pole at $s = 0$ requires a detour:
  - As $s$ circles the origin clockwise, $G(s)H(s)$ traces a $180°$ arc at infinity
  - This arc connects the positive and negative imaginary axes
]

=== Supplementary Problems
#supplementary[Pole at Origin][
  Apply Nyquist criterion to $G(s) = K/(s(s+3))$ and determine the range of $K$ for stability.
]

#supplementary[Non-Minimum Phase][
  Analyze stability of $G(s) = K(s-1)/(s+2)(s+3)$ using Nyquist criterion.
]

== Stability Analysis <stability_analysis>

=== Mathematical Review

*Stability margins* provide quantitative measures of how far a system is from instability. They are essential for robust control system design.

#definition[Gain Margin][
  The gain margin ($G_M$) is the factor by which the gain can be multiplied before the system reaches the stability limit:
  $ G_M = 1/abs(G(j omega_(p c))) $
  where $omega_(p c)$ is the *phase crossover frequency* where $angle(G(j omega_(p c))) = -180°$.
  In decibels: $G_M = -20 log_(10) abs(G(j omega_(p c)))$ (in dB)
]

#definition[Phase Margin][
  The phase margin ($P_M$) is the additional phase lag required to reach the stability limit:
  $ P_M = 180° + angle(G(j omega_(g c))) $
  where $omega_(g c)$ is the *gain crossover frequency* where $abs(G(j omega_(g c))) = 1$ (0 dB).
]



=== Relative Stability Measures

#theorem[Stability Margin Interpretation][
  - *$G_M > 1$* (or $> 0$ dB): System is stable
  - *$G_M < 1$* (or $< 0$ dB): System is unstable
  - *$P_M > 0°$*: System is stable
  - *$P_M < 0°$*: System is unstable
  - Larger margins indicate more robust stability
]

#definition[Delay Margin][
  The delay margin is the maximum additional time delay that can be added before instability:
  $ t_(d m) = P_M/(omega_(g c) × 180°/pi) $
]

=== Solved Problems

#solved_problem[Margin Calculation from Bode Plot][
  For $G(s) = 10/(s+1)(s+5)$, calculate gain and phase margins.
]
#solution[
  Step 1: Find phase crossover frequency (where phase = $-180°$)
  $angle(G(j omega)) = -tan^(-1)(omega) - tan^(-1)(omega/5) = -180°$

  At $omega = 2.24$ rad/s:
  $angle(G(j 2.24)) = -66° - 24° = -90°$ (not $-180°$)

  Actually, phase never reaches $-180°$ because it's a Type 0 system with two poles.
  Therefore: G_M = $infinity$

  Step 2: Find gain crossover frequency (where magnitude = 0 dB)
  $abs(G(j omega)) = 10/sqrt((1 + omega^2)(25 + omega^2)) = 1$
  Solving gives $omega_(g c) approx 1.4$ rad/s

  Step 3: Calculate phase margin
  $angle(G(j 1.4)) = -tan^(-1)(1.4) - tan^(-1)(1.4/5) = -54° - 16° = -70°$
  $P_M = 180° - 70° = 110°$

  Results: $G_M = infinity$, $P_M = 110°$ (very stable)
]

#solved_problem[Design for Specified Margins][
  Design a lead compensator to achieve $G_M$ ≥ 10 dB and $P_M$ ≥ 45° for plant $G_p(s) = 1/(s(s+1))$.
]
#solution[
  Step 1: Analyze uncompensated system
  Plant: $G_p(s) = 1/(s(s+1))$
  At $omega = 1$ rad/s: $|G_p| = -3$ dB, $angle = -135°$
  Current $P_M = 180° - 135° = 45°$ ✓
  G_M = $infinity$ ✓

  Actually, the uncompensated system already meets specifications.
  If we wanted better performance:

  Step 2: Lead compensator design
  $G_c(s) = K (1 + tau s)/(1 + alpha tau s)$ where $alpha < 1$

  Choose $alpha = 0.1$, place zero at $omega = 1$
  $tau = 1$, so $G_c(s) = K (1 + s)/(1 + 0.1s)$

  Step 3: Adjust gain $K$
  Set $K = 1$ to maintain 0 dB at low frequencies.

  Final design: $G_c(s) = (1 + s)/(1 + 0.1s)$
  This improves $P_M$ to approximately $55°$ while maintaining $G_M > infinity$.
]




#solved_problem[First-Order System][
  Analyze the first-order system.
]
#solution[
  For $G(s) = K/(tau s + 1)$:
  Phase never reaches $-180°$, so G_M = $infinity$.
  At gain crossover: $abs(G(j omega)) = 1 => omega_(g c) = sqrt(K^2 - 1)/tau$
  $P_M = 180° - tan^(-1)(omega_(g c) tau)$
]

=== Supplementary Problems
#supplementary[Delay Margin][
  For $G(s) = 5e^(-0.2s)/(s+1)(s+2)$, calculate the delay margin if the phase margin is $30°$ at $omega = 2$ rad/s.
]

#supplementary[Stability Assessment][
  A system has $G_M = 6$ dB and $P_M = 20°$. Is this system stable? Comment on the relative stability and potential issues.
]

== Closed-Loop Frequency Response

=== Mathematical Review

*Closed-loop frequency response* analysis relates the open-loop characteristics to the closed-loop performance, providing insights into system behavior in the frequency domain.

#definition[Closed-Loop Transfer Function][
  For a unity feedback system, the closed-loop transfer function is:
  $ T(s) = Y(s)/R(s) = G(s)/(1 + G(s)) $
  For general feedback: $T(s) = G(s)/(1 + G(s)H(s))$
]

#definition[Frequency Response Functions][
  The closed-loop frequency response is:
  $ T(j omega) = G(j omega)/(1 + G(j omega)H(j omega)) $
  This can be expressed in terms of magnitude and phase:
  $ T(j omega) = abs(T(j omega)) e^(j angle(T(j omega))) $
]

#definition[Sensitivity Functions][
  *Sensitivity function*: $S(s) = 1/(1 + G(s)H(s))$
  *Complementary sensitivity*: $T(s) = G(s)/(1 + G(s)H(s))$
  These satisfy: $S(s) + T(s) = 1$
]

=== Performance Specifications

#theorem[Bandwidth][
  The bandwidth $omega_B$ is the frequency where:
  $ abs(T(j omega_B)) = 1/sqrt(2) abs(T(j 0)) $
  For unity feedback with $T(j 0) = 1$: $abs(T(j omega_B)) = 0.707 = -3$ dB
  Bandwidth indicates the frequency range where the system tracks inputs effectively.
]

#definition[Resonant Peak][
  The resonant peak $M_p$ is the maximum value of $abs(T(j omega))$:
  $ M_p = max_omega abs(T(j omega)) $
  The resonant frequency $omega_r$ is where this maximum occurs.
  For second-order systems: $M_p = 1/(2 zeta sqrt(1 - zeta^2))$ for $zeta < 1/sqrt(2)$
]

=== Solved Problems

#solved_problem[Closed-Loop Response Calculation][
  Calculate the closed-loop frequency response for $G(s) = 10/(s+1)(s+5)$ with unity feedback.
]
#solution[
  Step 1: Form closed-loop transfer function
  $ T(s) = G(s)/(1 + G(s)) = 10/((s+1)(s+5) + 10) = 10/(s^2 + 6s + 15) $

  Step 2: Evaluate at $s = j omega$
  $ T(j omega) = 10/((-omega^2 + 15) + j 6 omega) $

  Step 3: Calculate magnitude and phase
  $ abs(T(j omega)) = 10/sqrt((-omega^2 + 15)^2 + (6 omega)^2) $
  $ angle(T(j omega)) = -tan^(-1)(6 omega/(-omega^2 + 15)) $

  Step 4: Key performance metrics
  DC gain: $abs(T(j 0)) = 10/15 = 0.667 = -3.5$ dB
  Bandwidth: Solve for $abs(T(j omega_B)) = 0.667/sqrt(2) = 0.471$
  $ omega_B approx 2.1$ rad/s
  No resonant peak (system is overdamped)
]

#solved_problem[Sensitivity Analysis][
  For $G(s) = K/(s+1)^2$ with unity feedback, analyze sensitivity to parameter variations.
]
#solution[
  Step 1: Closed-loop transfer function
  $ T(s) = K/((s+1)^2 + K) $

  Step 2: Sensitivity function
  $ S(s) = 1/(1 + G(s)) = (s+1)^2/((s+1)^2 + K) $

  Step 3: Frequency response
  $ S(j omega) = (-omega^2 + 2j omega + 1)/((-omega^2 + 1) + K + j 2 omega) $

  Step 4: Sensitivity characteristics
  At low frequencies ($omega -> 0$): $abs(S(j 0)) = 1/(1 + K)$
  At high frequencies ($omega -> infinity$): $abs(S(j omega)) -> 1$

  Step 5: Interpretation
  - Low sensitivity at DC for large $K$
  - High sensitivity at high frequencies (inevitable)
  - Bandwidth of sensitivity decreases with increasing $K$
]

=== Supplementary Problems

#supplementary[Bandwidth Design][
  Design a controller for $G(s) = 1/(s+1)(s+4)$ to achieve a closed-loop bandwidth of at least 5 rad/s.
]

#supplementary[Performance Trade-offs][
  Explain the relationship between resonant peak, damping ratio, and settling time for a second-order closed-loop system.
]

== Biological Rhythms and Oscillations in Physiology

=== Mathematical Review

Biological systems exhibit intrinsic oscillatory behavior that can be characterised using frequency-domain tools identical to those in classical control engineering.

#definition[Circadian and Ultradian Rhythms][
  Biological oscillations classified by period $T$:
  - *Ultradian* ($T < 24$ hr): Insulin pulsatile secretion ($T approx 5$–$15$ min), cardiac cycle.
  - *Circadian* ($T approx 24$ hr): Cortisol, melatonin, fasting glucose levels.
  - *Infradian* ($T > 24$ hr): Monthly hormonal cycles.

  Each corresponds to a dominant frequency $omega_0 = 2pi/T$ that can be identified from a *power spectral density (PSD)* plot of the signal $G(t)$ or $I(t)$.
]

#definition[Biological Transfer Function — Pulsatile Secretion][
  Pulsatile insulin secretion can be modelled as a periodic forcing function applied to the glucose-insulin loop. If the glucose-insulin system has transfer function $H(j omega)$, then the steady-state insulin amplitude at stimulation frequency $omega$ is:
  $ |I(j omega)| = |H(j omega)| dot |U(j omega)| $
  Resonance occurs when $omega approx omega_n$ (the natural frequency of the closed-loop system), potentially amplifying oscillations and disrupting homeostasis.
]

#theorem[Nyquist Criterion Applied to Glucose Regulation][
  The closed-loop glucose-insulin system is stable if and only if the open-loop transfer function $G_"ol"(j omega)$ does not encircle $(-1, 0)$ in the Nyquist diagram. Encirclement indicates that feedback has turned destabilising — corresponding clinically to pathological oscillations (hypoglycaemic episodes) or divergence to chronic hyperglycaemia.
]

=== Solved Problems

#solved_problem[Period of Insulin Micro-Pulses][
  Insulin is secreted in pulses with frequency $f = 0.1$ Hz. Calculate the angular frequency $omega$ and explain what it means if the glucose-insulin closed-loop has a resonant frequency at $omega_n = 0.1$ rad/min.
]
#solution[
  $ omega = 2 pi f = 2 pi times 0.1 approx 0.628 "rad/s" $
  Converting: $omega = 0.628 times 60 approx 37.7$ rad/min. The resonant frequency $omega_n = 0.1$ rad/min is far below the stimulation frequency, so the system filters the high-frequency pulses effectively. No dangerous resonance occurs.
]

=== Supplementary Problems

#supplementary[Circadian Glucose Peak][
  The dawn phenomenon raises fasting glucose levels at approximately 6:00 AM due to cortisol and growth hormone surges. If modelled as a sinusoidal disturbance with $T = 24$ hr, compute its frequency in rad/hr and sketch where it falls on a Bode plot relative to the glucose-insulin crossover frequency $omega_c approx 1$ rad/hr.
]

