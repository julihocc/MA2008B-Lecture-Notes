#import "../../../utils.typ": *
== Time-Dependent Linear Systems

=== Mathematical Review

This section generalizes the previous one from constant matrices to
$ x' = A(t) x, $
where $A(t)$ depends on time.
The main objects are the fundamental matrix and transition matrix, which provide explicit propagation formulas.

#definition[Linear Time-Dependent System][
  A linear time-dependent system is
  $ x'(t) = A(t) x(t), $
  where $A(t)$ is a continuous $n times n$ matrix-valued function.
]

#definition[Fundamental Matrix][
  A matrix $Phi(t)$ is a fundamental matrix for $x' = A(t)x$ if
  $ Phi'(t)=A(t)Phi(t) $
  and $det(Phi(t_0)) != 0$ for some $t_0$.

  Every solution can be written as $x(t)=Phi(t)c$.
]

#definition[Transition Matrix][
  The transition matrix from $s$ to $t$ is
  $ Phi(t,s)=Phi(t)Phi(s)^(-1). $
  It satisfies
  $ x(t)=Phi(t,s)x(s), quad Phi(t,t)=I. $
]

#theorem[Existence and Representation][
  If $A(t)$ is continuous on an interval, then for each initial condition
  $ x(t_0)=x_0 $
  there exists a unique solution, and it can be represented as
  $ x(t)=Phi(t,t_0)x_0. $
]

_Remark:_ While the rigorous proof relies on concepts like Picard iterations or the Peano-Baker series and is generally beyond our scope here, the representation $x(t) = Phi(t, t_0)x_0$ follows naturally by verifying that it satisfies both the initial condition and the differential equation.

#theorem[Variation of Constants][
  For the nonhomogeneous system
  $ x'(t)=A(t)x(t)+r(t), $
  a solution with $x(t_0)=x_0$ is
  $ x(t)=Phi(t,t_0)x_0 + integral_(t_0)^t Phi(t,s)r(s) dif s. $
]
#proof[
  Let
  $ x(t)=Phi(t,t_0)x_0 + integral_(t_0)^t Phi(t,s)r(s) dif s. $
  Differentiate using
  $ (partial Phi(t,s))/(partial t)=A(t)Phi(t,s) $
  and Leibniz rule:
  $ x'(t)=A(t)x(t)+r(t). $
  Also $x(t_0)=x_0$.
]

#definition[Vector and Induced Matrix Norms][
  A vector norm $norm(x)$ measures the "size" of a vector $x in RR^n$. Common norms include:
  - *1-norm* (Sum of magnitudes): $norm(x)_1 = sum_(i=1)^n |x_i|$
  - *2-norm* (Euclidean norm): $norm(x)_2 = sqrt(sum_(i=1)^n x_i^2)$
  - *$infinity$-norm* (Maximum magnitude): $norm(x)_infinity = max_(i) |x_i|$

  Any vector norm induces a corresponding *matrix norm* on an $n times n$ matrix $A$, defined as the maximum possible stretching of a vector:
  $ norm(A) = max_(x != 0) (norm(A x)) / (norm(x)). $
]

#proposition[Induced Matrix Norm Property][
  By definition, an induced matrix norm always satisfies the condition
  $ norm(A x) <= norm(A) norm(x). $
]
#proof[
  If $x=0$, both sides are 0 and the inequality holds trivially. If $x != 0$, by the definition of an induced norm, we have
  $ (norm(A x)) / (norm(x)) <= max_(x != 0) (norm(A x)) / (norm(x)) = norm(A). $
  Multiplying both sides by $norm(x)$ yields $norm(A x) <= norm(A) norm(x)$.
]

#theorem[Grönwall's Inequality][
  Let $u(t)$ and $v(t)$ be non-negative continuous functions on $[t_0, t_1]$. If a constant $C >= 0$ satisfies
  $ u(t) <= C + integral_(t_0)^t v(s)u(s) dif s $
  for all $t in [t_0, t_1]$, then
  $ u(t) <= C exp(integral_(t_0)^t v(s) dif s). $
]
#proof[
  Let $R(t) = C + integral_(t_0)^t v(s)u(s) dif s$. Then $u(t) <= R(t)$, and by the Fundamental Theorem of Calculus, $R'(t) = v(t)u(t)$. Since $v(t) >= 0$, we have $R'(t) <= v(t)R(t)$. Therefore,
  $ (R'(t))/R(t) <= v(t). $
  (If $C=0$, we add $epsilon > 0$ to $C$ and take $epsilon -> 0$ at the end to avoid division by zero). Integrating from $t_0$ to $t$ gives:
  $ ln(R(t)) - ln(R(t_0)) <= integral_(t_0)^t v(s) dif s. $
  Exponientiating both sides and using $R(t_0) = C$, we get $R(t) <= C exp(integral_(t_0)^t v(s) dif s)$. Since $u(t) <= R(t)$, the result follows.
]

#proposition[Norm-Based Growth Bound][
  If
  $ norm(A(t)) <= M $ on $[t_0,t]$, then every solution of
  $ x' = A(t)x $
  satisfies
  $ norm(x(t)) <= e^(M(t-t_0)) norm(x_0), $
  where $norm(dots.c)$ denotes any vector norm and its corresponding induced matrix norm.
]
#proof[
  Integrating the differential equation from $t_0$ to $t$ gives
  $ x(t) = x(t_0) + integral_(t_0)^t A(s)x(s) dif s. $
  Taking the norm of both sides and applying the triangle inequality for integrals and the induced matrix norm property, we obtain
  $ norm(x(t)) <= norm(x_0) + integral_(t_0)^t norm(A(s)) norm(x(s)) dif s. $
  Since $norm(A(s)) <= M$, it follows that
  $ norm(x(t)) <= norm(x_0) + integral_(t_0)^t M norm(x(s)) dif s. $
  Applying Grönwall's inequality yields
  $ norm(x(t)) <= norm(x_0) e^(integral_(t_0)^t M dif s) = norm(x_0) e^(M(t-t_0)). $
]

=== Solved Problems

#solved_problem[Fundamental Matrix for a Diagonal $A(t)$][
  Solve
  $ x' = A(t)x, quad A(t)=mat(t,0;0,-2), $
  and construct a fundamental matrix.
]
#solution[
  The system is decoupled:
  $ x'_1 = t x_1, quad x'_2 = -2 x_2. $
  Hence
  $ x_1(t)=c_1 e^(t^2/2), quad x_2(t)=c_2 e^(-2t). $

  A fundamental matrix is
  $ Phi(t)=mat(e^(t^2/2),0;0,e^(-2t)). $
  Since
  $ det(Phi(t))=e^(t^2/2-2t) != 0, $
  it is invertible for all $t$.
]

#solved_problem[Transition Matrix and IVP Solution][
  For the system above, solve the IVP
  $ x(0)=mat(2;-1) $
  using the transition matrix.
]
#solution[
  From the first solved problem,
  $ Phi(t)=mat(e^(t^2/2),0;0,e^(-2t)), quad Phi(0)=I. $
  Thus
  $ Phi(t,0)=Phi(t)Phi(0)^(-1)=Phi(t). $

  Therefore,
  $ x(t)=Phi(t,0)x(0)=mat(2e^(t^2/2);-e^(-2t)). $
]

#solved_problem[Variation of Constants with Input][
  Solve
  $ x' = A(t)x + r(t), $
  where
  $ A(t)=mat(0,0;0,-1), quad r(t)=mat(1;e^(-t)), quad x(0)=mat(0;0). $
]
#solution[
  A fundamental matrix for the homogeneous part is
  $ Phi(t)=mat(1,0;0,e^(-t)), quad Phi(t,s)=mat(1,0;0,e^(-(t-s))). $

  With $x(0)=0$,
  $ x(t)=integral_0^t Phi(t,s)r(s) dif s. $
  Hence
  $ x_1(t)=integral_0^t 1 dif s = t, $
  $ x_2(t)=integral_0^t e^(-(t-s))e^(-s) dif s = t e^(-t). $

  Therefore,
  $ x(t)=mat(t; t e^(-t)). $
]

#solved_problem[Norm Bound with Bounded $A(t)$][
  Suppose
  $ norm(A(t))_infinity <= 2 $ on $[0,t]$ and $norm(x(0))_infinity = 3$.
  Derive a bound for $norm(x(t))_infinity$.
]
#solution[
  By the growth bound,
  $ norm(x(t))_infinity <= e^(integral_0^t norm(A(s))_infinity dif s) norm(x(0))_infinity. $
  Since $norm(A(s))_infinity <= 2$,
  $ integral_0^t norm(A(s))_infinity dif s <= 2t. $
  Therefore,
  $ norm(x(t))_infinity <= 3 e^(2t). $
]

#solved_problem[Transition from a Nonzero Initial Time][
  Let
  $ A(t)=mat(1/t,0;0,-1), quad t>0. $
  Compute $Phi(t,1)$ and solve the IVP $x(1)=mat(3;2)$.
]
#solution[
  The equations are decoupled:
  $ x'_1=(1/t)x_1, quad x'_2=-x_2. $
  A convenient fundamental matrix is
  $ Phi(t)=mat(t,0;0,e^(-t)). $

  Then
  $ Phi(t,1)=Phi(t)Phi(1)^(-1)=mat(t,0;0,e^(1-t)). $
  Therefore
  $ x(t)=Phi(t,1)x(1)=mat(3t;2e^(1-t)). $
]

=== Supplementary Problems

#supplementary[Fundamental Matrix Computation][
  For
  $ A(t)=mat(2t,0;0,-3), $
  compute a fundamental matrix and verify invertibility.
]

#supplementary[Transition Matrix Practice][
  For
  $ A(t)=mat(0,0;0,t), $
  construct $Phi(t,s)$ explicitly.
]

#supplementary[IVP with Time-Dependent Coefficients][
  Solve
  $ x' = A(t)x, quad A(t)=mat(1,0;0,-t), quad x(0)=mat(1;1). $
]

#supplementary[Variation of Constants Drill][
  Solve
  $ x' = A(t)x + r(t), $
  with
  $ A(t)=mat(0,0;0,-2), quad r(t)=mat(e^t;1), quad x(0)=0. $
]

#supplementary[Norm Bound Application][
  Assume
  $ norm(A(t))_2 <= 0.6 $ on $[0,t]$ and $norm(x(0))_2=4$.
  Derive an explicit upper bound for $norm(x(t))_2$.
]
