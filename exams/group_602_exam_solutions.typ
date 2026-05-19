#import "exam_template.typ": *

#show: exam.with(
  title: "Solutions: Exam for Group 602",
  date: "",
  show_student_info: false
)

_Covering Mathematical Content from Chapters 5 to 8_

#question(title: "Nonlinear Phase Plane Analysis")[
  Consider the planar nonlinear system:
  $ x' &= -x + y^2 \
    y' &= -y - x^2 $
  1. Determine the algebraic equations for the $x$-nullcline and the $y$-nullcline.
  2. Find all equilibrium points in $RR^2$ algebraically.
]
#solution[
  *1. Nullcline Equations:*
  - *x-nullcline*: Set $x' = 0$, which gives $-x + y^2 = 0 => x = y^2$.
  - *y-nullcline*: Set $y' = 0$, which gives $-y - x^2 = 0 => y = -x^2$.

  *2. Equilibrium Points:*
  Equilibria are the intersections of the nullclines. Substituting $y = -x^2$ into $x = y^2$ yields:
  $ x = (-x^2)^2 = x^4. $
  $ x^4 - x = 0 quad => quad x(x^3 - 1) = 0. $
  The real solutions are $x = 0$ and $x = 1$.
  - For $x = 0$, we have $y = -(0)^2 = 0$. This gives the equilibrium $(0, 0)$.
  - For $x = 1$, we have $y = -(1)^2 = -1$. This gives the equilibrium $(1, -1)$.
  
  Therefore, the equilibrium points are $(0,0)$ and $(1,-1)$.
]

#question(title: "Lyapunov Direct Method")[
  Consider the same planar nonlinear system as in Question 1:
  $ x' &= -x + y^2 \
    y' &= -y - x^2 $
  We will analyze the stability of the origin $(0,0)$ using the Lyapunov direct method. Let the candidate Lyapunov function be:
  $ V(x, y) = 1/2 x^2 + 1/2 y^2 $
  1. Verify that $V(x, y)$ is positive definite.
  2. Compute the derivative $dot(V)(x,y)$ along the trajectories of the system.
  3. Based on your result for $dot(V)(x,y)$, what can you conclude about the stability of the origin? Is it locally or globally asymptotically stable? Justify your answer.
]
#solution[
  *1. Positive Definiteness:*
  We have $V(0,0) = 0$. For any $(x,y) != (0,0)$, either $x^2 > 0$ or $y^2 > 0$ (or both). Thus, $V(x,y) > 0$ for all $(x,y) != (0,0)$. Therefore, $V$ is positive definite.

  *2. Derivative Along Trajectories:*
  Using the chain rule:
  $ dot(V)(x,y) &= frac(partial V, partial x) x' + frac(partial V, partial y) y' \
  &= x(-x + y^2) + y(-y - x^2) \
  &= -x^2 + x y^2 - y^2 - x^2 y \
  &= -(x^2 + y^2) + x y (y - x). $
  So $dot(V)(x,y) = -x^2 - y^2 + x y^2 - x^2 y$.

  *3. Stability Conclusion:*
  Near the origin (for small $x$ and $y$), the quadratic terms $-(x^2 + y^2)$ dominate the cubic terms $x y^2 - x^2 y$. Specifically, we can bound the cubic terms in polar coordinates:
  $ dot(V)(r, theta) = -r^2 + r^3(cos theta sin^2 theta - cos^2 theta sin theta). $
  For small $r$, $dot(V) < 0$. Therefore, $dot(V)$ is locally negative definite near the origin. By the Lyapunov direct method, the origin is *locally asymptotically stable*.
  It is not globally asymptotically stable because there is another equilibrium at $(1,-1)$, which means trajectories starting near $(1,-1)$ will not converge to $(0,0)$.
]

#question(title: "Linearization and Jacobian Analysis")[
  Consider the nonlinear system:
  $ x' &= x(1 - x - y) \
    y' &= y(2 - y - 3x) $
  1. Verify that the point $(x^*, y^*) = (1/2, 1/2)$ is an equilibrium point of the system.
  2. Compute the general Jacobian matrix $J(x,y)$ for this system.
  3. Evaluate the Jacobian matrix at the equilibrium $(1/2, 1/2)$.
  4. Compute the trace and determinant of the evaluated Jacobian, and classify the local stability of the equilibrium using the Lyapunov Indirect Method.
]
#solution[
  *1. Verifying Equilibrium:*
  Substitute $x=1/2$, $y=1/2$ into the equations:
  $ x' = 1/2 (1 - 1/2 - 1/2) = 1/2 (0) = 0. $
  $ y' = 1/2 (2 - 1/2 - 3(1/2)) = 1/2 (2 - 2) = 0. $
  Thus, it is an equilibrium point.

  *2. General Jacobian Matrix:*
  Let $f(x,y) = x - x^2 - x y$ and $g(x,y) = 2y - y^2 - 3 x y$.
  $ f_x = 1 - 2x - y, quad f_y = -x $
  $ g_x = -3y, quad g_y = 2 - 2y - 3x $
  $ J(x,y) = mat(1 - 2x - y, -x; -3y, 2 - 2y - 3x). $

  *3. Jacobian at $(1/2, 1/2)$:*
  $ J(1/2, 1/2) = mat(1 - 1 - 1/2, -1/2; -3/2, 2 - 1 - 3/2) = mat(-1/2, -1/2; -3/2, -1/2). $

  *4. Trace, Determinant, and Classification:*
  $ tau = text("tr")(J) = -1/2 - 1/2 = -1. $
  $ Delta = det(J) = (-1/2)(-1/2) - (-1/2)(-3/2) = 1/4 - 3/4 = -2/4 = -1/2. $
  Since $Delta < 0$, the eigenvalues have opposite signs. Thus, the equilibrium $(1/2, 1/2)$ is a *saddle point*, which is *unstable*.
]

#question(title: "Time-Dependent Linear IVP")[
  Consider the time-dependent linear system
  $ x' = A(t)x, quad A(t) = mat(1, 0; 0, -t), quad x(0)=mat(1;1). $
  1. Write the two scalar differential equations for $x_1(t)$ and $x_2(t)$.
  2. Solve each scalar equation using the initial condition.
  3. Write the solution vector $x(t)$.
]
#solution[
  *1. Scalar Equations:*
  Since $A(t)$ is diagonal, the system decouples:
  $ x_1' = x_1, quad x_2' = -t x_2. $

  *2. Solving with Initial Data:*
  For the first equation,
  $ x_1(t) = c_1 e^t. $
  Since $x_1(0)=1$, we get $c_1=1$, so
  $ x_1(t)=e^t. $

  For the second equation,
  $ (d x_2)/x_2 = -t d t. $
  Integrating gives
  $ ln abs(x_2) = -t^2/2 + C, $
  so
  $ x_2(t)=c_2 e^(-t^2/2). $
  Since $x_2(0)=1$, we get $c_2=1$, so
  $ x_2(t)=e^(-t^2/2). $

  *3. Solution Vector:*
  Therefore,
  $ x(t)=mat(e^t; e^(-t^2/2)). $
]

#question(title: "Bifurcation Analysis")[
  Consider the parameterized nonlinear scalar equation:
  $ x' = mu x - x^3 $
  where $mu$ is a real bifurcation parameter.
  1. Find all equilibrium points $x^*$ as a function of the parameter $mu$.
  2. Use the first-derivative test to determine the local stability of each equilibrium branch.
  3. Identify the critical parameter value $mu_c$ where a bifurcation occurs. What type of bifurcation is this?
]
#solution[
  *1. Equilibrium Points:*
  Set $x' = 0$, giving $x(mu - x^2) = 0$.
  - $x^* = 0$ is an equilibrium for all $mu$.
  - If $mu > 0$, there are two additional equilibria: $x^* = plus.minus sqrt(mu)$.

  *2. First-Derivative Test:*
  Let $f(x, mu) = mu x - x^3$. Then $f_x(x, mu) = mu - 3x^2$.
  - Branch $x^* = 0$: $f_x(0, mu) = mu$. 
    For $mu < 0$, $f_x < 0$ (stable). For $mu > 0$, $f_x > 0$ (unstable).
  - Branches $x^* = plus.minus sqrt(mu)$ (when $mu > 0$): 
    $f_x(plus.minus sqrt(mu), mu) = mu - 3(plus.minus sqrt(mu))^2 = mu - 3mu = -2mu$. 
    Since $mu > 0$, $-2mu < 0$. Both of these branches are stable.

  *3. Bifurcation Type:*
  At the critical value $mu_c = 0$, the stable branch $x^* = 0$ loses stability and splits into two new stable branches. This is a *supercritical pitchfork bifurcation*.
]
