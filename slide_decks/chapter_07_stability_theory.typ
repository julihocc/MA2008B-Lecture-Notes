#import "_theme.typ" as theme
#import "../utils.typ": *

#theme.slide_setup()

#theme.title_slide(
  "Stability Theory",
  "Lyapunov Methods",
  "MA2008B - Nonlinear Dynamics and Control",
  "2026",
)

#theme.slide("Roadmap", [
  - Stability question and equilibrium viewpoint
  - Lyapunov Direct Method: local and global
  - Lyapunov Indirect Method: linearization
  - Quadratic Lyapunov functions for linear systems
  - LaSalle and method selection
], footer: "Chapter 7")

#theme.slide("Core Question", [
  #theme.keypoint([
    Given $x' = f(x)$ and equilibrium $x^*$, when do trajectories satisfy
    $x(t) arrow.r x^*$ as $t arrow.r infinity$?
  ])

  #v(0.6em)
  Two tools:
  - Direct: construct $V(x)$ with $dot(V) < 0$
  - Indirect: inspect eigenvalues of $J(x^*)$
], footer: "Chapter 7")

#theme.slide("Direct Method (Local)", [
  #theme.theorem("Lyapunov Direct Method", [
    If $V in C^1$ on a neighborhood $U$ of $x^*$ and
    - $V(x^*) = 0$
    - $V(x) > 0$ for $x != x^*$ in $U$
    - $dot(V)(x) < 0$ for $x != x^*$ in $U$

    then $x^*$ is locally asymptotically stable.
  ])

  #v(0.4em)
  Source: Khalil, Nonlinear Systems (3rd ed.), Ch. 4.
], footer: "Direct Method")

#theme.slide("Direct Method (Global)", [
  #theme.theorem("Global Asymptotic Stability", [
    Add two global conditions:
    - $V$ is defined on all $RR^n$
    - $V(x) arrow.r infinity$ as $norm(x) arrow.r infinity$

    with the same positivity and $dot(V) < 0$ assumptions.
  ])

  #v(0.5em)
  Then $x^*$ is globally asymptotically stable.
], footer: "Direct Method")

#theme.slide("Worked Example", [
  System:
  $x_1' = -x_1 + x_2$,  $x_2' = -x_1 - x_2^3$

  Candidate:
  $V(x) = 1/2 (x_1^2 + x_2^2)$

  Derivative:
  $dot(V) = -x_1^2 - x_2^4 < 0$ for $x != 0$

  Since $V arrow.r infinity$ as $norm(x) arrow.r infinity$,
  origin is globally asymptotically stable.
], footer: "Example")

#theme.slide("Indirect Method", [
  Linearize near equilibrium:
  $delta x' = A delta x$, with $A = J(x^*)$

  #theme.theorem("Linearization Test", [
    - If all $Re(lambda_i(A)) < 0$: local asymptotic stability
    - If some $Re(lambda_i(A)) > 0$: instability
    - If some $Re(lambda_i(A)) = 0$: inconclusive
  ])
], footer: "Indirect Method")

#theme.slide("Center Case: Why Direct Method Matters", [
  Compare:
  - $x' = -x^3$
  - $x' = x^3$

  Both have $J(0)=0$ so indirect method is inconclusive.

  With $V(x)=1/2 x^2$:
  - $dot(V) = -x^4 < 0$ => stable
  - $dot(V) = x^4 > 0$ => unstable

  #theme.keypoint([
    Same linearization, opposite stability. Nonlinear terms decide.
  ])
], footer: "Edge Case")

#theme.slide("Linear Systems: Quadratic Lyapunov", [
  For $x' = A x$, use
  $V(x) = x^T P x$, with $P = P^T > 0$.

  Then
  $dot(V) = x^T(A^T P + P A)x$.

  If $A^T P + P A = -Q$ with $Q = Q^T > 0$,
  then $dot(V) < 0$ for all $x != 0$.
], footer: "Linear Systems")

#theme.slide("Lyapunov Equation", [
  #theme.theorem("Solvability", [
    If $A$ is Hurwitz, then for any $Q > 0$,
    $A^T P + P A = -Q$
    has a unique $P > 0$.

    Explicitly,
    $P = integral_0^infinity e^(A^T t) Q e^(A t) d t$.
  ])
], footer: "Linear Systems")

#theme.slide("LaSalle Principle", [
  If only $dot(V) <= 0$ (not strictly negative), use LaSalle:
  trajectories converge to the largest invariant subset of
  $E = {x in Omega: dot(V)(x)=0}$.

  This often closes gaps in biomathematical models where
  strict negativity is hard to show globally.
], footer: "Advanced")

#theme.slide("Direct vs Indirect", [
  #table(
    columns: 3,
    align: (left, center, center),
    [Criterion], [Direct], [Indirect],
    [Scope], [Local or global], [Local],
    [Computation], [Construct $V$], [Eigenvalues],
    [Center case], [Works], [Inconclusive],
    [Speed], [Moderate], [Fast],
  )

  #v(0.5em)
  Practical workflow: Indirect first, Direct for edge cases or global claims.
], footer: "Comparison")

#theme.slide("Takeaways", [
  - Direct method gives rigorous nonlinear and global results.
  - Indirect method gives fast local classification.
  - Lyapunov equation gives constructive certificates for linear systems.
  - LaSalle extends analysis when $dot(V)$ is only semi-definite.
], footer: "Summary")

#theme.section_slide("Chapter 7", "Questions")
