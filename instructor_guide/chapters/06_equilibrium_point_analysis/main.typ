#import "../../../utils.typ": *

= Equilibrium Point Analysis

== Application: Vector Fields and Phase Portraits in 2D Systems

=== Supplementary Problems

#supplementary[Competitive Exclusion Principle Phase Analysis][
  Two species $x(t)$ and $y(t)$ competing for the same limited resource can be modeled by the Lotka-Volterra competition system:
  $ x' &= r_1 x(1 - x - alpha y) \ y' &= r_2 y(1 - y - beta x) $
  Sketch the corresponding nullclines for the case where $alpha > 1$ and $beta > 1$ (representing strong inter-species competition). Use phase plane geometry to visually demonstrate that the interior co-existence equilibrium is a saddle point, providing mathematical justification for the ecological principle of competitive exclusion (i.e., almost all trajectories converge to either $(1,0)$ or $(0,1)$).
]
#solution[
  *1. Nullcline Equations:*
  - *x-nullclines*: $x = 0$ and $x + alpha y = 1$ (line from $(0, 1/alpha)$ to $(1,0)$).
  - *y-nullclines*: $y = 0$ and $y + beta x = 1$ (line from $(0, 1)$ to $(1/beta, 0)$).
  
  *2. Equilibria:*
  For $alpha, beta > 1$, the nullcline lines $x + alpha y = 1$ and $y + beta x = 1$ intersect at $(x^*, y^*) = ( (alpha-1)/(alpha beta - 1), (beta-1)/(alpha beta - 1) )$. 
  Other equilibria are: $(0,0), (1,0), (0,1)$.
  
  *3. Jacobian and Stability:*
  $ J(x,y) = J = mat(r_1(1-2x-alpha y), -r_1 alpha x; -r_2 beta y, r_2(1-2y-beta x)) $
  At the interior point $(x^*, y^*)$:
  $ J^* = mat(-r_1 x^*, -r_1 alpha x^*; -r_2 beta y^*, -r_2 y^*) $
  The determinant is:
  $ det(J^*) = (-r_1 x^*)(-r_2 y^*) - (-r_1 alpha x^*)(-r_2 beta y^*) = r_1 r_2 x^* y^* (1 - alpha beta) $
  Since $alpha, beta > 1$, $1 - alpha beta < 0$, so $det(J^*) < 0$. This rigorously proves $(x^*, y^*)$ is a *saddle point*. Its unstable manifold forms the boundary between the basins of attraction of $(1,0)$ and $(0,1)$, confirming the Competitive Exclusion Principle.
]

#supplementary[Directional Field Sign Analysis in a Cubic-Linear System][
  Consider the planar nonlinear system:
  $ x' &= x - x^3 - y \ y' &= mu (x - y) $
  with parameter $mu > 0$.
]
#solution[
  *1. Nullclines and Equilibria:*
  - *x-nullcline*: $y = x - x^3$ (a cubic curve).
  - *y-nullcline*: $y = x$ (a line through the origin).
  - *Equilibria*: Set $x = x - x^3 => x^3 = 0 => x^* = 0$. The unique equilibrium is $(0,0)$.

  *2. Signs of the Vector Field:*
  For $x > 0$, note that $x - x^3 < x$ always (since $-x^3 < 0$). The nullclines divide the half-plane into four regions:
  - *Region A ($y > x$, above both nullclines):* $x' < 0$ (Left), $y' < 0$ (Down). Vector points SW.
  - *Region B ($x - x^3 < y < x$, between nullclines):* $x' < 0$ (Left), $y' > 0$ (Up). Vector points NW.
  - *Region C ($0 < y < x - x^3$, below both nullclines):* $x' > 0$ (Right), $y' > 0$ (Up). Vector points NE.
  - *Region D ($y < 0$):* $x' > 0$ (Right), $y' < 0$ (Down). Vector points SE.

  *3. Forward Invariance:*
  On the boundary $x=0$, $x' = -y$. If $y > 0$ (Quadrant I), the vector points *out* of Q1 into Q2. Therefore, Quadrant I is *not* forward invariant. Similarly, for $y < 0$ (Quadrant III), $x' = -y > 0$, pointing *out* of Q3 into Q4. Neither quadrant is forward invariant.
]

#supplementary[Linearization and Local Type of Equilibria][
  For the system
  $ x' &= x(1 - x) - a y \ y' &= y(-1 + b x) $
  with $a, b > 0$:
]
#solution[
  *1. Equilibrium Points:*
  - Setting $x' = 0, y' = 0$: $(0,0)$ and $(1,0)$.
  - Interior point: $y' = 0 => x = 1/b$ (exists if $b > 0$). Then $x' = (1/b)(1 - 1/b) - a y = 0 => y = (b-1)/(a b^2)$. Exists in $RR_+^2$ if $b > 1$.
  
  *2. Stability Analysis:*
  $ J(x,y) = mat(1 - 2x, -a; b y, -1 + b x) $
  - *At $(0,0)$*: $J = mat(1, -a; 0, -1)$. $det = -1 < 0$. *Saddle Point*.
  - *At $(1,0)$*: $J = mat(-1, -a; 0, b - 1)$. If $b < 1$, *Stable Node*. If $b > 1$, *Saddle Point*.
  - *At interior $(x^*, y^*)$*: $J = mat(1 - 2/b, -a; (b-1)/(a b), 0)$.
    $text("tr")(J) = 1 - 2/b$, $det(J) = (b-1)/b$.
    Since $det(J) > 0$ requires $b > 1$, the interior equilibrium exists and is relevant only for $b > 1$. The trace satisfies $text("tr")(J) < 0$ when $b > 2$.
    - *Stable* (node or focus) for $b > 2$.
    - *Unstable* (positive trace) for $1 < b < 2$.
    - *Hopf bifurcation* at $b = 2$ ($tr = 0$, $det > 0$): stability changes and a periodic orbit may emerge.
]

#supplementary[Bendixson-Dulac Exclusion of Closed Orbits][
  Consider the system
  $ x' &= x(2 - x - y) \ y' &= y(-1 + x - y) $
  on the simply connected domain $Omega = {(x,y) in RR^2 : x > 0, y > 0}$.
]
#solution[
  *1. Local Divergence:*
  $ f(x,y) = 2x - x^2 - x y \ g(x,y) = -y + x y - y^2 $
  $ text("div") = partial f / partial x + partial g / partial y = (2 - 2x - y) + (-1 + x - 2y) = 1 - x - 3y. $
  The divergence changes sign across the line $x + 3y = 1$, so Bendixson's criterion is inconclusive on $Omega$.

  *2. Dulac's Criterion:*
  Propose Dulac function $B(x,y) = 1/(x y)$.
  $ text("div")(B f, B g) = partial / partial x (2/y - x/y - 1) + partial / partial y (-1/x + 1 - y/x) = -1/y - 1/x. $
  For $x,y > 0$, the divergence is strictly negative: $-(1/x + 1/y) < 0$.
  By Bendixson-Dulac, there are *no periodic orbits* in the first quadrant $Omega$.
]

#supplementary[FitzHugh-Nagumo Excitability Threshold Exercise][
  For the FitzHugh-Nagumo system
  $ v' &= v - v^3 / 3 - w + I_"ext" \ w' &= epsilon (v + a - b w), $
  assume $a, b, epsilon > 0$ and $0 < epsilon lt.double 1$.
]
#solution[
  *1. Nullcline Geometry:*
  - *v-nullcline*: $w = v - v^3 / 3 + I_"ext"$. Vertical shifts of the cubic translate with $I_"ext"$.
  - *w-nullcline*: $w = (v + a) / b$. A straight line.

  *2. Equilibrium Multiplicity:*
  The number of equilibria corresponds to intersections between the cubic and the line. For typical $a, b$, there is a unique resting point on the leftmost branch for low $I_"ext"$. As $I_"ext"$ increases, the cubic rises, and a fold/Hopf bifurcation can occur.

  *3. Excitability Mechanism:*
  At rest, the system is at a stable point. A pulse in $I_"ext"$ pushes $v$ past the middle unstable branch of the cubic nullcline. The separation of timescales ($epsilon << 1$) forces the trajectory to track the upper stable branch of the cubic (fast excitation) before a slow recovery returns it via the lower branch.
]

== Application: Equilibrium Point Analysis in Biological Models

=== Supplementary Problems

#supplementary[Jacobian Matrix and Local Stability][
  For the planar $(G, I)$ subsystem with constant $beta_0$:
]
#solution[
  *1. Analytical Jacobian:*
  Let $F(G,I) = P_G - k_1 G - k_2 I G$ and $H(G,I) = beta_0 f(G) - gamma I$.
  $ J(G,I) = mat(partial F / partial G, partial F / partial I; partial H / partial G, partial H / partial I) = mat(-k_1 - k_2 I, -k_2 G; beta_0 f'(G), -gamma) $

  *2. Evaluation at Equilibria:*
  At an equilibrium $(G^*, I^*)$, we have $I^* = (beta_0 f(G^*))/gamma$. Substituting this:
  $ J^* = mat(-k_1 - k_2 I^*, -k_2 G^*; beta_0 f'(G^*), -gamma) $
  For the stable points $x_1, x_3$, $text("tr")(J) < 0$ and $det(J) > 0$. For the saddle $x_2$, $det(J) < 0$.
]

#supplementary[Positivity and Forward Invariance of the Physiological Region][
  Consider the reduced planar subsystem
  $ G' &= P_G - k_1 G - k_2 I G \ I' &= beta_0 f(G) - gamma I, $
  with $P_G, k_1, k_2, beta_0, gamma > 0$ and $f(G) >= 0$ for $G >= 0$.
]
#solution[
  *1. Boundary Analysis:*
  - *On $G=0$*: $G' = P_G > 0$. The vector field points into the first quadrant.
  - *On $I=0$*: $I' = beta_0 f(G) >= 0$. The vector field points into or is tangent to the first quadrant.
  
  *2. Forward Invariance:*
  Since the vector field on the boundaries of $RR_+^2$ never points outwards, any trajectory starting at $t=0$ in the non-negative quadrant remains there for all $t > 0$.

  *3. Biological Interpretation:*
  Glucose and insulin concentrations can never become negative, which is physically necessary as they represent mass/volume quantities.
]

#supplementary[Existence of Equilibria via a Scalar Intersection Equation][
  Starting from the nullcline substitution
  $ P_G - k_1 G - k_2 G ((beta_0 f(G)) / gamma) = 0, $
  define
  $Phi(G) = P_G - k_1 G - (k_2 beta_0 / gamma) G f(G).$
]
#solution[
  *1. Intermediate Value Theorem (IVT) Approach:*
  - *At $G=0$*: $Phi(0) = P_G > 0$.
  - *As $G -> oo$*: Since $f(G)$ is bounded (e.g., sigmoid), the term $-k_1 G$ dominates. Thus, for sufficiently large $G$, $Phi(G) < 0$.
  - *Conclusion*: By the IVT, there must exist at least one $G^* > 0$ such that $Phi(G^*) = 0$.

  *2. Graphical Conditions:*
  One root exists if $Phi(G)$ is strictly decreasing. Three roots (bistability) occur if the insulin term $(k_2 beta_0 / gamma) G f(G)$ is sufficiently sigmoidal to allow $Phi(G)$ to "dip" and rise against the linear decay $-k_1 G$.
]

#supplementary[Parameter Sensitivity of the Healthy Equilibrium][
  Assume $x_1^* = (G_1^*, I_1^*)$ is a stable equilibrium branch parameterized by $beta_0$.
]
#solution[
  *1. Implicit Differentiation:*
  Differentiate $Phi(G_1, beta_0) = 0$ with respect to $beta_0$:
  $ (partial Phi / partial G) (d G_1^* / d beta_0) + (partial Phi / partial beta_0) = 0 \ => d G_1^* / d beta_0 = - (partial Phi / partial beta_0) / (partial Phi / partial G) $

  *2. Sign Determination:*
  - $partial Phi / partial beta_0 = -(k_2 / gamma) G f(G) < 0$.
  - For a stable equilibrium, we generally require the slope $partial Phi / partial G < 0$.
  - Thus, $d G_1^* / d beta_0 = - ("negative") / ("negative") < 0$.
  
  *3. Interpretation:*
  Increasing $beta_0$ (more insulin-producing mass) lowers the steady-state glucose level $G_1^*$. Conversely, $beta$-cell loss ($beta_0$ decreasing) raises blood sugar.
]

#supplementary[Local Bifurcation Condition at a Fold Point][
  Let $Phi(G, beta_0) = P_G - k_1 G - (k_2 beta_0 / gamma) G f(G)$.
]
#solution[
  *1. Fold Bifurcation Conditions:*
  A fold (saddle-node) bifurcation occurs when a root of $Phi$ is no longer simple:
  - $Phi(G_c, beta_c) = 0$ (Equilibrium exists).
  - $partial Phi / partial G (G_c, beta_c) = 0$ (Stability is lost; the graph is tangent to the axis).
  - $partial^2 Phi / partial G^2 (G_c, beta_c) != 0$ (Non-degeneracy).

  *2. Geometric Interpretation:*
  This corresponds to the point where the $G$-nullcline and $I$-nullcline are tangent. Beyond $beta_c$, the curves no longer intersect in that region, leading to the annihilation of the stable and saddle equilibria.
]
