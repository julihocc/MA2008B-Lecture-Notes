#import "../../../utils.typ": *

= Assignment 4: Root Locus Analysis & Design via Computational Tools
*Total Points:* 100

== Objective
Apply computational software (e.g., MATLAB, Python Control Systems Library, or Julia `ControlSystems.jl`) to analyze, verify, and design for a dynamic system using Time-Domain Solutions and Root Locus techniques based on Chapter 4.

== System Description
Consider a position control system with unity negative feedback. The open-loop plant transfer function is given by:

$ P(s) = 1 / (s(s+2)(s+8)) $

A proportional gain controller $C(s) = K$ is placed in the forward path, making the open-loop transfer function $L(s) = K P(s)$.

== Detailed Instructions & Deliverables

*General Guidelines:*
- Submit your final work as a combined PDF report.
- Include all source code (scripts, functions, or Jupyter/Live Script snippets) in an appendix or inline within your report.
- All plots must have clearly labeled axes, titles, and legends where appropriate.

---

=== Part 1: Open-Loop Analysis & Analytical Root Locus (20 Points)
Before simulating, perform a theoretical analysis of the basic uncompensated system.
1. *[5 pts]* Identify the open-loop poles and zeros. Determine the number of root locus branches ($n$), the number of branches that go to infinity, and the number terminating at finite zeros ($m$).
2. *[5 pts]* Analytically calculate the centroid ($sigma_a$) and the angles of the asymptotes ($theta_k$).
3. *[5 pts]* Determine the segments of the real axis that belong to the root locus.
4. *[5 pts]* Calculate the breakaway point(s) by differentiating the characteristic equation ($(d K)/(d s) = 0$) and finding the admissible real roots.

=== Part 2: Computational Root Locus Generation (20 Points)
Use your chosen software to generate and verify your theoretical findings.
1. *[10 pts]* Produce a high-quality root locus plot of the uncompensated system ($L(s) = K P(s)$). Set the plot axes to clearly show the breakaway points, asymptotes, and imaginary axis crossings.
2. *[10 pts]* Use software (e.g., `rlocfind` in MATLAB, or equivalent routines) to find the exact gain $K$ at which the system locus crosses the imaginary axis (marginal stability). Provide the crossing frequency $omega_c$ and the critical gain $K_c$. Match this result with a brief Routh-Hurwitz analytical setup.

=== Part 3: Transient Response & Proportional Design (25 Points)
We want the system to exhibit a damping ratio of exactly $zeta = 0.5$.
1. *[10 pts]* Using your software's root locus tool, find the proportional gain $K$ that places the dominant closed-loop poles at the $zeta = 0.5$ damping line. Record this specific gain value $K_"prop"$ and the location of all three closed-loop poles.
2. *[5 pts]* Using equation approximations from Chapter 4, what is the expected 2% settling time ($t_s$) and percentage overshoot ($M_p$) for this dominant pole pair?
3. *[10 pts]* Simulate and plot the closed-loop unit step response of the system using your found $K_"prop"$. Graphically measure the *actual* settling time and overshoot from the plot. Briefly discuss whether the dominant-pole approximation was accurate given the location of the third non-dominant pole.

=== Part 4: Lead Compensator Design (35 Points)
The proportional controller's settling time from Part 3 is too slow. Design a lead compensator $C_"lead"(s) = K_c (s+z) / (s+p)$ (with $p > z > 0$) to pull the root locus further into the left half-plane.
*Target Dominant Poles:* $s_d = -2 plus.minus j 2 sqrt(3)$ (which correspond to $zeta = 0.5$ and $omega_n = 4$).

1. *[10 pts]* *Analytical Defect Angle:* Calculate the angle deficiency at the target pole $s_d$ contributed by the original plant poles. Determine the phase angle the compensator must provide to satisfy the angle condition ($180 degree$).
2. *[10 pts]* *Zero/Pole Placement:* Choose a compensator zero at $z = 2$ (to cancel the plant pole at $s=-2$). Using the required phase angle calculated above, analytically determine the necessary location for the compensator pole $p$.
3. *[5 pts]* *Magnitude Condition:* With your designed compensator zero and pole, use the magnitude condition to calculate the required gain $K_c$ at $s_d$.
4. *[10 pts]* *Software Verification & Comparison:* 
  - Plot the root locus of the new compensated open-loop system $L_"comp"(s) = C_"lead"(s) P(s)$.
  - Simulate the closed-loop unit step response of this *compensated* system alongside the *proportional* system from Part 3 on the same plot.
  - Write a short concluding paragraph comparing the overshoot and settling time improvements.
