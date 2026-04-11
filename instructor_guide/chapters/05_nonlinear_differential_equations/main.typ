#import "../../../utils.typ": *

= Nonlinear Differential Equations

== First-Order Differential Equations

=== Supplementary Problems

#supplementary[Generalized Logistic Dynamics][
  For $x' = 0.8x(1-(x/5)^2)$, determine equilibria and classify their local stability.
]
#solution[
  *1. Equilibria:*
  Set $x' = 0$ to find the equilibria:
  $ 0.8x(1 - (x/5)^2) = 0. $
  The roots are $x^* = 0$, $x^* = 5$, and $x^* = -5$.

  *2. Stability Analysis via Derivative Test:*
  Let $f(x) = 0.8x - 0.032 x^3$. Compute the derivative:
  $ f'(x) = 0.8 - 0.096 x^2. $
  Evaluating at each equilibrium:
  - *At $x^* = 0$:* $f'(0) = 0.8 > 0$. Thus, $0$ is *unstable*.
  - *At $x^* = 5$:* $f'(5) = 0.8 - 0.096(25) = 0.8 - 2.4 = -1.6 < 0$. Thus, $5$ is *locally asymptotically stable*.
  - *At $x^* = -5$:* $f'(-5) = 0.8 - 0.096(25) = -1.6 < 0$. Thus, $-5$ is *locally asymptotically stable*.
]

#supplementary[Existence vs Uniqueness Conditions][
  For $x' = t^2 + x^2$, $x(0)=1$, identify a rectangle around $(0,1)$ where $f(t,x)$ is continuous and where $(partial f)/(partial x)$ is bounded, then state what each condition implies (existence and uniqueness).
]
#solution[
  *1. Rectangle Definition and Continuity:*
  Consider a rectangle $R = {(t,x) : |t| <= a, |x-1| <= b}$ for some $a, b > 0$. The function $f(t,x) = t^2 + x^2$ is a polynomial, thus it is continuous everywhere, including on $R$.
  - *Implication:* The continuity of $f$ guarantees *local existence* of at least one solution by Peano's Existence Theorem.

  *2. Boundedness of the Partial Derivative:*
  Compute $(partial f) / (partial x) = 2x$. On the rectangle $R$, the variable $x$ is bounded by $1-b <= x <= 1+b$. Therefore, the partial derivative is bounded by $|2x| <= 2(1+b) = L$.
  - *Implication:* The boundedness of the partial derivative means $f$ is locally Lipschitz continuous in $x$ on $R$ with Lipschitz constant $L$. This guarantees *local uniqueness* of the solution by the Picard-Lindelöf Theorem.
]

#supplementary[When Continuity Does Not Guarantee Uniqueness][
  Analyze $x' = sqrt(abs(x))$, $x(0)=0$. Check continuity and discuss why uniqueness fails at the initial point.
]
#solution[
  *1. Continuity Check:*
  The function $f(t,x) = sqrt(|x|)$ is continuous for all $x in RR$, including at $x=0$. Thus, local existence of a solution is guaranteed.

  *2. Failure of Lipschitz Condition:*
  If we compute the derivative, $(partial f)/(partial x) = plus.minus 1 / (2sqrt(|x|))$ for $x != 0$. As $x arrow 0$, the derivative approaches infinity. Because the derivative is unbounded in any neighborhood of $x=0$, $f(x)$ is not locally Lipschitz there.

  *3. Non-Unique Solutions:*
  Due to the failure of the Lipschitz condition, uniqueness can be lost. Indeed, two valid solutions starting from $(0,0)$ are:
  - $x_1(t) = 0$ for all $t$ (the trivial equilibrium).
  - $x_2(t) = t^2/4$ for $t > 0$, obtained by separable integration.
]

#supplementary[Parameter-Driven Bifurcation][
  Study $x' = lambda x - x^2$. Write the family as $x' = f_lambda (x)$, find equilibrium branches $x^*(lambda)$, and classify stability using the sign of $f'_lambda(x^*(lambda))$.
]
#solution[
  *1. Equilibrium Branches:*
  Set $f_lambda(x) = lambda x - x^2 = x(lambda - x) = 0$.
  The branches are $x_1^*(lambda) = 0$ and $x_2^*(lambda) = lambda$.

  *2. Derivative Test:*
  The derivative is $f'_lambda(x) = lambda - 2x$. We evaluate this on each branch:
  - *Branch $x_1^* = 0$:* $f'_lambda(0) = lambda$. 
    It is *stable* when $lambda < 0$ and *unstable* when $lambda > 0$.
  - *Branch $x_2^* = lambda$:* $f'_lambda(lambda) = lambda - 2lambda = -lambda$. 
    It is *unstable* when $lambda < 0$ and *stable* when $lambda > 0$.

  *3. Conclusion:*
  At $lambda=0$, the two branches intersect and exchange stability. This is the definition of a *transcritical bifurcation*.
]

#supplementary[Phase-Line Analysis][
  For the autonomous equation $x' = x(x-1)(x-4)$, identify equilibria, determine their stability, and sketch the phase line.
]
#solution[
  *1. Equilibria:*
  Set $f(x) = x(x-1)(x-4) = 0$. The critical points are $x^* = 0, 1, 4$.

  *2. Phase-Line Sign Test:*
  Evaluate the sign of $f(x)$ on the intervals separated by the equilibria:
  - For $x < 0$ (e.g., $x=-1$): $f(-1) = (-)(-)(-) = "negative"$. Arrows point *left*.
  - For $0 < x < 1$ (e.g., $x=0.5$): $f(0.5) = (+)(-)(-) = "positive"$. Arrows point *right*.
  - For $1 < x < 4$ (e.g., $x=2$): $f(2) = (+)(+)(-) = "negative"$. Arrows point *left*.
  - For $x > 4$ (e.g., $x=5$): $f(5) = (+)(+)(+) = "positive"$. Arrows point *right*.

  *3. Stability Classification:*
  - At $x^* = 0$, trajectories move away on both sides ($L/R$): *Unstable*.
  - At $x^* = 1$, trajectories approach on both sides ($R/L$): *Stable*.
  - At $x^* = 4$, trajectories move away on both sides ($L/R$): *Unstable*.
]

== Constant-Coefficient Linear Systems <sec:linear_systems>

=== Supplementary Problems

#supplementary[Unstable Node Classification][
  Classify the origin for
  $ A = mat(2,0;0,5). $
]
#solution[
  Because the matrix $A$ is diagonal, the eigenvalues are simply the diagonal entries: $lambda_1 = 2$ and $lambda_2 = 5$. 
  Since both eigenvalues are real, distinct, and strictly "positive" ($2 > 0$ and $5 > 0$), the origin is an *unstable node*.
]

#supplementary[Focus Type from Eigenvalues][
  For eigenvalues $lambda_(1,2)=0.4 plus.minus 3i$, classify the critical point at the origin.
]
#solution[
  The eigenvalues are a complex conjugate pair of the form $alpha plus.minus beta i$. 
  The real part determines growth or decay. Here, $alpha = 0.4 > 0$. 
  Because the real part is strictly "positive", the amplitude of the oscillations grows exponentially. Thus, the origin is an *unstable focus* (outward spiral).
]

#supplementary[Matrix Exponential with Repeated Eigenvalue][
  Compute $e^(A t)$ for
  $ A = mat(-1,1;0,-1) $
  and classify the origin.
]
#solution[
  *1. Matrix Decomposition:*
  Notice that $A$ has a repeated eigenvalue $lambda = -1$. We can separate $A$ into a multiple of the identity matrix and a nilpotent matrix:
  $ A = -I + N, quad "where" quad N = mat(0,1;0,0). $
  Since $N^2 = 0$, the power series for $e^(N t)$ truncates at the linear term: $e^(N t) = I + N t = mat(1,t;0,1)$.

  *2. Matrix Exponential Computation:*
  Because $-I$ and $N$ commute, $e^(A t) = e^(-I t) e^(N t)$:
  $ e^(A t) = e^(-t) mat(1,t;0,1) = mat(e^(-t), t e^(-t); 0, e^(-t)). $

  *3. Classification:*
  Since the single repeated eigenvalue is real and strictly "negative" ($lambda = -1 < 0$), the origin is an *asymptotically stable improper node*. All trajectories decay to zero as $t arrow infinity$.
]

#supplementary[Trace-Determinant Diagram Point][
  For
  $ A = mat(-2,3;-1,0), $
  compute $(tau, Delta, D)$ and classify the origin.
]
#solution[
  *1. Computations:*
  - *Trace:* $tau = text("tr")(A) = (-2) + 0 = -2$.
  - *Determinant:* $Delta = det(A) = (-2)(0) - (3)(-1) = 3$.
  - *Discriminant:* $D = tau^2 - 4Delta = (-2)^2 - 4(3) = 4 - 12 = -8$.

  *2. Classification:*
  We analyze the $(tau, Delta, D)$ parameters:
  - Because $Delta > 0$ and $D < 0$, the eigenvalues are complex conjugate pairs. 
  - Because $tau < 0$, the real part of the eigenvalues is "negative".
  - Thus, the origin is a *stable focus* (inward spiral).
]

#supplementary[Trajectory from Initial Data][
  For
  $ A = mat(-2,0;0,1), quad x(0)=mat(3;-2), $
  compute $x(t)$ and describe long-term behavior.
]
#solution[
  *1. Solution Computation:*
  Since $A$ is diagonal, the fundamental matrix exponential $e^(A t)$ is also diagonal:
  $ e^(A t) = mat(e^(-2t), 0; 0, e^t). $
  The specific solution is $x(t) = e^(A t) x(0)$:
  $ x(t) = mat(e^(-2t), 0; 0, e^t) mat(3; -2) = mat(3 e^(-2t); -2 e^t). $

  *2. Long-Term Behavior:*
  The system possesses eigenvalues $lambda_1 = -2$ and $lambda_2 = 1$ (opposite signs), meaning the origin is a *saddle point*. 
  As $t arrow infinity$, the first component $x_1(t) = 3e^(-2t) arrow 0$, and the second component $x_2(t) = -2e^t arrow -infinity$. The trajectory asymptotically approaches the "negative" vertical axis (the unstable manifold) and escapes to infinity, diverging from the origin.
]

== Time-Dependent Linear Systems

=== Supplementary Problems

#supplementary[Fundamental Matrix Computation][
  For
  $ A(t)=mat(2t,0;0,-3), $
  compute a fundamental matrix and verify invertibility.
]
#solution[
  *1. Computation:*
  Because $A(t)$ is diagonal, the system is decoupled into two scalar equations: $x_1' = 2t x_1$ and $x_2' = -3x_2$. Integrating each yields $x_1(t) = c_1 e^(t^2)$ and $x_2(t) = c_2 e^(-3t)$.
  Arranging these linearly independent solutions into columns gives a fundamental matrix:
  $ Phi(t) = mat(e^(t^2), 0; 0, e^(-3t)). $

  *2. Verification:*
  The determinant is $det(Phi(t)) = e^(t^2) e^(-3t) = e^(t^2 - 3t)$.
  Because the exponential function is never zero for any real input, $det(Phi(t)) != 0$ for all $t in RR$. Thus, the fundamental matrix is invertible everywhere.
]

#supplementary[Transition Matrix Practice][
  For
  $ A(t)=mat(0,0;0,t), $
  construct $Phi(t,s)$ explicitly.
]
#solution[
  *1. Fundamental Matrix:*
  The decoupled system $x_1' = 0$ and $x_2' = t x_2$ provides solutions $x_1(t) = c_1$ and $x_2(t) = c_2 e^(t^2/2)$. Thus,
  $ Phi(t) = mat(1, 0; 0, e^(t^2 / 2)). $

  *2. Transition Matrix:*
  By definition, the state transition matrix is $Phi(t,s) = Phi(t) Phi(s)^(-1)$. Evaluating this:
  $ Phi(t,s) = mat(1, 0; 0, e^(t^2 / 2)) mat(1, 0; 0, e^(-s^2 / 2)) = mat(1, 0; 0, e^((t^2 - s^2) / 2)). $
]

#supplementary[IVP with Time-Dependent Coefficients][
  Solve
  $ x' = A(t)x, quad A(t)=mat(1,0;0,-t), quad x(0)=mat(1;1). $
]
#solution[
  *1. Decoupling and Integration:*
  The matrix is diagonal, so the system separates completely:
  - $x_1' = x_1 => x_1(t) = c_1 e^t$.
  - $x_2' = -t x_2 => x_2(t) = c_2 e^(-t^2/2)$.

  *2. Applying Initial Conditions:*
  We require $x_1(0) = 1$ and $x_2(0) = 1$, generating $c_1 e^0 = 1 => c_1 = 1$, and $c_2 e^0 = 1 => c_2 = 1$.
  The full solution is therefore:
  $ x(t) = mat(e^t; e^(-t^2/2)). $
]

#supplementary[Variation of Constants Drill][
  Solve
  $ x' = A(t)x + r(t), $
  with
  $ A(t)=mat(0,0;0,-2), quad r(t)=mat(e^t;1), quad x(0)=mat(0;0). $
]
#solution[
  *1. Homogeneous Transition Matrix:*
  The diagonal matrix $A(t) = "diag"(0,-2)$ possesses a constant-coefficient transition matrix:
  $ Phi(t,s) = mat(1, 0; 0, e^(-2(t-s))). $

  *2. Variation of Constants Formula:*
  Since $x(0) = 0$, the general formula is $x(t) = integral_0^t Phi(t,s) r(s) dif s$:
  $ x(t) = integral_0^t mat(1, 0; 0, e^(-2(t-s))) mat(e^s; 1) dif s = integral_0^t mat(e^s; e^(-2(t-s))) dif s. $

  *3. Evaluation:*
  We evaluate the integrals component-wise:
  - $x_1(t) = integral_0^t e^s dif s = [e^s]_0^t = e^t - 1$.
  - $x_2(t) = integral_0^t e^(-2t + 2s) dif s = e^(-2t) [e^(2s)/2]_0^t = e^(-2t) ((e^(2t) - 1)/2) = (1 - e^(-2t))/2$.
  
  The full exact solution is:
  $ x(t) = mat(e^t - 1; (1 - e^(-2t)) / 2). $
]

#supplementary[Norm Bound Application][
  Assume
  $ norm(A(t))_2 <= 0.6 $ on $[0,t]$ and $norm(x(0))_2=4$.
  Derive an explicit upper bound for $norm(x(t))_2$.
]
#solution[
  By the norm-based growth bound property (a direct consequence of Grönwall's Inequality), any solution $x(t)$ to $x' = A(t)x$ complies with:
  $ norm(x(t))_2 <= norm(x(0))_2 exp(integral_0^t norm(A(s))_2 dif s). $
  We substitute the provided bound $norm(A(s))_2 <= 0.6$:
  $ integral_0^t norm(A(s))_2 dif s <= integral_0^t 0.6 dif s = 0.6 t. $
  Therefore, propagating the initial condition $norm(x(0))_2 = 4$:
  $ norm(x(t))_2 <= 4 e^(0.6 t). $
]

