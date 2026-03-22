#import "../../../utils.typ": *
== Biological Vector Fields & Phase Portraits

=== Mathematical Review

This section visualizes the global behavior of 2D biological systems using phase portraits and vector fields. Unlike classical mechanics (e.g., the pendulum), biological variables (like populations, cell counts, or hormone concentrations) must remain non-negative.

#definition[Vector Fields in Biology][
  The system
  $ x' = f(x,y) \ y' = g(x,y) $
  assigns a vector $(f(x,y), g(x,y))$ to every point $(x,y)$ in the first quadrant $x >= 0, y >= 0$. 
  The collection of all these vectors forms the *vector field*. A solution curve $(x(t), y(t))$ plotted in the $x y$-plane is always tangent to the vector field.
]

#definition[Nullclines][
  Nullclines are the curves where the vector field is purely horizontal or purely verbal.
  - The $x$-nullcline is the set of points where $f(x,y) = 0$. Here, vectors point strictly up or down.
  - The $y$-nullcline is the set of points where $g(x,y) = 0$. Here, vectors point strictly left or right.
  
  Equilibrium points structurally only occur at the intersections of the $x$-nullcline and $y$-nullcline.
]

#definition[The FitzHugh-Nagumo Model][
  A classic simplification of the Hodgkin-Huxley neuron model. It describes the voltage $v$ (fast) and a recovery variable $w$ (slow):
  $ v' = v - v^3 / 3 - w + I_"ext" \ w' = epsilon (v + a - b w) $
  By analyzing the cubic $v$-nullcline and the linear $w$-nullcline, we can visually predict whether a neuron will rest, fire a single action potential, or burst continuously.
]

=== Solved Problems

#solved_problem[Lotka-Volterra Predator-Prey Phase Portrait][
  Consider the Lotka-Volterra equations for prey $x(t)$ and predators $y(t)$:
  $ x' = x(a - b y) \ y' = y(-c + d x) $
  where $a,b,c,d > 0$. Find the nullclines, locate the equilibria, and describe the vector field in each region of the first quadrant.
]
#solution[
  *1. Nullclines:*
  Set $x' = 0$: $x=0$ or $y = a/b$. These are the $x$-nullclines.
  Set $y' = 0$: $y=0$ or $x = c/d$. These are the $y$-nullclines.

  *2. Equilibria:*
  Intersection of nullclines gives two equilibria: $(0,0)$ and $(c/d, a/b)$.

  *3. Regional Vector Field Analysis:*
  The horizontal and vertical nullclines $x = c/d$ and $y = a/b$ divide the interior of the first quadrant into four distinct regions:
  - *Bottom-Left ($x < c/d, y < a/b$):* $x'>0$ and $y'<0$. Vectors point Right & Down.
  - *Bottom-Right ($x > c/d, y < a/b$):* $x'>0$ and $y'>0$. Vectors point Right & Up.
  - *Top-Right ($x > c/d, y > a/b$):* $x'<0$ and $y'>0$. Vectors point Left & Up.
  - *Top-Left ($x < c/d, y > a/b$):* $x'<0$ and $y'<0$. Vectors point Left & Down.

  Following the arrows continuously, the vector field forces trajectories to rotate counter-clockwise around the equilibrium $(c/d, a/b)$. Linearization shows this equilibrium is a true center in the nonlinear system, proving the existence of continuous population cycles.
]

=== Supplementary Problems

#supplementary[Competitive Exclusion Principle][
  Two species competing for the same limited resource can be modeled by:
  $ x' = r_1 x(1 - x - alpha y) \ y' = r_2 y(1 - y - beta x) $
  Sketch the nullclines for the case where $alpha > 1$ and $beta > 1$ (strong inter-species competition). Show visually that the interior equilibrium is a saddle point, leading to the clinical fact that one species will inevitably drive the other to extinction.
]
