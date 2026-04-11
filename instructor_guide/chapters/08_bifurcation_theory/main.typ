#import "../../../utils.typ": *

= Bifurcation Theory

== Hopf Bifurcation in Biological Oscillators

=== Supplementary Problems

#supplementary[Circadian Rhythm Feedback Loop][
  The Goodwin limit-cycle model describes circadian rhythms via genetic negative feedback (mRNA -> Protein -> Inhibitor). Using the concept of a supercritical Hopf bifurcation, explain how an increase in the cooperativity parameter (the Hill coefficient $n$) inside the genetic loop can suddenly cause cells to transition from a steady rest state into sustained 24-hour molecular oscillations.
]
#solution[
  *1. Nonlinear Gain and Sensitivity:*
  The Hill coefficient $n$ determines the "steepness" of the inhibition curve. As $n$ increases, the feedback function becomes more sensitive to changes in the inhibitor concentration. This increases the "gain" of the negative feedback loop.

  *2. Destabilization of the Steady State:*
  In the Jacobian of the 3D Goodwin system, the negative feedback term is a product involving $n$. For low $n$, the system is damped and trajectories spiral into a stable steady state. As $n$ increases beyond a critical threshold, the sensitivity becomes so high that the negative feedback "overreacts," causing the trace of the Jacobian to cross zero.

  *3. The Hopf Transition:*
  At this critical point, a supercritical Hopf bifurcation occurs. The previously stable steady state becomes unstable, and a stable limit cycle is born. Clinically, this transition corresponds to the onset of a robust circadian clock: the cell transitions from constant protein expression to a precise 24-hour rhythmic cycle.
]

#supplementary[Trace-Determinant Hopf Detection][
  Consider a planar parameterized system with Jacobian at equilibrium $J(mu) = mat(a(mu), b(mu); c(mu), d(mu))$.
  1. Write $tau(mu) = text("tr")(J(mu))$ and $Delta(mu) = det(J(mu))$.
  2. State the algebraic Hopf conditions in terms of $tau(mu)$ and $Delta(mu)$.
  3. Explain why the transversality condition $d tau / d mu != 0$ at $mu = mu_c$ is required.
  4. Classify whether the equilibrium is locally stable or unstable for $tau < 0$ and $tau > 0$, assuming $Delta > 0$.
]
#solution[
  *1. Definitions:*
  $tau(mu) = a(mu) + d(mu)$ and $Delta(mu) = a(mu) d(mu) - b(mu) c(mu)$.

  *2. Hopf Conditions:*
  The system undergoes a Hopf bifurcation at $mu = mu_c$ if:
  - $tau(mu_c) = 0$ (The real part of the eigenvalues is zero).
  - $Delta(mu_c) > 0$ (The eigenvalues are purely imaginary, $lambda = plus.minus i sqrt(Delta)$).

  *3. Transversality:*
  The condition $d tau / d mu != 0$ ensures that the eigenvalues cross the imaginary axis with non-zero speed. If the derivative were zero, the equilibrium might remain stable or semistable without creating a limit cycle.

  *4. Stability:*
  Assuming $Delta > 0$:
  - If $tau < 0$, the equilibrium is a *stable* focus or node.
  - If $tau > 0$, the equilibrium is an *unstable* focus or node.
  The bifurcation marks the exact moment the equilibrium loses stability ($tau$ switches sign).
]

#supplementary[Nullcline Geometry and Oscillation Onset][
  For a generic activator-inhibitor model $x' = f(x,y; mu), quad y' = g(x,y; mu)$, assume the $x$-nullcline is cubic-like and the $y$-nullcline is approximately linear.
  1. Sketch qualitatively how the nullcline intersection changes as $mu$ increases.
  2. Describe how a change in local slope can move eigenvalues from the left half-plane to the right half-plane.
  3. Explain how this geometric transition is related to Hopf bifurcation and emergence of a limit cycle.
]
#solution[
  *1. Nullcline Geometry:*
  The $x$-nullcline (activator) has a characteristic "N-shape" or cubic curve with three branches. The $y$-nullcline (inhibitor) is typically a straight line. As $mu$ varies, the linear nullcline may shift or tilt, moving the intersection point (the equilibrium).

  *2. Slope and Stability:*
  Stability is determined by $tau = f_x + g_y$. For a typical inhibitor, $g_y < 0$. If the intersection occurs on the outer branches of the cubic nullcline, the slope $f_x$ is strongly negative, so $tau < 0$ (stable). If the intersection moves onto the *middle branch* (the "unstable" part of the cubic), $f_x$ becomes positive and can overcome $g_y$, making $tau > 0$ (unstable).

  *3. Hopf Link:*
  The moment the linear nullcline intersects the cubic nullcline at a point where the local cubic slope $f_x$ exactly cancels $g_y$ ($f_x + g_y = 0$), a Hopf bifurcation occurs. This is the geometric condition for the birth of a limit cycle.
]

#supplementary[Biological Interpretation of Supercritical vs Subcritical Hopf][
  Compare two physiological scenarios represented by:
  1. A supercritical Hopf bifurcation that creates a small stable oscillation.
  2. A subcritical Hopf bifurcation with an unstable cycle and abrupt transition.
  For each case, explain expected behavior under small perturbations, reversibility under parameter rollback, and clinical implications for robustness of oscillatory function.
]
#solution[
  *1. Supercritical (Soft Onset):*
  - *Small Perturbations:* The system returns efficiently to the stable limit cycle; the oscillation is "robust."
  - *Reversibility:* Rolling back the parameter $mu$ below $mu_c$ makes the oscillation shrink smoothly to zero and disappear; the process is fully reversible.
  - *Clinical:* Represents healthy developmental transitions (e.g., onset of reproductive cycles).

  *2. Subcritical (Hard Onset):*
  - *Small Perturbations:* A perturbation can push the state outside an unstable cycle, causing it to jump to a distant (often pathological) attractor.
  - *Reversibility:* Not easily reversible. Even if $mu$ is rolled back slightly, the system may stay in the new state due to hysteresis.
  - *Clinical:* Represents sudden-onset diseases or pathological switches (e.g., heart arrhythmias or epileptic seizures).
]

#supplementary[Normal Form Computation Near Hopf][
  Study the complex normal form $z' = (alpha + i omega) z + c z |z|^2$, where $alpha in RR$, $omega > 0$, and $c in CC$.
  1. Convert to polar form $(r, theta)$ and derive the scalar amplitude equation for $r$.
  2. Determine the radius and stability of periodic orbits as a function of $alpha$ and $text("Re")(c)$.
  3. Use the sign of $text("Re")(c)$ to distinguish supercritical and subcritical Hopf bifurcations.
]
#solution[
  *1. Polar Conversion:*
  Substitute $z = r e^(i theta)$ into the normal form. Using $z' = r' e^(i theta) + i r theta' e^(i theta)$:
  $ r' + i r theta' = (alpha + i omega) r + (Re(c) + i Im(c)) r^3. $
  Separating real and imaginary parts:
  - *Amplitude:* $r' = alpha r + Re(c) r^3$.
  - *Phase:* $theta' = omega + Im(c) r^2$.

  *2. Periodic Orbits:*
  Equilibria of $r'$ satisfy $r (alpha + Re(c) r^2) = 0$.
  Besides the origin ($r=0$), there exists a limit cycle with radius:
  $ r^* = sqrt(-alpha / Re(c)). $
  This exists only when $alpha$ and $Re(c)$ have opposite signs.

  *3. Classification:*
  - *Supercritical ($Re(c) < 0$):* For $alpha > 0$, the $r^3$ term is stabilizing. The origin is unstable, and the limit cycle at $r^*$ is stable.
  - *Subcritical ($Re(c) > 0$):* For $alpha < 0$, the $r^3$ term is destabilizing. The origin is stable, but an *unstable* limit cycle exists at $r^*$, acting as a threshold ("separatrix") for escape.
]

== Pathways to Diabetes: A Bifurcation Perspective

=== Supplementary Problems

#supplementary[Hysteresis and Irreversibility][
  Explain why a patient who crosses $R = R_c$ cannot simply reverse the disease by reducing insulin resistance back slightly below $R_c$. How does the concept of hysteresis in bifurcation diagrams explain the clinical difficulty of reversing Type 2 Diabetes?
]
#solution[
  *1. Branch Disappearance:*
  At the saddle-node bifurcation $R = R_c$, the stable "healthy" branch $P_1$ collides with $P_2$ and vanishes. For $R > R_c$, only the "pathological" branch $P_3$ exists.

  *2. Hysteresis:*
  If a patient moves past $R_c$, they fall from the healthy attractor into the diabetic attractor. If insulin resistance is kemudian reduced to $R = R_c - epsilon$, the healthy branch $P_1$ reappears, but the patient's state is still focused on $P_3$.

  *3. Irreversibility:*
  To "jump" back from $P_3$ to $P_1$, one would typically have to reduce $R$ far beyond $R_c$ to another bifurcation point where $P_3$ vanishes (not always possible) or provide a massive exogenous impulse to push the state across the separatrix. This explains why mere parameter normalization often fails to cure chronic T2D once the "point of no return" is crossed.
]

#supplementary[Fold Conditions in a Scalar Equilibrium Equation][
  Let equilibria be roots of $Phi(G, R) = 0$, where $R$ is an insulin-resistance parameter.
  1. Write the saddle-node conditions at a fold point $(G_c, R_c)$.
  2. Explain the geometric meaning of solving $Phi(G_c, R_c) = 0$ and $partial Phi / partial G (G_c, R_c) = 0$.
  3. State why these conditions imply collision of one stable and one unstable equilibrium branch.
]
#solution[
  *1. Fold Conditions:*
  A saddle-node bifurcation occurs when:
  $ ("i") Phi(G, R) = 0, quad ("ii") (partial Phi) / (partial G) = 0, quad ("iii") (partial^2 Phi) / (partial G^2) != 0, quad ("iv") (partial Phi) / (partial R) != 0. $

  *2. Geometric Meaning:*
  - $Phi = 0$ ensures a critical point exists.
  - $(partial Phi) / (partial G) = 0$ means the equilibrium becomes non-hyperbolic (zero eigenvalue). Geometrically, this is where the curve $G(R)$ becomes vertical in the bifurcation diagram.

  *3. Branch Collision:*
  At the fold, the scalar function $Phi(G)$ is tangent to the axis. Near the fold, a small change in $R$ switches the system from having two roots (one stable, one unstable) to having zero roots on that manifold. This represents the "collision and annihilation" of the healthy steady state.
]

#supplementary[Basin Boundary and Separatrix Shift][
  In a bistable glucose-insulin model with equilibria $P_1$ (healthy), $P_2$ (saddle), and $P_3$ (diabetic):
  1. Explain how the stable manifold of $P_2$ defines a separatrix.
  2. Describe how increasing $R$ moves this separatrix in phase space.
  3. Interpret how this movement changes the set of initial conditions that still recover to $P_1$.
]
#solution[
  *1. The Separatrix:*
  The saddle $P_2$ has a stable manifold (a curve in the $G-I$ plane) that trajectories never cross. This curve divides the phase space into two "basins of attraction": one leading to $P_1$ and one to $P_3$.

  *2. Parameter Shift:*
  As insulin resistance $R$ increases, the healthy state $P_1$ and the saddle $P_2$ move closer together. Consequently, the separatrix (the "barrier") shifts towards $P_1$.

  *3. Vulnerability:*
  This movement shrinks the "healthy basin." Physically, it means that even if a state is currently healthy, the threshold of glucose/insulin deviation that the system can handle is reduced. Eventually, as $P_1$ and $P_2$ merge at the bifurcation point, the healthy basin disappears entirely.
]

#supplementary[Early-Warning Indicators Near a Fold][
  Near a saddle-node bifurcation, trajectories often exhibit critical slowing down.
  1. Define critical slowing down in terms of local eigenvalues.
  2. Explain why recovery from perturbations becomes slower as $R -> R_c^-$. 
  3. Propose two measurable time-series indicators that could signal approach to the fold point in a physiological dataset.
]
#solution[
  *1. Critical Slowing Down:*
  Stability depends on the dominant eigenvalue $lambda$. At a fold point, $lambda$ approaches zero. Since the time constant of recovery is $T approx 1 / |lambda|$, $T$ goes to infinity as the system approaches the bifurcation.

  *2. Slower Recovery:*
  Because the eigenvalue is nearly zero, the "restoring force" that pulls the system back toward $P_1$ after a perturbation (like a meal) becomes extremely weak. The system takes much longer to return to baseline glucose levels.

  *3. Early-Warning Indicators:*
  - *Increased Variance:* As the restoring force weakens, random noise in the system causes larger fluctuations.
  - *Increased Autocorrelation:* Because the system recovers slowly, the state at time $t$ becomes highly correlated with the state at time $t-1$.
]

#supplementary[One-Parameter Continuation of Equilibria][
  Suppose $G^*(R)$ solves an implicit equation $Phi(G, R)=0$.
  1. Derive the continuation slope $d G^* / d R$ using implicit differentiation.
  2. Explain why continuation may fail at the fold point.
  3. Sketch a qualitative bifurcation diagram with stable and unstable branches, clearly marking the fold.
  4. Relate branch stability to the sign of the dominant eigenvalue of the Jacobian of the full system.
]
#solution[
  *1. Continuation Slope:*
  Differentiate $Phi(G(R), R) = 0$ with respect to $R$:
  $ (partial Phi) / (partial G) (d G^*) / (d R) + (partial Phi) / (partial R) = 0 => (d G^*) / (d R) = - ((partial Phi) / (partial R)) / ((partial Phi) / (partial G)). $

  *2. Failure at Fold:*
  At the saddle-node bifurcation (fold point), $(partial Phi) / (partial G) = 0$. The slope $d G^* / d R$ diverges to infinity, mathematically indicating that the branch is bending back or ending.

  *3. Bifurcation Diagram:*
  The diagram shows a "sideways U" or "hook" shape. The upper branch ($P_1$) is stable (solid line), and the lower branch ($P_2$) is unstable (dashed line), meeting at the fold point $(G_c, R_c)$.

  *4. Stability Relation:*
  On the stable branch, the dominant eigenvalue $lambda < 0$ (so $(partial Phi) / (partial G) < 0$ assuming standard sign conventions). At the fold, $lambda=0$. On the unstable branch, $lambda > 0$, confirming that stability is lost exactly at the fold.
]
