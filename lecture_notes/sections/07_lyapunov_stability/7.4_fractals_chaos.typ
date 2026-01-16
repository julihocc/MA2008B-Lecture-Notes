#import "../../utils.typ": *
== Fractals and Chaos

=== Mathematical Review

*Chaos* describes irregular, unpredictable behavior in deterministic non-linear systems. *Fractals* are geometric objects with self-similarity that often characterize the structure of chaotic attractors (strange attractors).

#definition[Chaos][
  A dynamical system exhibits chaos if it has:
  1. Sensitive dependence on initial conditions (positive Lyapunov exponent).
  2. Topological mixing (trajectories explore the phase space).
  3. Dense periodic orbits.
]

#definition[Fractal Dimension (Box-Counting)][
  For a set $S$, cover it with boxes of size $epsilon$. Let $N(epsilon)$ be the minimum number of boxes needed. The box-counting dimension is:
  $ D_B = lim_(epsilon -> 0) (ln N(epsilon))/(ln(1/epsilon)) $
]

#definition[Strange Attractor][
  An attractor with a fractal structure. Trajectories on a strange attractor stay within a bounded region but never repeat and separate exponentially fast.
]

=== Solved Problems

#solved_problem[Cantor Set Dimension][
  Calculate the fractal dimension of the middle-thirds Cantor set.
]
#solution[
  Step 1: Construction process
  - Iteration 0: Segment $[0, 1]$ (Length 1, $N=1$)
  - Iteration 1: Remove middle third. Remaining: $[0, 1/3] union [2/3, 1]$ ($N=2$, scale $1/3$)
  - Iteration 2: Remove middle thirds again ($N=4$, scale $1/9$)
  - Iteration $k$: $N = 2^k$ intervals of length $epsilon = (1/3)^k$

  Step 2: Apply formula
  $ D_B = lim_(k -> infinity) (ln(2^k))/(ln(1/(1/3)^k)) = lim_(k -> infinity) (k ln 2)/(k ln 3) $
  $ D_B = (ln 2)/(ln 3) approx 0.6309 $

  Result: The dimension is non-integer, indicating a fractal.
]

#solved_problem[Lorenz Attractor][
  The Lorenz system is given by:
  $ dot(x) = sigma(y - x) $
  $ dot(y) = x(rho - z) - y $
  $ dot(z) = x y - beta z $
  Explain why the divergence of the flow indicates volume contraction ($sigma=10, beta=8/3$).
]
#solution[
  Step 1: Calculate divergence
  $ div(F) = (partial dot(x))/(partial x) + (partial dot(y))/(partial y) + (partial dot(z))/(partial z) $
  $ div(F) = -sigma - 1 - beta $

  Step 2: Substitute values
  $ div(F) = -10 - 1 - 8/3 = -13.67 $

  Step 3: Interpretation
  Since $div(F) < 0$, the volume in phase space contracts exponentially: $V(t) = V(0) e^(div(F) t)$.
  However, trajectories diverge (positive Lyapunov exponent). This implies the attractor must have zero volume but infinite length/surface within a bounded region -> Fractal structure (Strange Attractor).
]

=== Supplementary Problems

#supplementary[Koch Snowflake][
  Calculate the fractal dimension of the Koch snowflake curve constructed by repeatedly replacing the middle third of segments with an equilateral triangle.
]

#supplementary[Logistic Map Bifurcation][
  Describe the period-doubling route to chaos in the logistic map as parameter $r$ increases.
]
