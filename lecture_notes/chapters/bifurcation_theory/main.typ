#import "../../../utils.typ": *
= Bifurcation Theory

This chapter introduces parametric bifurcations — saddle-node, Hopf — explaining mathematically how the destruction of the physiological stable point constitutes the "Pathway to Diabetes."

== Hopf Bifurcation in Biological Oscillators

=== Mathematical Review

#definition[Hopf Bifurcation][
  A Hopf (or Poincaré-Andronov-Hopf) bifurcation occurs when a local equilibrium point loses or gains stability as a pair of complex conjugate eigenvalues of the linearization cross the imaginary axis. At the bifurcation point, a periodic orbit (limit cycle) is born or destroyed.
]

#definition[Biological Significance of Limit Cycles][
  Unlike mechanical pendulums where continuous oscillation depends exclusively on perfect initial conditions and zero friction (a structural center), biological oscillations are driven by *limit cycles*. Limit cycles are robust isolated periodic orbits: if biological noise pushes the system off the cycle, the trajectories spiral back onto it. This mathematical structure is responsible for heartbeats, circadian rhythms, and insulin pulses (as discussed in Chapter 3).
]

#theorem[Supercritical vs. Subcritical Hopf][
  - *Supercritical Hopf:* A stable equilibrium becomes unstable, and a *stable* limit cycle is born enclosing the equilibrium. This represents a smooth, reversible onset of biological oscillation.
  - *Subcritical Hopf:* A stable equilibrium becomes unstable, and an *unstable* limit cycle shrinks and vanishes. This often represents a catastrophic "hard" transition to a completely different physiological state (e.g., cardiac arrhythmia).
]

=== Solved Problems

#solved_problem[Glycolytic Oscillator][
  A simplified Sel'kov model for oscillations in glycolysis (the breakdown of sugar) is:
  $ x' = -x + a y + x^2 y \ y' = b - a y - x^2 y $
  where $x$ and $y$ are dimensionless concentrations of ADP and F6P, and $a,b > 0$.
  Show that the unique equilibrium can undergo a Hopf bifurcation as $b$ varies.
]
#solution[
  *1. Find the equilibrium:*
  Set $y' = 0$: $b = (a + x^2) y => y = b / (a + x^2)$.
  Substitute into $x'=0$:
  $ -x + a (b / (a + x^2)) + x^2 (b / (a + x^2)) = 0 $
  $ -x + (a+x^2) / (a+x^2) b = 0 => x = b. $
  Thus, $y = b / (a + b^2)$. The unique equilibrium is $(x^*, y^*) = (b, b / (a + b^2))$.

  *2. Evaluate the Jacobian at the equilibrium:*
  $ J(x,y) = mat(-1 + 2 x y, a + x^2; -2 x y, - (a + x^2)). $
  At $(x^*, y^*)$, note that $x^* y^* = b^2 / (a + b^2)$. Let $D = a + b^2$.
  $ J = mat(-1 + 2 b^2/D, D; -2 b^2/D, -D). $
  
  *3. Determine the Hopf condition:*
  The determinant is $Delta = D - 2b^2 + 2b^2 = D = a + b^2 > 0$.
  The trace is $tau = -1 + 2b^2 / (a+b^2) - (a+b^2) = (b^2 - a - (a+b^2)^2) / (a+b^2)$.
  A Hopf bifurcation occurs when the trace crosses exactly zero ($tau = 0$ while $Delta > 0$).
  Setting $tau = 0$ yields the critical condition $b^2 - a = (a+b^2)^2$. For appropriate values of $a$ and $b$ (e.g., $a=0.1, b=0.6$), $tau$ crosses from negative to positive. Because the eigenvalues correspond to $tau plus.minus i sqrt(4 Delta - tau^2)/2$, crossing $tau=0$ vertically crosses the imaginary axis, producing a limit cycle representing sustained glycolytic oscillations.
]

=== Supplementary Problems

#supplementary[Circadian Rhythm Feedback Loop][
  The Goodwin limit-cycle model describes circadian rhythms via genetic negative feedback (mRNA -> Protein -> Inhibitor). Using the concept of a supercritical Hopf bifurcation, explain how an increase in the cooperativity parameter (the Hill coefficient $n$) inside the genetic loop can suddenly cause cells to transition from a steady rest state into sustained 24-hour molecular oscillations.
]

== Pathways to Diabetes: A Bifurcation Perspective

=== Mathematical Review

#definition[Saddle-Node Bifurcation][
  As a bifurcation parameter $mu$ (e.g., insulin resistance $R$) increases, the two equilibria $P_1$ (stable healthy node) and $P_2$ (unstable saddle) approach each other. At the critical value $mu = mu_c$ they *collide and annihilate*, leaving only $P_3$ (diabetic). This is a saddle-node bifurcation.
]

#definition[Parametric Sensitivity and "Point of No Return"][
  Before $mu_c$, the system is multistable: trajectories starting near $P_1$ remain healthy, while those past the separatrix converge to $P_3$. At $mu > mu_c$, there is no $P_1$ at all — the patient is mathematically locked into the diabetic basin.
]

=== Solved Problems

#solved_problem[Bifurcation Diagram Interpretation][
  In a glucose-insulin model, the healthy equilibrium $G_1^*(R)$ depends on insulin resistance $R$. As $R$ increases, $G_1^*$ rises. At a critical $R_c$, $G_1^*$ and an unstable $G_2^*(R)$ meet and merge. Describe the bifurcation diagram.
]
#solution[
  Plot $G^*$ on the vertical axis versus $R$ on the horizontal axis. The stable $P_1$ branch rises gently. The unstable $P_2$ branch descends. At $R = R_c$ they merge at a "fold point" — the saddle-node bifurcation. For $R > R_c$ only the diabetic $P_3$ branch persists.
]

=== Supplementary Problems

#supplementary[Hysteresis and Irreversibility][
  Explain why a patient who crosses $R = R_c$ cannot simply reverse the disease by reducing insulin resistance back slightly below $R_c$. How does the concept of hysteresis in bifurcation diagrams explain the clinical difficulty of reversing Type 2 Diabetes?
]

