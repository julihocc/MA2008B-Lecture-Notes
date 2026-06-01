#import "../exam_template.typ": *

#show: exam.with(
  title: "Solutions: Exam for Group 602",
  date: "",
  show_student_info: false
)

_Covering Sections 6.1, 7.1, 7.2, 5.3, and 8.1_

#question(title: "6.1 Directional Field Sign Analysis in a Cubic-Linear System")[
  Consider the planar nonlinear system:
  $ x' &= x - x^3 - y \ y' &= mu (x - y) $
  with parameter $mu > 0$.
  1. Compute the $x$-nullcline and $y$-nullcline equations.
  2. Determine all equilibrium points as functions of $mu$.
  3. Partition the phase plane using nullclines and determine the sign of $(x', y')$ in each region.
  4. State whether the first and third quadrants are forward invariant and justify your answer mathematically.
  *Hint:* Use nullcline intersections to form sign regions and test the vector field orientation on each boundary.
]
#solution[
  *1. Nullclines:*
  The $x$-nullcline is
  $ x - x^3 - y = 0 quad => quad y = x - x^3. $
  Since $mu>0$, the $y$-nullcline is
  $ mu(x-y)=0 quad => quad y=x. $

  *2. Equilibrium Points:*
  Intersections satisfy $x = x - x^3$, so $x^3=0$ and $x=0$. Then $y=x=0$.
  Thus the only equilibrium is $(0,0)$ for every $mu>0$.

  *3. Sign Regions:*
  The sign of $x'$ is determined by the position relative to the cubic nullcline:
  $ x' > 0 $ when $y < x - x^3$, and $x' < 0$ when $y > x - x^3$.
  The sign of $y'$ is determined by the position relative to the line $y=x$:
  $ y' > 0 $ when $y < x$, and $y' < 0$ when $y > x$.
  These two curves partition the plane into regions in which the signs of $(x',y')$ are read from the two inequalities.

  *4. Forward Invariance of Quadrants:*
  The first quadrant is not forward invariant: on the boundary $x=0$ with $y>0$, one has $x'=-y<0$, so the vector field points out of the first quadrant.
  The third quadrant is also not forward invariant: on the boundary $x=0$ with $y<0$, one has $x'=-y>0$, so the vector field points out of the third quadrant.
]

#solution_pagebreak()

#question(title: "7.1 Constructing a Weighted Quadratic Lyapunov Function")[
  Consider the linearized system $delta x' = J delta x$ with $delta x = (delta x_1, delta x_2)^T$.
  1. Propose a weighted quadratic candidate $V = p_1 (delta x_1)^2 + p_2 (delta x_2)^2$ with $p_1, p_2 > 0$.
  2. Compute $dot(V)$ explicitly in terms of the entries of $J$.
  3. Derive sufficient inequalities on $p_1, p_2$ that make $dot(V)$ negative definite.
  4. Interpret how changing $p_1/p_2$ changes the relative penalization of state deviations.
  *Hint:* Write $dot(V)$ as a quadratic form in $(delta G, delta I)$ and apply definiteness conditions.
]
#solution[
  Write
  $ J = mat(a,b;c,d), quad delta x = mat(u;v). $

  *1. Candidate:*
  A weighted quadratic candidate is
  $ V(u,v) = p_1 u^2 + p_2 v^2, quad p_1,p_2>0. $
  This is positive definite because both weights are positive.

  *2. Derivative:*
  Since $u' = a u + b v$ and $v' = c u + d v$,
  $ dot(V) &= 2p_1 u u' + 2p_2 v v' \
  &= 2p_1 a u^2 + 2(p_1 b + p_2 c) u v + 2p_2 d v^2. $
  Equivalently,
  $ dot(V) = mat(u,v) mat(2p_1 a, p_1 b + p_2 c; p_1 b + p_2 c, 2p_2 d) mat(u;v). $

  *3. Sufficient Inequalities:*
  A sufficient condition for negative definiteness is
  $ 2p_1 a < 0 $
  and
  $ (2p_1 a)(2p_2 d) - (p_1 b + p_2 c)^2 > 0. $
  Since $p_1,p_2>0$, the first condition requires $a<0$, and the determinant condition forces the quadratic form to be strictly negative in every nonzero direction.

  *4. Interpretation of the Weight Ratio:*
  The ratio $p_1/p_2$ changes how strongly deviations in the first coordinate are penalized relative to deviations in the second coordinate. It also changes the mixed term $p_1 b + p_2 c$; when possible, choosing the ratio to reduce or cancel this mixed term makes negative definiteness easier to verify.
]

#solution_pagebreak()

#question(title: "7.2 Indirect Method and Stability Classification")[
  Let the Jacobian at an equilibrium be
  $ J = mat(a, b; c, d). $
  1. Express the trace and determinant of $J$.
  2. Write the linear stability conditions in terms of $text("tr")(J)$ and $det(J)$.
  3. Classify the equilibrium type for each case: (i) $det(J) < 0$, (ii) $det(J) > 0$ and $text("tr")(J) < 0$, (iii) $det(J) > 0$ and $text("tr")(J) > 0$.
  4. Explain why linear asymptotic stability supports a local Lyapunov argument for the nonlinear model.
  *Hint:* Start with the characteristic polynomial $lambda^2 - text("tr")(J) lambda + det(J)=0$.
]
#solution[
  *1. Trace and Determinant:*
  $ text("tr")(J) = a+d, quad det(J) = a d - b c. $

  *2. Linear Stability Conditions:*
  The characteristic polynomial is
  $ lambda^2 - text("tr")(J) lambda + det(J)=0. $
  For a two-dimensional linearization, local asymptotic stability requires
  $ text("tr")(J)<0 quad "and" quad det(J)>0. $
  If $det(J)<0$, then the eigenvalues have opposite signs and the equilibrium is unstable.
  If $det(J)>0$ and $text("tr")(J)>0$, then both eigenvalues have positive real part and the equilibrium is unstable.

  *3. Requested Cases:*
  - If $det(J)<0$, the equilibrium is a saddle and is unstable.
  - If $det(J)>0$ and $text("tr")(J)<0$, the equilibrium is locally asymptotically stable. It is a stable node if the eigenvalues are real and a stable focus if they are complex.
  - If $det(J)>0$ and $text("tr")(J)>0$, the equilibrium is unstable. It is an unstable node if the eigenvalues are real and an unstable focus if they are complex.

  *4. Link to a Lyapunov Argument:*
  When the linearization is asymptotically stable, the Jacobian is Hurwitz. The Lyapunov equation then gives a positive-definite quadratic form $V(delta x)=delta x^T P delta x$ whose derivative is negative definite for the linearized system. For the nonlinear model, higher-order terms are dominated in a sufficiently small neighborhood, so the same quadratic function gives a local Lyapunov proof of asymptotic stability.
]

#solution_pagebreak()

#question(title: "5.3 IVP with Time-Dependent Coefficients")[
  Solve
  $ x' = A(t)x, quad A(t)=mat(1,0;0,-t), quad x(0)=mat(1;1). $
  1. Solve the scalar equation for $x_1(t)$ without using the initial condition.
  2. Solve the scalar equation for $x_2(t)$ without using the initial condition.
  3. Use the initial condition to determine the constants and write the solution vector $x(t)$.
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

#solution_pagebreak()

#question(title: "8.1 Trace-Determinant Hopf Detection")[
  Consider a planar parameterized system with Jacobian at equilibrium
  $ J(mu) = mat(a(mu), b(mu); c(mu), d(mu)). $
  1. Write $tau(mu) = text("tr")(J(mu))$ and $Delta(mu) = det(J(mu))$.
  2. State the algebraic Hopf conditions in terms of $tau(mu)$ and $Delta(mu)$.
  3. Explain why the transversality condition $d tau / d mu != 0$ at $mu = mu_c$ is required.
  4. Classify whether the equilibrium is locally stable or unstable for $tau < 0$ and $tau > 0$, assuming $Delta > 0$.
  *Hint:* For Hopf in 2D, enforce $Delta(mu_c) > 0$, $tau(mu_c)=0$, and sign-changing trace near $mu_c$.
]
#solution[
  *1. Trace and Determinant:*
  $ tau(mu) = a(mu) + d(mu), $
  and
  $ Delta(mu) = a(mu)d(mu) - b(mu)c(mu). $

  *2. Hopf Conditions:*
  In the trace-determinant plane, a Hopf bifurcation can occur at $mu=mu_c$ when
  $ tau(mu_c)=0, quad Delta(mu_c)>0, $
  and the eigenvalues are purely imaginary at the crossing. In the usual planar Hopf setting, this is paired with a local complex-conjugate pair crossing the imaginary axis.

  *3. Transversality:*
  The condition
  $ (d tau)/(d mu) (mu_c) != 0 $
  ensures that the real part of the eigenvalue pair actually crosses through zero as $mu$ passes through $mu_c$. Without this condition, the trace may only touch zero and turn back, so there may be no change in stability and no Hopf bifurcation.

  *4. Stability on Each Side:*
  For a complex conjugate pair, the real part is $tau/2$. Assuming $Delta>0$ and the relevant eigenvalues remain the crossing pair, the equilibrium is locally asymptotically stable when $tau<0$ and unstable when $tau>0$.
]
