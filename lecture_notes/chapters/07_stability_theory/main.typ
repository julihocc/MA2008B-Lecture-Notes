#import "../../../utils.typ": *
= Stability Theory

This chapter covers Lyapunov's indirect and direct methods, with applications to proving local and global stability in metabolic glucose-insulin models.

*Learning objectives:*
- Construct Lyapunov candidates for planar metabolic models.
- Use matrix inequalities to verify local asymptotic stability.
- Apply invariant-set reasoning to estimate basins of attraction.
- Distinguish linearized stability conclusions from nonlinear global claims.

== Mathematical Stability Theory

=== Mathematical Review

A central question in the study of dynamical systems is not merely whether solutions exist, but whether they return to or remain near a reference state after a perturbation. Lyapunov's theory answers this question without solving the differential equation explicitly. The key insight is to construct an auxiliary scalar function $V(x)$—called a *Lyapunov function*—that acts as a generalized "energy": if this energy is always decreasing along trajectories, the system must be converging to its equilibrium.

We develop two complementary approaches. The *direct method* works with the nonlinear system itself and provides both local and global conclusions depending on whether the Lyapunov function is defined on a neighborhood or on the whole state space. The *indirect method* (or linearization) reduces the question to checking the eigenvalues of the Jacobian at the equilibrium, at the cost of yielding only local information.

_Primary source for the formal Lyapunov statements in this subsection:_ Khalil, H. K. (2002). Nonlinear Systems (3rd ed.). Prentice Hall. Ch. 4.

#theorem[Lyapunov Direct Method (Local Asymptotic Stability)][
  Let $x^*$ be an equilibrium point of $x' = f(x)$. If there exists a continuously differentiable scalar function $V(x)$ defined on a neighborhood $U$ of $x^*$ such that:
  1. $V(x^*) = 0$,
  2. $V(x) > 0$ for all $x in U$ with $x != x^*$,
  3. $dot(V)(x) < 0$ for all $x in U$ with $x != x^*$,
  then $x^*$ is locally asymptotically stable.
]
#proof[
  We establish the two conditions of local asymptotic stability separately.

  *Step 1: Lyapunov Stability (trajectories that start close, stay close).*
  Since $V$ is continuous and $V(x^*) = 0$, for any $epsilon > 0$ the sublevel set
  $ Omega_epsilon = {x in U : V(x) <= c_epsilon } $
  can be chosen to lie inside the ball $B(x^*, epsilon)$ by taking $c_epsilon$ sufficiently small. Because $dot(V)(x) < 0$ for $x != x^*$, the value $V(x(t))$ is strictly decreasing along any trajectory. Therefore, if $x(0) in Omega_epsilon$, then $V(x(t)) <= V(x(0)) <= c_epsilon$ for all $t >= 0$, meaning $x(t)$ never leaves $Omega_epsilon subset B(x^*, epsilon)$. This proves that $x^*$ is Lyapunov stable.

  *Step 2: Asymptotic Convergence (trajectories approach $x^*$).*
  Fix $x(0)$ sufficiently close to $x^*$ so that $x(t)$ remains in $U$ for all $t >= 0$ (guaranteed by Step 1). Since $V(x(t))$ is strictly decreasing and bounded below by $0$, it converges to a limit $L >= 0$.
  Suppose for contradiction that $L > 0$. Because the energy $V(x(t))$ never drops below $L$ and started at $V(x(0))$, the trajectory remains forever inside the set $K = { x in U : L <= V(x) <= V(x(0)) }$. Since $V(x^*) = 0$, the set $K$ does not contain the equilibrium $x^*$; it is bounding the trajectory away from the equilibrium.

  Because $K$ is closed and bounded (a compact set), and $dot(V)$ is continuous, the Extreme Value Theorem guarantees that $dot(V)$ achieves a maximum value on $K$. Since $dot(V) < 0$ everywhere on $K$, this maximum must be some strictly negative number, say $-gamma$ (with $gamma > 0$). This means the system is losing energy at a constant minimum rate: $dot(V)(x(t)) <= -gamma$ for all $t >= 0$.

  Integrating this rate of energy loss gives $V(x(t)) <= V(x(0)) - gamma t$. Because $gamma > 0$, as $t arrow.r infinity$, the total energy $V(x(t))$ is forced to become negative. This is impossible because the Lyapunov function satisfies $V(x) >= 0$ everywhere. This contradiction implies that our assumption $L > 0$ must be false, so $L = 0$.
  Since $V(x) = 0$ only at $x = x^*$, it follows that $x(t) arrow.r x^*$ as $t arrow.r infinity$.
]

#theorem[Lyapunov Direct Method (Global Asymptotic Stability)][
  Let $x^*$ be an equilibrium point of $x' = f(x)$. If there exists a continuously differentiable scalar function $V(x)$ defined on all of the state space such that:
  1. $V(x^*) = 0$,
  2. $V(x) > 0$ for all $x != x^*$,
  3. $dot(V)(x) < 0$ for all $x != x^*$,
  4. Radial unboundedness: $V(x) arrow.r infinity$ as $norm(x) arrow.r infinity$,
  then $x^*$ is globally asymptotically stable.
]
#proof[
  We again establish Lyapunov stability and then asymptotic convergence, now globally.

  *Step 1: Global Lyapunov Stability (trajectories are globally bounded).*
  First, we establish that for any constant $c > 0$, the sublevel set
  $ Omega_c = {x : V(x) <= c} $
  is a bounded set. To see why, suppose for contradiction that $Omega_c$ was unbounded. This would mean it contains points $x$ arbitrarily far from the origin ($norm(x) arrow.r infinity$). However, the radial unboundedness property requires that as $norm(x) arrow.r infinity$, the value of $V(x)$ must also grow to infinity, meaning $V(x)$ will eventually strictly exceed $c$. This contradicts the definition of $Omega_c$, which requires $V(x) <= c$. Therefore, $Omega_c$ cannot extend to infinity and must be bound within some finite radius. Since $V$ is continuous, $Omega_c$ is also closed, making it a compact set.

  Since $dot(V)(x) < 0$ for $x != x^*$, the energy function $V(x(t))$ is strictly decreasing along every trajectory. Therefore, any trajectory starting at an initial state $x(0)$ satisfies $V(x(t)) <= V(x(0))$ for all $t >= 0$. This implies the trajectory can never escape the compact sublevel set $Omega_{V(x(0))}$. Because $x(0)$ was arbitrary and its corresponding sublevel set is always bounded, every trajectory in the system is bounded. This establishes global Lyapunov stability.

  *Step 2: Global Asymptotic Convergence.*
  Since $V(x(t))$ is strictly decreasing and bounded below by $0$, it converges to a limit $L >= 0$.
  Suppose for contradiction that $L > 0$. Because the energy $V(x(t))$ never drops below $L$ and started at $V(x(0))$, the trajectory remains forever inside the set $K = { x : L <= V(x) <= V(x(0)) }$. Since $V(x^*) = 0$, the set $K$ does not contain the equilibrium $x^*$; it is bounding the trajectory away from the equilibrium.

  Because $K$ is closed and bounded (a compact set), and $dot(V)$ is continuous, the Extreme Value Theorem guarantees that $dot(V)$ achieves a maximum value on $K$. Since $dot(V) < 0$ everywhere on $K$, this maximum must be some strictly negative number, say $-gamma$ (with $gamma > 0$). This means the system is losing energy at a constant minimum rate: $dot(V)(x(t)) <= -gamma$ for all $t >= 0$.

  Integrating this rate of energy loss gives $V(x(t)) <= V(x(0)) - gamma t$. Because $gamma > 0$, as $t arrow.r infinity$, the total energy $V(x(t))$ is forced to become negative, leading to a contradiction.
  Therefore $L = 0$. Since $V(x) = 0$ only at $x = x^*$, we conclude $x(t) arrow.r x^*$ for every starting point $x(0)$, which is global asymptotic stability.

  _Remark:_ Notice that Step 2 (the contradiction argument) is mechanically identical to the local proof. The profound difference between the theorems lies entirely in Step 1: how we guarantee the trajectory stays trapped so that the Extreme Value Theorem can be applied. In the local proof, we trap the trajectory by forcing the initial state $x(0)$ to start strictly inside a tiny, carefully chosen safe bubble near the origin. In the global proof, we trap the trajectory by requiring *radial unboundedness*. This powerful condition mathematically forces every single energy level to act as an inescapable, bounded bowl, ensuring trajectories can never slide away to infinity.
]

#definition[Quadratic Lyapunov Function for Linear Systems][
  For the linear system $x' = A x$, a standard candidate is the quadratic form:
  $ V(x) = x^T P x, $
  where $P$ is a symmetric positive-definite matrix ($P = P^T > 0$). Along trajectories, the time derivative is:
  $ dot(V)(x) = x^T (A^T P + P A) x. $
  If we can find $P$ such that $A^T P + P A = -Q$ for some symmetric positive-definite matrix $Q$, then $dot(V)(x) = -x^T Q x < 0$ (for $x != 0$), and the origin is globally asymptotically stable.
]

#definition[Hurwitz Matrix][
  A square matrix $A$ is called *Hurwitz* (or *stable*) if all of its eigenvalues have strictly negative real part:
  $ text("Re")(lambda_i) < 0 quad forall i. $
  Equivalently, every solution to the linear system $x' = A x$ decays exponentially to zero.
]

#lemma[Lyapunov Equation Solvability]
[
  Let $A$ be a Hurwitz matrix. Then for any symmetric positive-definite matrix $Q > 0$, there exists a unique symmetric positive-definite matrix $P > 0$ satisfying the continuous *Lyapunov equation*:
  $ A^T P + P A = -Q. $
  The solution is given explicitly by $P = integral_0^infinity e^(A^T t) Q e^(A t) thin d t$, which converges precisely because $A$ is Hurwitz.
]
#proof[
  *Step 1: Convergence of the integral.*
  Since $A$ is Hurwitz, all eigenvalues satisfy $text("Re")(lambda_i) < 0$. This guarantees that the matrix exponential decays exponentially:
  $ norm(e^(A t)) <= C e^(-alpha t) quad forall t >= 0, $
  for some constants $C > 0$ and $alpha > 0$ (where $alpha < min_i |text("Re")(lambda_i)|$). Therefore the integrand satisfies:
  $ norm(e^(A^T t) Q e^(A t)) <= C^2 norm(Q) e^(-2 alpha t), $
  and since $integral_0^infinity e^(-2 alpha t) d t = 1/(2 alpha) < infinity$, the integral defining $P$ converges absolutely.

  *Step 2: $P$ satisfies the Lyapunov equation.*
  Define $P = integral_0^infinity e^(A^T t) Q e^(A t) thin d t$. We verify it solves $A^T P + P A = -Q$ by computing directly:
  $ A^T P + P A &= integral_0^infinity (A^T e^(A^T t) Q e^(A t) + e^(A^T t) Q e^(A t) A) thin d t \
  &= integral_0^infinity frac(d, d t) (e^(A^T t) Q e^(A t)) thin d t \
  &= [e^(A^T t) Q e^(A t)]_0^infinity \
  &= lim_(t arrow.r infinity) e^(A^T t) Q e^(A t) - e^0 Q e^0. $
  Since $A$ is Hurwitz, the matrix exponential $e^(A t) arrow.r 0$ as $t arrow.r infinity$, so the limit term vanishes. Therefore:
  $ A^T P + P A = 0 - Q = -Q. $

  *Step 3: $P$ is symmetric and positive-definite.*
  Symmetry follows directly from the formula: $(e^(A^T t) Q e^(A t))^T = e^(A^T t) Q^T e^(A t) = e^(A^T t) Q e^(A t)$ since $Q$ is symmetric. For positive-definiteness, take any nonzero vector $v$:
  $ v^T P v = integral_0^infinity v^T e^(A^T t) Q e^(A t) v thin d t = integral_0^infinity (e^(A t) v)^T Q (e^(A t) v) thin d t > 0, $
  since $Q > 0$ and $e^(A t) v != 0$ for all finite $t$ (as $e^(A t)$ is invertible).

  *Step 4: Uniqueness.*
  Suppose $P_1$ and $P_2$ both satisfy $A^T P + P A = -Q$. Then $D = P_1 - P_2$ satisfies $A^T D + D A = 0$. Multiplying on the left by $e^(A^T t)$ and on the right by $e^(A t)$ and integrating:
  $ integral_0^T frac(d, d t)(e^(A^T t) D e^(A t)) thin d t = 0 quad ==> quad e^(A^T T) D e^(A T) = D. $
  Taking $T arrow.r infinity$, the left side tends to $0$ since $A$ is Hurwitz, giving $D = 0$, hence $P_1 = P_2$.
]

#theorem[Lyapunov Indirect Method (Linearization)][
  Consider an equilibrium $x^*$ of a nonlinear system $x' = f(x)$ with Jacobian matrix $J(x^*)$.
  - If all eigenvalues of $J(x^*)$ satisfy $text("Re")(lambda_i) < 0$, then $x^*$ is locally asymptotically stable.
  - If at least one eigenvalue satisfies $text("Re")(lambda_i) > 0$, then $x^*$ is unstable.
]
#proof[
  *Perturbation decomposition:* To analyze behavior near the equilibrium, we study deviations from $x^*$ by introducing the perturbation variable $delta x = x - x^*$. Because $x^*$ is a constant equilibrium, the time derivative of the perturbation coincides with the derivative of the state:
  $ frac(text("d"), text("d") t) (delta x) = frac(text("d") x, text("d") t) = f(x). $
  This change of variables focuses the analysis on how disturbances away from equilibrium evolve.

  *Taylor expansion around equilibrium:* Applying a Taylor expansion to $f(x)$ around the equilibrium point $x^*$ gives:
  $ f(x) = f(x^*) + J(x^*) (x - x^*) + g(x - x^*). $
  Since $x^*$ is an equilibrium, $f(x^*) = 0$. Letting $A = J(x^*)$, the nonlinear dynamics expressed in terms of the perturbation become:
  $ frac(text("d"), text("d") t) (delta x) = A delta x + g(delta x), $
  where the remainder $g(delta x)$ satisfies $lim_(norm(delta x) arrow.r 0) (norm(g(delta x)))/(norm(delta x)) = 0$, meaning the non-linearities are genuinely higher-order near the origin.

  *Case 1: all eigenvalues satisfy $text("Re")(lambda_i) < 0$ (local asymptotic stability).*
  By assumption, $A = J(x^*)$ is Hurwitz (Definition above). By the Lyapunov Equation Solvability Lemma, for any symmetric positive-definite $Q$ there exists a unique symmetric positive-definite $P$ satisfying $A^T P + P A = -Q$.
  Using $V(delta x) = delta x^T P delta x$ as our candidate, the time derivative along trajectories of the full nonlinear system is:
  $ dot(V)(delta x) &= delta x^T (A^T P + P A) delta x + 2 delta x^T P g(delta x) \
  &= -delta x^T Q delta x + 2 delta x^T P g(delta x). $
  Let $lambda_min(Q) > 0$ denote the smallest eigenvalue of $Q$ and $norm(P)$ the induced matrix norm of $P$. Then:
  $ dot(V)(delta x) <= -lambda_min(Q) norm(delta x)^2 + 2 norm(P) norm(g(delta x)) norm(delta x). $
  Since $norm(g(delta x)) = o(norm(delta x))$, for any $epsilon > 0$ there exists $delta > 0$ such that $norm(g(delta x)) <= epsilon norm(delta x)$ whenever $norm(delta x) < delta$. Choosing $epsilon = lambda_min(Q) \/ (4 norm(P))$ gives:
  $ dot(V)(delta x) <= -frac(lambda_min(Q), 2) norm(delta x)^2 < 0 quad text("for all ") delta x != 0 text(" with ") norm(delta x) < delta. $
  By the Local Asymptotic Stability theorem of the Direct Method, $x^*$ is locally asymptotically stable.

  *Case 2: at least one eigenvalue satisfies $text("Re")(lambda_j) > 0$ (instability).*
  Let $alpha = text("Re")(lambda_j) > 0$ and let $v_j$ be the corresponding (possibly complex) eigenvector of $A$. Consider initial conditions of the form $delta x(0) = s dot Re(v_j)$ for small $s > 0$. For the *linearized* system $delta x' = A delta x$, the solution component along $Re(v_j)$ grows at least as fast as $e^(alpha t)$, so $norm(delta x_"lin"(t)) >= s e^(alpha t) norm(Re(v_j))$.
  For the full nonlinear system, we apply Grönwall's inequality to the error $e(t) = delta x(t) - delta x_"lin"(t)$, which satisfies $e' = A e + g(delta x)$. Since $norm(g(delta x)) <= C norm(delta x)^2$ near the origin, the error remains $o(e^(alpha t))$ for small $s$. Therefore, for sufficiently small $s$:
  $ norm(delta x(t)) >= frac(s, 2) e^(alpha t) norm(Re(v_j)) arrow.r infinity. $
  Since initial conditions with arbitrarily small $s > 0$ produce trajectories that grow away from $x^*$, the equilibrium is unstable.
]

=== Solved Problems

#solved_problem[Verifying Negative Definiteness via Quadratic Lyapunov Function][
  Consider a nonlinear system linearized near an equilibrium, yielding the Jacobian:
  $ J = mat(-3, 1; -2, -4). $
  Use the quadratic Lyapunov candidate obtained by choosing $P = I$:
  $ V(delta x) = delta x^T delta x = norm(delta x)^2. $
  1. Briefly explain why $P = I$ is a natural first choice.
  2. Compute $dot(V)$ for the linearized system.
  3. Verify that $dot(V) < 0$ for all $delta x != 0$ and conclude that the equilibrium is locally asymptotically stable.
]
#solution[
  *1. Why is $P = I$ a natural first choice?*
  For a linear system, the standard quadratic Lyapunov candidate is
  $ V(delta x) = delta x^T P delta x, quad P = P^T > 0. $
  Choosing $P = I$ gives the squared Euclidean distance to the equilibrium,
  $ V(delta x) = delta x^T I delta x = delta x^T delta x = norm(delta x)^2, $
  which is the simplest positive-definite candidate. If this choice already yields $dot(V) < 0$, no more elaborate search for $P$ is needed.

  *2. Compute $dot(V)$ for the linearized system.*
  The linearized dynamics are $delta x' = J delta x$. Using the chain rule,
  $ dot(V)(delta x) = (delta x')^T delta x + delta x^T delta x'. $
  Substituting $delta x' = J delta x$ gives
  $ dot(V)(delta x) = delta x^T J^T delta x + delta x^T J delta x = delta x^T (J^T + J) delta x. $

  We first compute the symmetric part $J^T + J$:
  $ J^T = mat(-3, -2; 1, -4), $
  so:
  $ J^T + J = mat(-3, -2; 1, -4) + mat(-3, 1; -2, -4) = mat(-6, -1; -1, -8). $

  *3. Verify that $dot(V) < 0$ and conclude stability.*
  To prove $dot(V) < 0$ for all $delta x != 0$, it is enough to show that the symmetric matrix
  $ Q = J^T + J = mat(-6, -1; -1, -8) $
  is negative definite. For a $2 times 2$ symmetric matrix, Sylvester's criterion gives:
  $ D_1 = -6 < 0, quad D_2 = det(Q) = (-6)(-8) - (-1)(-1) = 47 > 0. $
  Hence $Q$ is negative definite, so
  $ dot(V)(delta x) = delta x^T (J^T + J) delta x < 0 quad text("for all ") delta x != 0. $
  Therefore, for the linearized system, the origin is asymptotically stable by the Lyapunov direct argument.

  _Remark:_ The eigenvalues of $J$ are the roots of $lambda^2 + 7 lambda + 14 = 0$, namely
  $ lambda = frac(-7 plus.minus i sqrt(7), 2), $
  both with real part $-3.5 < 0$. This is consistent with the indirect method, so the original nonlinear system is locally asymptotically stable near the equilibrium.
]

#solved_problem[Global Asymptotic Stability via the Direct Method][
  Consider the nonlinear planar system:
  $ x'_1 = -x_1 + x_2 \
    x'_2 = -x_1 - x_2^3 $
  Show that the origin is globally asymptotically stable by proposing the candidate Lyapunov function $V(x_1, x_2) = 1/2 x_1^2 + 1/2 x_2^2$.
]
#solution[
  *Step 1: Check equilibrium and properties of $V$.*
  The origin $(0,0)$ is an equilibrium since $f(0,0) = (0,0)$.
  The function $V(x_1, x_2)$ is positive definite ($V(0,0)=0$ and $V > 0$ for $x != 0$).
  Furthermore, $V(x_1, x_2) arrow.r infinity$ as $norm(x) arrow.r infinity$, meaning it is radially unbounded. This satisfies the prerequisites for the Global Direct Method.

  *Step 2: Compute $dot(V)$.*
  $ dot(V) &= frac(partial V, partial x_1) x'_1 + frac(partial V, partial x_2) x'_2 \
  &= x_1 (-x_1 + x_2) + x_2 (-x_1 - x_2^3) \
  &= -x_1^2 + x_1 x_2 - x_1 x_2 - x_2^4 \
  &= -x_1^2 - x_2^4 $

  *Step 3: Conclude.*
  Since $dot(V) = -x_1^2 - x_2^4 < 0$ for all $(x_1, x_2) != (0,0)$, the derivative is strictly negative everywhere except at the equilibrium. Because $V$ is radially unbounded, the origin is globally asymptotically stable.
]

#solved_problem[Inconclusive Linearization (The Center Problem)][
  Consider the two slightly different 1D nonlinear systems:
  $ text("System A: ") x' = -x^3 \
    text("System B: ") x' = x^3 $
  Apply the Lyapunov Indirect Method (Linearization) to the origin for both systems. Does it provide a conclusion? If not, use the Direct Method to determine stability.
]
#solution[
  *Step 1: Apply the Indirect Method.*
  For both systems, the origin $x^* = 0$ is an equilibrium.
  The Jacobian (which is just the 1D derivative) evaluated at the origin is:
  $ J_A = text("d")/(text("d")x) (-x^3) |_0 = -3(0)^2 = 0 \
    J_B = text("d")/(text("d")x) (x^3) |_0 = 3(0)^2 = 0 $
  In both cases, the single eigenvalue is $lambda = 0$. Since $text("Re")(lambda) = 0$, it is neither strictly negative nor strictly positive. The Indirect Method is inconclusive.

  *Step 2: Apply the Direct Method.*
  Propose the candidate $V(x) = 1/2 x^2$, which is positive definite.
  - For System A: $dot(V) = x(-x^3) = -x^4 < 0$ for $x != 0$. Thus, System A is asymptotically stable.
  - For System B: $dot(V) = x(x^3) = x^4 > 0$ for $x != 0$. The energy is strictly increasing, so System B is unstable.
  
  _Remark:_ This highlights why the Indirect Method relies upon strictly non-zero real parts: when $text("Re")(lambda)=0$, the linear terms vanish and the higher-order nonlinear terms (which the Indirect Method ignores) completely dictate stability.
]

=== Supplementary Problems

#supplementary[Constructing a Weighted Quadratic Lyapunov Function][
  Consider the linearized system $delta x' = J delta x$ with $delta x = (delta x_1, delta x_2)^T$.
  1. Propose a weighted quadratic candidate $V = p_1 (delta x_1)^2 + p_2 (delta x_2)^2$ with $p_1, p_2 > 0$.
  2. Compute $dot(V)$ explicitly in terms of the entries of $J$.
  3. Derive sufficient inequalities on $p_1, p_2$ that make $dot(V)$ negative definite.
  4. Interpret how changing $p_1/p_2$ changes the relative penalization of state deviations.
  *Hint:* Write $dot(V)$ as a quadratic form in $(delta G, delta I)$ and apply definiteness conditions.
]

#supplementary[Invariant Level Sets and Basins of Attraction][
  For a nonlinear planar system $x' = f(x)$ with equilibrium $x^*$ and Lyapunov function $V(x)$:
  1. Define the sublevel set $Omega_c = {x in RR^2 : V(x) <= c}$.
  2. State conditions under which $Omega_c$ is positively invariant.
  3. Explain how invariant sublevel sets provide inner estimates of the basin of attraction of $x^*$.
  4. Apply this reasoning qualitatively to a nonlinear planar model near a stable equilibrium.
  *Hint:* Use $dot(V) <= 0$ on $Omega_c$ to show trajectories cannot cross outward through the boundary.
]

#supplementary[Indirect Method and Stability Classification][
  Let the Jacobian at an equilibrium be
  $ J = mat(a, b; c, d). $
  1. Express the trace and determinant of $J$.
  2. Write the linear stability conditions in terms of $text("tr")(J)$ and $det(J)$.
  3. Classify the equilibrium type for each case: (i) $det(J) < 0$, (ii) $det(J) > 0$ and $text("tr")(J) < 0$, (iii) $det(J) > 0$ and $text("tr")(J) > 0$.
  4. Explain why linear asymptotic stability supports a local Lyapunov argument for the nonlinear model.
  *Hint:* Start with the characteristic polynomial $lambda^2 - text("tr")(J) lambda + det(J)=0$.
]

#supplementary[Lyapunov Equation for a $2 times 2$ Stable Matrix][
  Let $A = mat(-2, 1; -3, -4)$ and choose $Q = I$.
  1. Solve the continuous Lyapunov equation $A^T P + P A = -Q$ for the symmetric matrix $P$.
  2. Verify that $P$ is positive definite.
  3. Conclude asymptotic stability of the origin for $x' = A x$ using $V(x)=x^T P x$.
  *Hint:* Parameterize $P = mat(p_1, p_2; p_2, p_3)$ and solve the resulting linear system.
]

#supplementary[Exponential Decay Bound from a Quadratic Lyapunov Function][
  Suppose for a nonlinear system there exists $V(x)$ and constants $m_1, m_2, alpha > 0$ such that
  $ m_1 norm(x)^2 <= V(x) <= m_2 norm(x)^2 $
  and
  $ dot(V)(x) <= - alpha norm(x)^2 $
  in a neighborhood of the origin.
  1. Show that $V(t) <= V(0) e^(-(alpha/m_2) t)$.
  2. Derive an exponential norm estimate for $norm(x(t))$ in terms of $norm(x(0))$.
  3. Interpret the result as a quantitative stability statement.
  *Hint:* Convert the inequality for $dot(V)$ into a scalar differential inequality in $V(t)$.
]

== Biomathematical Stability in Glucose-Insulin Dynamics

The abstract tools developed in the previous section—Lyapunov functions, the Lyapunov equation, and the linearization theorem—are now brought to bear on a concrete physiological problem: the regulation of blood glucose and insulin. In these models, the equilibria of interest correspond to clinically meaningful metabolic states: a *healthy equilibrium* (normoglycemia) that should be stable, and a *pathological equilibrium* (chronic hyperglycemia) whose stability signals disease progression.

Wherever the Lyapunov candidate $V$ satisfies $dot(V) < 0$ only on a subset (rather than everywhere away from equilibrium), we employ LaSalle's Invariance Principle—stated below—which extends the convergence conclusion to the semi-definite case.

=== Mathematical Review

#definition[Generic Planar Glucose-Insulin Model][
  _Note:_ This simplified planar form abstracts the essential feedback structure of glucose-insulin regulation commonly found in physiological models. It captures qualitative metabolic dynamics suitable for Lyapunov analysis, though full clinical models may include additional delays and nonlinearities.
  A wide class of basal metabolism models can be written as a planar autonomous system:
  $ G' = f_1(G, I) \
    I' = f_2(G, I) $
  where $G$ is blood glucose and $I$ is blood insulin. At a healthy equilibrium $(G^*, I^*)$, physiological feedback dictates the sign structure of the Jacobian $J$:
  $ J = mat(frac(partial G', partial G), frac(partial G', partial I); frac(partial I', partial G), frac(partial I', partial I)) = mat(-p_1, -p_2; p_3, -p_4) $
  where $p_1, p_2, p_3, p_4 > 0$. Here, $p_1$ represents glucose effectiveness, $p_2$ is insulin sensitivity, $p_3$ is the beta-cell responsiveness to glucose, and $p_4$ is the insulin clearance rate.
]

#definition[Candidate Lyapunov Function for Glucose-Insulin][
  For a glucose-insulin model with equilibrium $(G^*, I^*)$, define
  $ V(G, I) = (G - G^*)^2 + c (I - I^*)^2 $
  for some constant $c > 0$. If $dot(V)$ is negative definite in a neighborhood (or globally on an invariant region), trajectories return to the healthy equilibrium.
]

#definition[Clinical Interpretation of Stability][
  In biomathematics, local asymptotic stability of a healthy equilibrium means small physiological perturbations (meal load, transient stress, hormonal fluctuations) decay over time. Loss of stability indicates persistent dysregulation, which may correspond to progression toward pathological states.
]

#theorem[LaSalle's Invariance Principle][
  Let $Omega$ be a compact set that is positively invariant under the flow of $x' = f(x)$. Let $V : Omega arrow.r RR$ be a continuously differentiable function such that $dot(V)(x) <= 0$ for all $x in Omega$. Define:
  $ E = {x in Omega : dot(V)(x) = 0}, $
  and let $M$ be the largest positively invariant subset of $E$. Then every solution starting in $Omega$ converges to $M$ as $t arrow.r infinity$.

  In particular, if $M = {x^*}$, then $x^*$ is asymptotically stable and every trajectory starting in $Omega$ converges to $x^*$.
]

_Remark:_ LaSalle's principle extends the Direct Method to cases where $dot(V) <= 0$ (only negative semi-definite, not strictly negative definite). It is especially useful in biomathematical models where $dot(V) = 0$ on a physically meaningful set—for example, the glucose nullcline where $G' = 0$ (glucose production balances glucose clearance)—rather than having $dot(V) < 0$ everywhere away from equilibrium. This allows convergence conclusions even when the Lyapunov function is only dissipative on certain invariant surfaces.

=== Solved Problems

#solved_problem[Parameter-Based Stability Condition via Weighted Lyapunov Function][
  Consider the generic linearized physiological model around a healthy equilibrium:
  $ mat(delta G'; delta I') = mat(-p_1, -p_2; p_3, -p_4) mat(delta G; delta I), $
  where $p_1, p_2, p_3, p_4 > 0$. Using the weighted candidate Lyapunov function 
  $ V(delta G, delta I) = (delta G)^2 + c (delta I)^2, $
  find a value for the weight $c > 0$ that makes $dot(V)$ strictly negative definite, thereby analytically confirming local asymptotic stability.
]
#solution[
  *Step 1: Compute $dot(V)$ along trajectories.*
  Taking the time derivative of the candidate function gives:
  $ dot(V) &= 2 (delta G) (delta G') + 2 c (delta I) (delta I') \
  &= 2 (delta G) (-p_1 delta G - p_2 delta I) + 2 c (delta I) (p_3 delta G - p_4 delta I) \
  &= -2 p_1 (delta G)^2 - 2 p_2 (delta G)(delta I) + 2 c p_3 (delta G)(delta I) - 2 c p_4 (delta I)^2. $

  *Step 2: Eliminate the cross-terms.*
  To make the right-hand side clearly negative definite, we can choose the scaling parameter $c$ to eliminate the mixed $(delta G)(delta I)$ term. We require:
  $ -2 p_2 + 2 c p_3 = 0 quad => quad c = frac(p_2, p_3). $
  Since $p_2$ (insulin sensitivity) and $p_3$ (beta-cell responsiveness) are both strictly positive, the weight $c$ is positive, maintaining $V$ as a valid positive-definite Lyapunov function.

  *Step 3: Conclude stability.*
  Substituting $c = p_2\/p_3$ back into the derivative yields:
  $ dot(V) = -2 p_1 (delta G)^2 - 2 frac(p_2 p_4, p_3) (delta I)^2. $
  Because all parameters $p_i$ are strictly positive, $dot(V) < 0$ for all $(delta G, delta I) != (0,0)$. 
  
  _Remark:_ This proves the healthy equilibrium is locally asymptotically stable under normal physiological conditions. Adjusting $c = p_2/p_3$ biologically means the "metabolic distance" is scaled by the ratio of insulin sensitivity to beta-cell sensitivity.
]

#solved_problem[Applying LaSalle's Invariance Principle][
  Suppose an alternative Lyapunov candidate $V(delta G, delta I)$ for the generic linearized model yields a derivative that only penalizes glucose variations:
  $ dot(V) = -2 p_1 (delta G)^2 <= 0. $
  Because $delta I$ does not appear in $dot(V)$, the derivative is only negative semi-definite. Use LaSalle's Invariance Principle to prove that the origin is still locally asymptotically stable.
]
#solution[
  *Step 1: Identify the set $E$.*
  LaSalle's Principle requires us to first identify the set of all states where $dot(V) = 0$.
  $ E = {(delta G, delta I) : dot(V) = 0} = {(delta G, delta I) : delta G = 0}. $
  This corresponds to the vertical axis in the $(delta G, delta I)$ phase plane (perfect normoglycemia, but arbitrary insulin levels).

  *Step 2: Find the largest invariant subset $M$ in $E$.*
  For a trajectory to remain inside $E$ for all time, it must satisfy $delta G(t) = 0$ constantly.
  This implies its time derivative must also be zero: $delta G' = 0$.
  Substitute this into the system's differential equation for glucose:
  $ delta G' = -p_1 (0) - p_2 (delta I) = 0 quad => quad -p_2 (delta I) = 0. $
  Since insulin sensitivity $p_2 > 0$, we must have $delta I = 0$.

  *Step 3: Conclude.*
  The only physiological state that can stay in $E$ forever is $(0,0)$. Thus, the largest invariant subset $M$ is simply the origin. By LaSalle's Invariance Principle, all trajectories starting in the neighborhood converge to $M = {(0,0)}$, proving local asymptotic stability despite the semi-definite $dot(V)$.
]

#solved_problem[Pathological State: Beta-Cell Failure and Instability][
  Consider a patient in advanced diabetes where chronic hyperglycemia has induced severe beta-cell fatigue. In this pathological state, elevated glucose *decreases* insulin secretion perfectly. The corresponding Jacobian at the pathological equilibrium is:
  $ J_"path" = mat(-p_1, -p_2; -p_3, -p_4) $
  where $p_1, p_2, p_3, p_4 > 0$. Under what exact parametric condition does this pathological equilibrium lose stability? Provide a clinical interpretation.
]
#solution[
  *Step 1: Apply the Trace-Determinant Condition.*
  We analyze the eigenvalues using the trace and determinant of $J_"path"$:
  $ text("tr")(J_"path") = -p_1 - p_4 \
    det(J_"path") = p_1 p_4 - (-p_2)(-p_3) = p_1 p_4 - p_2 p_3. $
  
  *Step 2: Determine Stability Boundaries.*
  Since $p_1, p_4 > 0$, the trace is always strictly negative ($text("tr")(J_"path") < 0$).
  For asymptotic stability, a $2 times 2$ matrix with a negative trace also requires a strictly positive determinant. 
  The equilibrium becomes strictly unstable (a saddle point) when $det(J_"path") < 0$, which occurs when:
  $ p_2 p_3 > p_1 p_4. $

  *Step 3: Clinical Interpretation.*
  The product $p_1 p_4$ represents the system's "natural stabilization" (glucose effectiveness $times$ insulin clearance). The product $p_2 p_3$ represents a "vicious cycle": high glucose drops insulin ($-p_3$), which further raises glucose ($-p_2$). Unstable progression occurs precisely when this pathological vicious cycle overpowers the body's baseline clearance rates.
]

=== Supplementary Problems

#supplementary[Energy Interpretation in a Metabolic Model][
  Explain why $V(G, I)$ can be interpreted as a weighted metabolic distance from the healthy state $(G^*, I^*)$, and what it means clinically when $dot(V) < 0$.
  *Hint:* Interpret each quadratic term as a weighted deviation penalty from equilibrium.
]

#supplementary[LaSalle Invariance Principle in a Metabolic Setting][
  Assume a candidate Lyapunov function satisfies $dot(V)(x) <= 0$ in a compact positively invariant set $Omega$.
  1. Define the set $E = {x in Omega : dot(V)(x) = 0}$.
  2. Determine the largest invariant subset $M subset E$ in a model where $dot(V)=0$ implies $G=G^*$ and $I$ may vary.
  3. Use LaSalle's invariance principle to conclude whether trajectories converge to $(G^*, I^*)$.
  4. Discuss what this conclusion means for long-term metabolic regulation.
  *Hint:* Characterize all states in $E$ that remain in $E$ under system dynamics.
]

#supplementary[Parameter-Robust Stability of the Healthy Equilibrium][
  Consider a parameterized glucose-insulin model with Jacobian $J(theta)$ at the healthy equilibrium, where $theta$ represents physiological uncertainty.
  1. State a sufficient matrix-based condition ensuring local asymptotic stability for all $theta in [theta_min, theta_max]$.
  2. Explain how trace-determinant inequalities can be used in the planar case.
  3. Discuss the biomedical meaning of robustness with respect to patient variability.
  *Hint:* For $2 times 2$ systems, enforce $text("tr")(J(theta)) < 0$ and $det(J(theta)) > 0$ uniformly on the interval.
]

#supplementary[Disturbance Rejection and Practical Stability][
  Assume meal intake acts as a bounded disturbance $u(t)$ in a glucose-insulin model:
  $ x' = f(x) + B u(t), quad norm(u(t)) <= u_max. $
  1. Explain why strict asymptotic convergence to equilibrium may be replaced by convergence to a small neighborhood.
  2. Formulate a Lyapunov inequality that implies practical stability under bounded input.
  3. Interpret this in terms of clinically acceptable glycemic variability.
  *Hint:* Derive an estimate of the form $dot(V) <= -c_1 norm(x-x^*)^2 + c_2 norm(u)^2$.
]

#supplementary[Basin-of-Attraction Estimate for Safe Operating Region][
  Let $V(G,I)$ be a Lyapunov candidate around a healthy equilibrium $(G^*, I^*)$.
  1. Define a sublevel set $Omega_r = {(G,I): V(G,I) <= r}$.
  2. State conditions under which $Omega_r$ is a certified safe operating region.
  3. Explain how increasing $r$ can eventually violate invariance.
  4. Propose how this estimate can guide treatment thresholds.
  *Hint:* Check the sign of $dot(V)$ on the boundary $V=r$.
]

