#import "../../../utils.typ": *

= Positivity and Invariant Sets

== Positivity and Positive Invariance of the First Orthant

=== Supplementary Problems

#supplementary[Strict vs. Non-Strict Invariance][
  Explain the clinical difference between the strict positive invariance of $G$ and $I$ (vector field points inward) versus the non-strict invariance of $beta$ (tangent boundary). What intervention is required biologically to cross the $beta = 0$ boundary?
]
#solution[
  *1. Strict Invariance ($G, I$):*
  For $G' = P_G - ...$ and $I' = beta f(G) - ...$, the vector field points strictly inward ($G'|_(G=0) > 0$ and $I'|_(I=0) > 0$) because of basal production and secretion terms. Clinically, this means the body always attempts to maintain non-zero levels of glucose and insulin; the physiology is designed to "bounce back" from near-zero states.

  *2. Non-Strict Invariance ($beta$):*
  For $beta' = beta(r(G) - d(G))$, we have $beta'|_(beta=0) = 0$. The boundary is tangent, making $beta = 0$ an equilibrium. Clinically, this means that once beta-cell mass is completely depleted (as in late-stage Type 1 Diabetes), the body has no natural mechanism to restart production.

  *3. Biological Intervention:*
  Crossing the $beta = 0$ boundary (regenerating mass from zero) requires exogenous intervention such as islet cell transplantation, stem cell therapy, or gene therapy to induce beta-cell proliferation/differentiation from other cell types.
]

#supplementary[Nagumo's Theorem and General Set Invariance][
  Let a closed set $K$ be defined by a smooth function $h: RR^n -> RR$ as $K = {x : h(x) <= 0}$.
  1. State the condition on the vector field $f(x)$ for $K$ to be positively invariant.
  2. Explain the geometric condition $nabla h(x) dot f(x) <= 0$ for $x$ on the boundary $h(x) = 0$.
  3. Apply this to a metabolic "safe zone" defined by $|G - G^*| <= delta$.
]
#solution[
  *1. Condition:*
  According to Nagumo's Theorem, $K$ is positively invariant if for every $x$ on the boundary of $K$, the vector field $f(x)$ points into or tangent to $K$.

  *2. Geometric Interpretation:*
  The gradient $nabla h(x)$ points in the direction of increasing $h$ (outward from $K$). The condition $nabla h(x) dot f(x) <= 0$ ensures that the velocity vector $f(x)$ does not have a component pointing outside the set $K$.

  *3. Safe Zone Application:*
  For $h(G) = (G - G^*)^2 - delta^2 <= 0$:
  Boundary is $G = G^* plus.minus delta$.
  At $G = G^* + delta$, we need $G' <= 0$.
  At $G = G^* - delta$, we need $G' >= 0$.
  This gives the specific control bounds required for a therapy to keep the patient within the "safe" glycemic range.
]

#supplementary[Positive Invariance of Polytopic Regions][
  Consider a clinical "Target Range" defined by a polytope $K = {x : A x <= b}$.
  1. Derive the condition on the system $x' = f(x)$ that ensures $K$ is positively invariant.
  2. Why are these regions useful for describing "Time in Range" (TIR) in diabetic patients?
]
#solution[
  *1. Polytopic Condition:*
  For each face $a_i^T x = b_i$:
  $ a_i^T f(x) <= 0 quad forall x : a_i^T x = b_i. $
  This ensures the flow never crosses any of the linear boundaries defining the target region.

  *2. Clinical Utility:*
  Clinical guidelines define TIR based on upper and lower glucose bounds (e.g., 70–180 mg/dL). A polytopic invariant set allows clinicians to mathematically certify that a specific combination of diet and medication will keep the state within these physiological limits indefinitely.
]

#supplementary[Metzler Matrix Condition for Linear Systems][
  A square matrix $M$ is *Metzler* if all its off-diagonal entries are non-negative ($M_(i j) >= 0$ for all $i != j$).
  1. Prove that for a linear system $x' = M x$, the first orthant $RR_+^n$ is positively invariant if and only if $M$ is Metzler.
  2. Identify which physiological interactions (e.g., activation vs. inhibition) contribute to the Metzler property.
]
#solution[
  *1. Proof:*
  Using Lema 1, at $x_i = 0$:
  $ x_i' = sum_(j=1)^n M_(i j) x_j = sum_(j != i) M_(i j) x_j. $
  For this to be $>= 0$ for all possible $x_j >= 0$ (with $j != i$), we must have $M_(i j) >= 0$ for all $j != i$.

  *2. Physiological Contribution:*
  Off-diagonal terms $M_(i j) > 0$ represent *activation* or *infusion* (e.g., glucose increasing insulin secretion). Negative off-diagonals (inhibition) would violate simple positivity of the first orthant in a purely linear model, suggesting that inhibitory biological loops often require nonlinear modeling or basal offsets to remain valid.
]

#supplementary[Comparison Principle for Positivity][
  Suppose $x' = f(x)$ and there exists a function $g(x)$ such that $f(x) >= g(x)$ for all $x$.
  1. If the origin is an equilibrium for $y' = g(y)$, show how this guarantees $x(t) >= 0$.
  2. Discuss how "dominating" a complex metabolic model with a simpler stable linear model can be used to prove biological safety.
]
#solution[
  *1. Proof:*
  By the comparison theorem, if $x(0) >= y(0)$, then $x(t) >= y(t)$ for all $t$. If we choose $y(0) = 0$ and $y' = g(y)$ has a solution $y(t) = 0$, then $x(t) >= 0$.

  *2. Biological Safety:*
  If we can show that the natural regulatory mechanisms ($f$) are always "stronger" than a minimal survival model ($g$), we can guarantee that the patient will never reach zero glucose, even if the exact nonlinearities of $f$ are unknown or varying.
]

#supplementary[Numerical breakdown: Positivity in Discretization][
  Consider the glucose equation $G' = P_G - (k_1 + k_2 I) G$.
  1. Discretize this equation using the Forward Euler method with step size $h$.
  2. Derive a condition on $h$ that ensures the numerical solution $G_k$ remains positive.
  3. Discuss the safety implications of using large steps in insulin pump controllers (AP systems).
]
#solution[
  *1. Discretization:*
  $ G_(k+1) = G_k + h [P_G - (k_1 + k_2 I_k) G_k] = G_k [1 - h (k_1 + k_2 I_k)] + h P_G. $

  *2. Positivity Condition:*
  For $G_(k+1) >= 0$, a sufficient condition (requiring the coefficient of $G_k$ to be non-negative) is:
  $ 1 - h(k_1 + k_2 I_k) >= 0 quad arrow.r.double quad h <= 1 / (k_1 + k_2 I_k). $
  Since $P_G > 0$ adds a positive term, this is a conservative bound but guarantees positivity for any $G_k >= 0$.

  *3. Safety Implications:*
  If an Artificial Pancreas (AP) system calculates doses using a large time step ($h$), it might over-predict the reduction in glucose, potentially resulting in a "negative glucose" calculation which corresponds to a severe hypoglycemic shock in reality.
]

#supplementary[Sublevel Sets as Invariant Sets][
  Relate the Lyapunov condition $dot(V) <= 0$ to the concept of invariant sets.
  1. Prove that any sublevel set $Omega_c = {x : V(x) <= c}$ is positively invariant if $dot(V) <= 0$ on its boundary.
  2. Why is this interpretation "sturdier" than just saying the origin is stable?
]
#solution[
  *1. Proof:*
  If $x(t)$ is on the boundary, $V(x(t)) = c$. Since $dot(V) <= 0$, $V$ cannot increase, so the trajectory cannot move to a state where $V > c$. Thus, it remains in $Omega_c$.

  *2. Sturdiness:*
  Stability describes behavior near a point. Invariant sets define *global or semi-global regions of validity*. Knowing that a patient stays within $Omega_c$ provides a specific range of values $(G, I)$ that are guaranteed, which is more actionable for a clinician than a general stability statement.
]

#supplementary[Conservation Laws and Invariant Manifolds][
  In some metabolic models, the total sum of certain species is conserved (e.g., Total Receptor Mass $R_T = R + R_("bound")$).
  1. Show that the hyperplane $sum x_i = C$ is an invariant manifold if $sum f_i(x) = 0$.
  2. Interpret this in terms of "mass balance" in the body.
]
#solution[
  *1. Invariance:*
  Let $S(x) = sum x_i$. Then $dot(S) = sum f_i(x) = 0$. This implies $S(t) = S(0)$ for all $t$. Thus, if the system starts on the manifold $sum x_i = C$, it stays there.

  *2. Mass Balance:*
  This reflects the biological reality that mass is neither created nor destroyed in a closed loop (like receptor recycling). If a model violates this invariance, it possesses a "leak" or "source" that must be physically justified.
]

#supplementary[Absorbing Boundaries and Pathological States][
  Define an *absorbing set* $A$ such that if $x(t_0) in A$, then $x(t) in A$ for all $t > t_0$.
  1. Show that the set $A = {(G, I, beta) : beta = 0}$ is absorbing for the model in the lecture notes.
  2. Contrast this with the set $G = 0$, which is not absorbing.
]
#solution[
  *1. Beta is Absorbing:*
  Since $beta' = beta(...)$, $beta = 0$ is a fixed point for the $beta$ subsystem. Once $beta$ reaches zero, it can never leave that state naturally.

  *2. Glucose is Not Absorbing:*
  At $G = 0$, $G' = P_G > 0$. The system immediately leaves the state $G=0$. This is vital for life; if $G=0$ were absorbing, any transient drop to zero sugar would be permanently fatal without immediate outside glucose infusion.
]

#supplementary[Full 3D Model Positivity Verification][
  Consider the full model:
  $ G' = P_G - (k_1 + k_2 I) G \ I' = beta f(G) - gamma I \ beta' = beta (r(G) - d(G)) $
  1. Use Lema 1 to prove that the first orthant $RR_+^3$ is positively invariant.
  2. Identify the biological assumptions required for each term (e.g., $f(G) >= 0$).
]
#solution[
  *1. Verification:*
  - At $G=0$: $G' = P_G > 0$ (Inward).
  - At $I=0$: $I' = beta f(G) >= 0$ (Inward or Tangent if $beta=0$).
  - At $beta=0$: $beta' = 0$ (Tangent).
  Since all boundary derivatives are $>= 0$ on their respective zero-faces, $RR_+^3$ is invariant.

  *2. Biological Assumptions:*
  - Hepatic production $P_G$ must be positive.
  - Secretion $f(G)$ and beta mass $beta$ must be non-negative.
  - If any of these were negative, the model would allow "negative concentrations," violating physical laws.
]

