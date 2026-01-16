#import "../../utils.typ": *
== Lyapunov Exponents

=== Mathematical Review

*Lyapunov exponents* quantify the rate of separation of infinitesimally close trajectories. They provide a key indicator of chaos in dynamical systems.

#definition[Lyapunov Exponent (Continuous Time)][
  For a dynamical system $dot(x) = f(x)$, consider two trajectories starting at $x_0$ and $x_0 + delta_0$. The Lyapunov exponent $lambda$ is defined as:
  $ lambda = lim_(t -> infinity) lim_(abs(delta_0) -> 0) 1/t ln(abs(delta(t))/abs(delta_0)) $
  where $delta(t)$ is the separation vector at time $t$.
]

#definition[Lyapunov Exponent (Discrete Time)][
  For a map $x_(n+1) = f(x_n)$, the Lyapunov exponent is:
  $ lambda = lim_(n -> infinity) 1/n sum_(i=0)^(n-1) ln |f'(x_i)| $
]

#theorem[Interpretation of $lambda$][
  The sign of the maximum Lyapunov exponent $lambda_(max)$ determines the asymptotic behavior:
  - $lambda_(max) < 0$: Stable fixed point or periodic orbit (trajectories converge). See @stability_analysis.
  - $lambda_(max) = 0$: Marginally stable. This often characterizes *conservative systems* (which preserve phase space volume, e.g., energy-conserving mechanical systems).
  - $lambda_(max) > 0$: Unstable and chaotic (trajectories diverge exponentially). This extends the concept of instability introduced in Section 3.
]

=== Solved Problems

#solved_problem[Logistic Map][
  Calculate the Lyapunov exponent for the logistic map $x_(n+1) = r x_n (1 - x_n)$ at a fixed point $x^*$.
]
#solution[
  Step 1: Derivative of the map
  $f(x) = r x - r x^2$
  $f'(x) = r - 2r x = r(1 - 2x)$

  Step 2: Evaluate at non-trivial fixed point $x^* = 1 - 1/r$
  $f'(x^*) = r(1 - 2(1 - 1/r)) = r(1 - 2 + 2/r) = r(2/r - 1) = 2 - r$

  Step 3: Lyapunov exponent
  $lambda = ln |f'(x^*)| = ln |2 - r|$

  Step 4: Stability condition
  Stable ($lambda < 0$) if $|2 - r| < 1$, i.e., $1 < r < 3$.
]

#solved_problem[1D Linear System][
  Find the Lyapunov exponent for $dot(x) = a x$.
]
#solution[
  Step 1: General solution
  $x(t) = x_0 e^(a t)$

  Step 2: Separation of trajectories
  Consider start points $x_0$ and $x_0 + delta_0$.
  $delta(t) = (x_0 + delta_0)e^(a t) - x_0 e^(a t) = delta_0 e^(a t)$

  Step 3: Calculate limit
  $lambda = lim_(t -> infinity) 1/t ln |delta_0 e^(a t)|/|delta_0| = lim_(t -> infinity) 1/t (ln |e^(a t)|) = lim_(t -> infinity) 1/t (a t) = a$

  Result: The Lyapunov exponent is the real part of the eigenvalue $a$.
]

=== Supplementary Problems

#supplementary[Tent Map][
  Calculate the Lyapunov exponent for the tent map:
  $ f(x) = cases(2x "if" 0 <= x < 0.5, 2(1-x) "if" 0.5 <= x <= 1) $
]

#supplementary[Lorenz System][
  Discuss the Lyapunov spectrum of the Lorenz system in the chaotic regime ($sigma=10, rho=28, beta=8/3$). What does the sum of the exponents indicate?
]
