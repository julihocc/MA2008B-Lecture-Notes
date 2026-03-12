#import "../../../utils.typ": *
== Second-Order Nonlinear Systems

=== Mathematical Review

This section studies two-dimensional autonomous nonlinear systems of the form
$ x' = f(x,y) \ y' = g(x,y). $
Unlike linear systems, nonlinear systems can have multiple equilibria and complex behaviors such as limit cycles. We begin by analyzing the local behavior near each equilibrium using linearization.

#definition[Equilibrium Solutions][
  An equilibrium (or critical point) $(x^*, y^*)$ satisfies the system of algebraic equations:
  $ f(x^*, y^*) = 0, quad g(x^*, y^*) = 0. $
]

#definition[Jacobian Matrix and Linearization][
  To understand the flow near an equilibrium $(x^*, y^*)$, we linearize the system by considering small perturbations $u = x - x^*$ and $v = y - y^*$. The linearized system is
  $ mat(u'; v') = J(x^*, y^*) mat(u; v), $
  where the Jacobian matrix is
  $ J(x,y) = mat( (partial f) / (partial x), (partial f) / (partial y) ; (partial g) / (partial x), (partial g) / (partial y) ). $
]

#theorem[Hartman-Grobman Theorem (Linear Stability Theory)][
  If the Jacobian $J(x^*,y^*)$ evaluated at the equilibrium has no eigenvalues with zero real part (i.e., the equilibrium is hyperbolic), then the qualitative behavior of the nonlinear system in a small neighborhood of $(x^*,y^*)$ is topologically the same as that of its linearization.
  
  In particular:
  - If all eigenvalues of $J$ have negative real parts, the equilibrium is locally asymptotically stable.
  - If at least one eigenvalue has a positive real part, the equilibrium is unstable.
]

Note that if the linearization yields a center (purely imaginary eigenvalues), the Hartman-Grobman theorem does not apply, and higher-order terms determine whether the true nonlinear equilibrium is a stable focus, unstable focus, or a true center.

#definition[Phase Portraits for Nonlinear Systems][
  To draw the global phase portrait of a 2D nonlinear system:
  1. Find all equilibrium points $(x^*,y^*)$.
  2. Compute the Jacobian matrix $J(x,y)$.
  3. Evaluate $J$ at each equilibrium to find its eigenvalues and eigenvectors.
  4. Classify each equilibrium (node, saddle, focus, etc.) and sketch the local trajectories using the eigenvectors (for nodes/saddles) or rotation direction (for foci).
  5. Combine the local portraits into a global picture, inferring the connecting trajectories.
]

=== Solved Problems

#solved_problem[Linearizing a Nonlinear System][
  Find all equilibria and classify their local stability for the system:
  $ x' = x(1 - x - y) \ y' = y(1 - 2x - y / 2). $
]
#solution[
  *1. Equilibria:*
  Set $x' = 0$ and $y' = 0$:
  $ x(1 - x - y) = 0 \ y(1 - 2x - y/2) = 0 $

  Case A: $x=0$. Then $y(1-y/2)=0 => y=0$ or $y=2$. Points: $(0,0), (0,2)$.
  Case B: $x != 0$. Then $1-x-y=0 => y=1-x$.
  Substitute into the second equation: $y=0$ or $1-2x-(1-x)/2=0$.
  If $y=0$, then $x=1$, giving $(1,0)$.
  If $y != 0$, then $1 - 2x - 1/2 + x/2 = 0 => 1/2 - 3/2 x = 0 => x=1/3$.
  Then $y = 1 - 1/3 = 2/3$. Point: $(1/3, 2/3)$.

  The equilibria are $(0,0), (0,2), (1,0)$, and $(1/3, 2/3)$.

  *2. Jacobian Matrix:*
  $ f(x,y) = x - x^2 - x y \ g(x,y) = y - 2x y - y^2 / 2 $
  $ J(x,y) = mat(1 - 2x - y, -x; -2y, 1 - 2x - y). $

  *3. Classification:*
  - At $(0,0)$: $J(0,0) = mat(1, 0; 0, 1)$. Eigenvalues $lambda=1,1$. Unstable node.
  - At $(0,2)$: $J(0,2) = mat(-1, 0; -4, -1)$. Eigenvalues $lambda=-1,-1$. Stable node.
  - At $(1,0)$: $J(1,0) = mat(-1, -1; 0, -1)$. Eigenvalues $lambda=-1,-1$. Stable node.
  - At $(1/3, 2/3)$: $J(1/3, 2/3) = mat(-1/3, -1/3; -4/3, -1/3)$. 
    $ tau = -2/3, quad Delta = 1/9 - 4/9 = -1/3 < 0. $
    Since $Delta < 0$, it is a saddle point (unstable).
]

#solved_problem[The Nonlinear Pendulum][
  Analyze the undamped nonlinear pendulum equation $theta'' + sin theta = 0$.
]
#solution[
  Let $x = theta$ and $y = theta'$. We rewrite it as a first-order system:
  $ x' = y \ y' = -sin x $
  
  Equilibria: $y=0$ and $sin x = 0 => x = n pi$ for integer $n$.
  The points are $(n pi, 0)$.

  Jacobian:
  $ J(x,y) = mat(0, 1; -cos x, 0) $

  - At $x = 2k pi$ (downward positions):
    $ J(2k pi, 0) = mat(0, 1; -1, 0). $
    Eigenvalues are $plus.minus i$. Linearization yields a center. By incorporating the energy function (see next section), we can prove these are true nonlinear centers.

  - At $x = (2k+1)pi$ (upward positions):
    $ J((2k+1)pi, 0) = mat(0, 1; 1, 0). $
    Eigenvalues are $plus.minus 1$. These correspond to unstable saddle points.
]

=== Supplementary Problems

#supplementary[Equilibria Classification][
  Find and classify the equilibria for $x' = y, \ y' = x - x^3$.
]

#supplementary[Competing Species Model][
  Analyze the equilibria and draw the local phase portraits near them for:
  $ x' = x(2-x-y) \ y' = y(3-2x-y). $
]
