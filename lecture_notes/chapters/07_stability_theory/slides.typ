#import "../../../utils.typ": *

#set page(paper: "presentation-16-9", margin: 1cm)
#set text(size: 14pt)
#set heading(numbering: none)

#let slide(title, body) = {
  page(header: text(size: 11pt, weight: "bold")[Chapter 7: Stability Theory])[
    #heading(level: 1)[#title]
    #body
  ]
}

// === TITLE SLIDE ===
#page(margin: 2cm, align(center)[
  #text(size: 48pt, weight: "bold")[Stability Theory]
  #v(1em)
  #text(size: 28pt)[Lyapunov Methods]
  #v(3em)
  #text(size: 16pt)[MA2008B — Nonlinear Dynamics & Control]
])

// === OUTLINE ===
#slide("Outline")[
  *Part I: Theory*
  - Lyapunov Direct Method (local and global)
  - Lyapunov Indirect Method (linearization)
  - Linear systems & Lyapunov equation
  
  *Part II: Comparison & Decision-Making*
  - When to use each method
  - Examples and edge cases
]

// === MOTIVATION ===
#slide("Why Lyapunov Analysis?")[
  *Problem:* Does $x(t) arrow.r x^* $ as $t arrow.r infinity$?
  
  *Indirect approach (Linearization):*
  - Check Jacobian eigenvalues at equilibrium
  - Fast and systematic
  - Problem: only gives local info; inconclusive at "centers"
  
  *Direct approach (Lyapunov function):*
  - Construct energy-like function $V(x)$
  - If $dot(V) < 0$, system dissipates energy → convergence
  - Advantage: works globally if $V$ is radially unbounded
]

// === LYAPUNOV FUNCTION INTUITION ===
#slide("Lyapunov Function Intuition")[
  *Definition:* A scalar function $V(x)$ is a Lyapunov function if:
  
  1. $V(x^*) = 0$ (zero at equilibrium)
  2. $V(x) > 0$ for all $x != x^*$ (positive elsewhere)
  3. $dot(V)(x) < 0$ for all $x != x^*$ (energy decreases)
  
  *Analogy:* Think of $V$ as height above ground in a valley
  - Trajectories always move downhill
  - Must converge to the bottom (equilibrium)
  - No escaping to the sides
]

// === DIRECT METHOD: LOCAL ===
#slide("Lyapunov Direct Method: Local Stability")[
  #theorem[Local Asymptotic Stability (Khalil, 2002)][
    Let $x^*$ be an equilibrium of $x' = f(x)$. If there exists a continuously differentiable function $V(x)$ defined on a neighborhood $U$ of $x^*$ such that:
    1. $V(x^*) = 0$
    2. $V(x) > 0$ for all $x in U$ with $x != x^*$
    3. $dot(V)(x) < 0$ for all $x in U$ with $x != x^*$
    
    then $x^*$ is locally asymptotically stable.
  ]
]

// === DIRECT METHOD: GLOBAL ===
#slide("Lyapunov Direct Method: Global Stability")[
  #theorem[Global Asymptotic Stability (Khalil, 2002)][
    Let $x^*$ be an equilibrium of $x' = f(x)$. If there exists a continuously differentiable function $V(x)$ on all of $RR^n$ such that:
    1. $V(x^*) = 0$, $V(x) > 0$ for all $x != x^*$
    2. $dot(V)(x) < 0$ for all $x != x^*$
    3. *Radial unboundedness:* $V(x) arrow.r infinity$ as $norm(x) arrow.r infinity$
    
    then $x^*$ is globally asymptotically stable.
  ]
  
  *Key difference:* Radial unboundedness prevents escape to infinity.
]

// === EXAMPLE: GLOBAL STABILITY ===
#slide("Example: Global Stability via Direct Method")[
  *System:* $x_1' = -x_1 + x_2$, $x_2' = -x_1 - x_2^3$
  
  *Candidate Lyapunov function:*
  $ V(x_1, x_2) = 1/2 (x_1^2 + x_2^2) $
  
  *Time derivative along trajectories:*
  $ dot(V) = x_1(-x_1 + x_2) + x_2(-x_1 - x_2^3) = -x_1^2 - x_2^4 < 0 $
  
  *Conclusions:*
  - $dot(V) < 0$ everywhere except at origin
  - $V arrow.r infinity$ as $norm(x) arrow.r infinity$ (radially unbounded)
  - Therefore: origin is *globally asymptotically stable*
]

// === INDIRECT METHOD ===
#slide("Lyapunov Indirect Method: Linearization")[
  *Setup:* Nonlinear system $x' = f(x)$ with equilibrium $x^*$
  
  *Linearization:* Taylor expand around $x^*$:
  $ f(x) = f(x^*) + J(x^*)(x - x^*) + "higher order" $
  
  Since $f(x^*) = 0$, the linearized system is:
  $ Delta x' = A Delta x, quad "where " A = J(x^*) $
  
  *Question:* Does linear stability imply nonlinear (local) stability?
]

#slide("Lyapunov Indirect Method: Main Theorem")[
  #theorem[Linearization Theorem (Khalil, 2002)][
    Let $A = J(x^*)$ be the Jacobian at equilibrium $x^*$.
    
    - If all $Re(lambda_i(A)) < 0 $: then $x^*$ is locally asymptotically stable
    - If $exists lambda_j$ with $Re(lambda_j(A)) > 0$: then $x^*$ is unstable
    - If $Re(lambda_i) = 0$ for some $i$: *inconclusive*
  ]
  
  *Bottom line:* Check eigenvalues of Jacobian — fast and systematic!
]

#slide("Why Linearization Works")[
  *Case 1: All $Re(lambda_i) < 0$ (negative real parts)*
  
  - Linear system decays exponentially
  - Nonlinear terms are higher-order: $g(Delta x) = o(norm(Delta x))$
  - Near origin, linear terms dominate → local stability preserved
  
  *Case 2: Some $Re(lambda_j) > 0$ (positive real part)*
  
  - Linear system grows exponentially in that direction
  - Nonlinear perturbations are too small to prevent growth
  - Result: instability persists
  
  *Case 3: Some $Re(lambda) = 0$ (on imaginary axis)*
  
  - Linear analysis gives no information!
  - Must use Direct Method
]

#slide("Example: The Center Problem")[
  *Compare two systems:*
  - System A: $x' = -x^3$ (nonlinear damping)
  - System B: $x' = x^3$ (nonlinear growth)
  
  *Linearization:* $frac(d, d x)( plus.minus x^3)|_(x=0) = 0$
  
  Eigenvalue $lambda = 0$ → *inconclusive for both*
  
  *Direct Method:* Candidate $V(x) = 1/2 x^2$
  - System A: $dot(V) = x(-x^3) = -x^4 < 0$ → *stable*
  - System B: $dot(V) = x(x^3) = x^4 > 0$ → *unstable*
  
  *Lesson:* Centers can be either stable or unstable; need Direct Method to determine.
]

// === LINEAR SYSTEMS ===
#slide("Quadratic Lyapunov Functions for Linear Systems")[
  *Linear system:* $x' = A x$ with equilibrium at origin
  
  *Quadratic candidate:* $V(x) = x^T P x$ where $P = P^T > 0$
  
  *Time derivative:*
  $ dot(V) = x^T (A^T P + P A) x $
  
  *Stability condition:* If $A^T P + P A = -Q$ for some $Q = Q^T > 0$, then:
  $ dot(V) = -x^T Q x < 0 quad forall x != 0 $
  
  *Result:* Origin is globally asymptotically stable for linear system.
]

#slide("The Lyapunov Equation")[
  #theorem[Lyapunov Equation Solvability (Khalil, 2002)][
    For a Hurwitz matrix $A$ (all $Re(lambda_i(A)) < 0$) and any $Q = Q^T > 0$,
    the continuous Lyapunov equation
    $ A^T P + P A = -Q $
    has a unique solution $P = P^T > 0$.
    
    Explicit formula: $P = integral_0^infinity e^(A^T t) Q e^(A t) d t$
  ]
  
  *Interpretation:* 
  - Every stable linear system admits a quadratic Lyapunov function
  - The formula is constructive (though may be hard to compute)
]

#slide("Example: 2×2 Linear System")[
  *System:* $J = mat(-3, 1; -2, -4)$
  
  *Eigenvalues:* $lambda = -3.5 plus.minus i sqrt(7)/2$ (Hurwitz ✓)
  
  *Choose $P = I$ (identity matrix). Then:*
  $ J^T + J = mat(-6, -1; -1, -8) $
  
  *Eigenvalues of $J^T + J$:* $-7 plus.minus sqrt(2)$ (both negative!)
  
  *Conclusion:* $dot(V) = x^T(J^T + J)x < 0$ for all $x != 0$
  
  $ therefore "origin is globally asymptotically stable" $
]

// === ADVANCED TOPICS ===
#slide("LaSalle's Invariance Principle")[
  #theorem[Invariance Principle][
    Let $Omega$ be a compact positively invariant set and $dot(V) <= 0$ on $Omega$.
    
    Define:
    - $E = {x in Omega : dot(V)(x) = 0}$
    - $M$ = largest invariant subset of $E$
    
    Then every solution starting in $Omega$ converges to $M$ as $t arrow.r infinity$.
  ]
  
  *Use case:* When $dot(V) <= 0$ (only semi-definite), still get convergence if no "vicious cycles" stay in $E$.
]

// === COMPARISON TABLE ===
#slide("Direct vs. Indirect Methods")[
  #table(
    columns: 3,
    align: (left, center, center),
    [*Criterion*], [*Direct*], [*Indirect*],
    [*Scope*], [Local or global], [Local only],
    [*Eigenvalues*], [Not needed], [Essential],
    [*Centers*], [Works], [Inconclusive],
    [*Effort*], [Problem-dependent], [Systematic],
    [*Speed*], [Varies], [Fast],
    [*Type*], [Constructive], [Algebraic],
  )
  
  *When to use Direct:* Nonlinear systems, global stability, edge cases
  
  *When to use Indirect:* Linear systems, quick initial analysis
]

#slide("Decision Tree")[
  *Given equilibrium $x^*$ of $x' = f(x)$:*
  
  1. Compute Jacobian $A = J(x^*)$
  2. Find eigenvalues:
     - All $Re(lambda_i) < 0$ → use Indirect Method → locally stable ✓
     - Some $Re(lambda_j) > 0$ → unstable ✗
     - Some $Re(lambda) = 0$ → *inconclusive* → go to step 3
  3. For inconclusive cases:
     - Try to construct $V(x)$ (Direct Method)
     - Check $dot(V) < 0$ on a neighborhood of $x^*$
     - If successful → locally stable; if global $V$ → globally stable
]

// === KEY TAKEAWAYS ===
#slide("Key Takeaways")[
  + *Direct Method is powerful* for nonlinear systems and global stability
  
  + *Indirect Method is fast* for initial analysis and linear systems
  
  + *They complement each other* — use together for complete understanding
  
  + *Edge case: centers* require the Direct Method
  
  + *Linear stable systems always admit quadratic Lyapunov functions*
]

// === FINAL SLIDE ===
#page(margin: 2cm, align(center)[
  #text(size: 44pt, weight: "bold")[Questions?]
  #v(3em)
  #text(size: 16pt)[Chapter 7: Stability Theory]
  #v(2em)
  #text(size: 12pt)[(MA2008B — Nonlinear Dynamics & Control)]
])
