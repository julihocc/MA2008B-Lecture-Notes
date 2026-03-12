#import "../../../utils.typ": *
== Additional Topics in Differential Equations

=== Mathematical Review

This section briefly covers several advanced topics that frequently arise in the analysis of dynamical systems and optimization: first integrals, periodic orbits, perturbation methods, and computational approaches.

#definition[First Integrals (Conserved Quantities)][
  A non-constant real-valued function $H(x,y)$ is a first integral (or constant of motion) for
  $ x' = f(x,y), quad y' = g(x,y) $
  if $H(x(t), y(t))$ is constant along every solution curve. This occurs if and only if
  $ (partial H) / (partial x) f(x,y) + (partial H) / (partial y) g(x,y) = 0. $
  Systems with a first integral are called conservative. Their phase portraits consist of level curves $H(x,y) = C$.
]

#definition[Periodic Orbits and Limit Cycles][
  A non-equilibrium solution $(x(t), y(t))$ is a periodic orbit if there exists $T>0$ such that
  $ (x(t+T), y(t+T)) = (x(t), y(t)) $ for all $t$.
  An isolated periodic orbit is called a limit cycle. Limit cycles only exist in nonlinear systems and represent stable or unstable oscillations.
]

#theorem[Poincaré-Bendixson Theorem (Conceptual)][
  In a 2D autonomous system, if a bounded region $D$ contains a positive semi-orbit and no equilibrium points, then the orbit must approach a periodic orbit (limit cycle) as $t -> infinity$. This guarantees the existence of periodic behavior in certain planar systems.
]

#definition[Perturbation Approaches][
  When a system is slightly altered, e.g., $x' = f(x) + epsilon g(x)$ for small $epsilon > 0$, perturbation methods seek approximate solutions of the form
  $ x(t, epsilon) = x_0(t) + epsilon x_1(t) + epsilon^2 x_2(t) + dots $
  The unperturbed solution $x_0(t)$ solves $x' = f(x)$, and subsequent linear equations are solved to find $x_1(t), x_2(t)$, etc.
]

#definition[Computational Methods][
  For differential equations without closed-form solutions, numerical methods approximate $x(t)$.
  - *Euler Method*: $x_(n+1) = x_n + h f(t_n, x_n)$. (Simple, first-order accuracy).
  - *Runge-Kutta Methods (e.g., RK4)*: A weighted average of slopes at the beginning, midpoint, and end of the step $h$. (Very accurate, fourth-order accuracy).
]

=== Solved Problems

#solved_problem[Finding a First Integral (Nonlinear Pendulum)][
  Show that the energy function $E(x,y) = 1/2 y^2 - cos x$ is a first integral for the undamped pendulum $x' = y, \ y' = -sin x$. Use this to explain why the origin is a true nonlinear center.
]
#solution[
  Compute the derivative of $E$ along trajectories:
  $ (dif)/(dif t) E(x(t),y(t)) = (partial E)/(partial x) x' + (partial E)/(partial y) y' = (sin x)(y) + (y)(-sin x) = 0. $
  Since $(dif E)/(dif t) = 0$, $E$ is constant along solutions. Hence, $E$ is a first integral.
  
  Near the origin $(0,0)$, $E(x,y) = 1/2 y^2 - (1 - 1/2 x^2 + dots) approx 1/2 (x^2+y^2) - 1$. The level curves $E = C$ near the origin are closed loops (circles/ellipses). Since solutions must stay on these closed level curves, the origin is a true center, surrounded by periodic orbits.
]

#solved_problem[Limit Cycle in Polar Coordinates][
  Show that the system $r' = r(1-r^2)$, $theta' = 1$ has a stable limit cycle.
]
#solution[
  The angular velocity is constant, $theta' = 1$, so trajectories continually rotate counterclockwise.
  For the radial component $r' = r(1-r^2)$:
  - If $0 < r < 1$, $1-r^2 > 0 => r' > 0$ (trajectories spiral outward).
  - If $r > 1$, $1-r^2 < 0 => r' < 0$ (trajectories spiral inward).
  - If $r = 1$, $r' = 0$ (the radius is constant).

  The circle $r(t)=1, theta(t)=t+theta_0$ is an isolated periodic orbit. Since nearby trajectories spiral toward it from both inside and outside, it is a stable limit cycle.
]

=== Supplementary Problems

#supplementary[Conserved Quantity for Predator-Prey][
  For the Lotka-Volterra equations $x' = x(a - b y), \ y' = y(-c + d x)$ (where parameters are positive), find a first integral by separating the variables $(dif y)/(dif x)$.
]

#supplementary[Regular Perturbation Expansion][
  Find the first two terms ($x_0(t)$ and $x_1(t)$) of the regular perturbation expansion for $x' = -x + epsilon x^2$ with $x(0) = 1$.
]

#supplementary[Euler Method Step][
  Perform two steps of the Euler method for $x' = x + t$ with initial condition $x(0)=1$ using a step size $h=0.1$.
]
