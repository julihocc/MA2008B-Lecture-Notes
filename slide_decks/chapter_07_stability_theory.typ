#import "_theme.typ" as theme
#import "../utils.typ": *

#theme.slide_setup()

#theme.title_slide(
  "Stability Theory",
  "Lyapunov Methods and Biomathematical Applications",
  "MA2008B - Nonlinear Dynamics and Control",
  "2026",
)

#theme.slide("Roadmap", [
  - Stability question and equilibrium interpretation
  - Lyapunov Direct Method: local and global theorems
  - Lyapunov Indirect Method and center limitations
  - Linear systems: quadratic Lyapunov and matrix equation
  - LaSalle invariance principle
  - Glucose-insulin stability and clinical interpretation
], footer: "Chapter 7")

#theme.section_slide("Part I", "Mathematical Stability Theory")

#theme.slide("Stability Objective", [
  #theme.keypoint([
    For $x' = f(x)$ with equilibrium $x^*$, determine whether
    $x(t) arrow.r x^*$ as $t arrow.r infinity$ after perturbations.
  ])

  #v(0.5em)
  Two complementary approaches:
  - Direct: build a Lyapunov function $V(x)$
  - Indirect: linearize via $A = J(x^*)$
], footer: "Mathematical Review")

#theme.slide("Direct Method (Local)", [
  #theme.theorem("Lyapunov Direct Method", [
    If $V in C^1(U)$ around $x^*$ with
    - $V(x^*) = 0$
    - $V(x) > 0$ for $x != x^*$ in $U$
    - $dot(V)(x) < 0$ for $x != x^*$ in $U$

    then $x^*$ is locally asymptotically stable.
  ])

  Source: Khalil, Nonlinear Systems (3rd ed.), Ch. 4.
], footer: "Direct Method")

#theme.slide("Direct Method (Global)", [
  #theme.theorem("Global Asymptotic Stability", [
    Add global hypotheses:
    - $V$ defined on all $RR^n$
    - $V(x) arrow.r infinity$ as $norm(x) arrow.r infinity$

    with $V(x) > 0$ and $dot(V)(x) < 0$ for $x != x^*$.
  ])

  Then $x^*$ is globally asymptotically stable.
], footer: "Direct Method")

#theme.slide("Proof Logic (Direct Method)", [
  - Sublevel sets of $V$ trap trajectories
  - Monotonicity: $dot(V) < 0$ implies strict energy decay
  - Lower boundedness of $V$ gives convergence of $V(x(t))$
  - Contradiction on compact trapped set forces limit $V \to 0$
  - Positive definiteness identifies limit point as $x^*$
], footer: "Proof Structure")

#theme.slide("Solved Example: Global Stability", [
  System:
  $x_1' = -x_1 + x_2$, $x_2' = -x_1 - x_2^3$

  Candidate:
  $V(x) = 1/2(x_1^2 + x_2^2)$

  Derivative:
  $dot(V) = -x_1^2 - x_2^4 < 0$ for $x != 0$

  Since $V arrow.r infinity$ as $norm(x) arrow.r infinity$,
  origin is globally asymptotically stable.
], footer: "Solved Problem")

#theme.slide("Indirect Method (Linearization)", [
  Linearize near equilibrium:
  $delta x' = A delta x$, with $A = J(x^*)$

  #theme.theorem("Lyapunov Indirect Method", [
    - All $Re(lambda_i(A)) < 0$ => local asymptotic stability
    - Some $Re(lambda_i(A)) > 0$ => instability
    - Some $Re(lambda_i(A)) = 0$ => inconclusive
  ])
], footer: "Indirect Method")

#theme.slide("Why Indirect Method Can Fail", [
  Compare:
  - $x' = -x^3$
  - $x' = x^3$

  Both have $J(0)=0$, so linearization gives no conclusion.

  Using $V(x)=1/2 x^2$:
  - $dot(V) = -x^4 < 0$ => asymptotically stable
  - $dot(V) = x^4 > 0$ => unstable

  #theme.keypoint([
    Same linear model, opposite nonlinear behavior.
  ])
], footer: "Center Case")

#theme.slide("Quadratic Lyapunov for Linear Systems", [
  For $x' = A x$, choose $V(x)=x^T P x$, $P=P^T>0$.

  Then:
  $dot(V) = x^T(A^T P + P A)x$

  If $A^T P + P A = -Q$ with $Q=Q^T>0$,
  then $dot(V)<0$ for all $x!=0$.

  Conclusion: origin is globally asymptotically stable.
], footer: "Linear Systems")

#theme.slide("Lyapunov Equation Solvability", [
  #theme.theorem("Hurwitz Criterion Link", [
    If $A$ is Hurwitz, then for any $Q>0$,
    $A^T P + P A = -Q$
    has a unique $P>0$.

    Explicit formula:
    $P = integral_0^infinity e^(A^T t) Q e^(A t) d t$
  ])
], footer: "Linear Systems")

#theme.slide("2x2 Example", [
  With $J = mat(-3, 1; -2, -4)$:
  - Eigenvalues of $J$: $-3.5 plus.minus i sqrt(7)/2$ (Hurwitz)
  - With $P=I$, $J^T+J = mat(-6, -1; -1, -8)$
  - Eigenvalues: $-7 plus.minus sqrt(2)$, both negative

  Therefore $dot(V) < 0$ and origin is asymptotically stable.
], footer: "Solved Problem")

#theme.slide("LaSalle Invariance Principle", [
  If only $dot(V) <= 0$, define
  $E = {x in Omega : dot(V)(x)=0}$.

  Trajectories converge to the largest invariant subset of $E$.

  Use LaSalle when strict negativity is unavailable,
  especially in coupled biomathematical models.
], footer: "Advanced Tool")

#theme.section_slide("Part II", "Biomathematical Stability")

#theme.slide("Glucose-Insulin Model Setup", [
  Generic planar model near healthy equilibrium:
  $mat(delta G'; delta I') = mat(-p_1, -p_2; p_3, -p_4) mat(delta G; delta I)$
  with $p_i > 0$.

  Candidate:
  $V = (delta G)^2 + c (delta I)^2$

  Clinical view: stability means perturbations in glucose/insulin
  decay back to healthy operating point.
], footer: "Biomath Review")

#theme.slide("Weighted Lyapunov Design", [
  Compute $dot(V)$ and cancel mixed term via
  $c = p_2/p_3$.

  Then:
  $dot(V) = -2p_1(delta G)^2 - 2 (p_2 p_4/p_3) (delta I)^2 < 0$

  Since $p_i>0$, healthy equilibrium is locally asymptotically stable.
], footer: "Solved Problem")

#theme.slide("LaSalle in Metabolic Dynamics", [
  If model yields only
  $dot(V) = -2 p_1 (delta G)^2 <= 0$,
  then $E = {(delta G, delta I): delta G=0}$.

  Invariance condition inside $E$ forces $delta I=0$,
  so largest invariant subset is only the origin.

  By LaSalle: local asymptotic stability still follows.
], footer: "Solved Problem")

#theme.slide("Pathological Equilibrium Criterion", [
  For
  $J_"path" = mat(-p_1, -p_2; -p_3, -p_4)$,
  instability occurs when determinant is negative:

  $det(J_"path") = p_1 p_4 - p_2 p_3 < 0$
  $=> p_2 p_3 > p_1 p_4$

  Interpretation: pathological feedback dominates natural stabilization.
], footer: "Clinical Interpretation")

#theme.slide("Method Selection Summary", [
  #table(
    columns: 3,
    align: (left, center, center),
    [Criterion], [Direct], [Indirect],
    [Scope], [Local or global], [Local],
    [Data needed], [Lyapunov candidate], [Jacobian eigenvalues],
    [Center case], [Works], [Inconclusive],
    [Biomath use], [Strong], [Fast screening],
  )

  Practical workflow: indirect first, direct for certification.
], footer: "Summary")

#theme.section_slide("Chapter 7", "Questions")
