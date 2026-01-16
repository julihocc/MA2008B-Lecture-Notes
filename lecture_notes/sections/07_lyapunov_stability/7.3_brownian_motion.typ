#import "../../utils.typ": *
== Brownian Motion and Stochastic Processes

=== Mathematical Review

*Brownian motion* (or the Wiener process) serves as the mathematical foundation for modeling random fluctuations in dynamic systems, leading to the study of Stochastic Differential Equations (SDEs).

#definition[Standard Brownian Motion][
  A continuous-time stochastic process $W(t)$ for $t >= 0$ is a standard Brownian motion (Wiener process) if:
  1. $W(0) = 0$ almost surely.
  2. It has independent increments: $W(t) - W(s)$ is independent of past values for $0 <= s < t$.
  3. Increments are normally distributed: $W(t) - W(s) tilde cal(N)(0, t - s)$.
  4. Paths are continuous almost surely (but nowhere differentiable).
]

#definition[Stochastic Differential Equation (SDE)][
  An SDE describes a system driven by white noise:
  $ d X(t) = f(X(t), t) d t + g(X(t), t) d W(t) $
  where $f$ is the drift term and $g$ is the diffusion term.
]

#theorem[Itô's Lemma][
  The stochastic equivalent of the chain rule. For a function $V(X, t)$:
  $ d V = ((partial V)/(partial t) + f (partial V)/(partial X) + 1/2 g^2 (partial^2 V)/(partial X^2)) d t + g (partial V)/(partial X) d W $
]

=== Solved Problems

#solved_problem[Properties of Brownian Motion][
  Calculate the expectation and variance of $W(t)$.
]
#solution[
  From the definition, $W(t) = W(t) - W(0) tilde cal(N)(0, t - 0)$.

  Expectation:
  $ E[W(t)] = 0 $

  Variance:
  $ op("Var")(W(t)) = E[(W(t) - E[W(t)])^2] = E[W(t)^2] = t $

  Covariance of $W(s)$ and $W(t)$ for $s < t$:
  $ E[W(s)W(t)] = E[W(s)(W(s) + (W(t)-W(s)))] = E[W(s)^2] + E[W(s)(W(t)-W(s))] $
  Since increments are independent:
  $ E[W(s)]E[W(t)-W(s)] = 0 × 0 = 0 $
  So $E[W(s)W(t)] = s = min(s, t)$
]

#solved_problem[Geometric Brownian Motion][
  Solve the SDE for asset prices: $d S = mu S d t + sigma S d W$.
]
#solution[
  Step 1: Apply Itô's Lemma to $V = ln(S)$
  $(partial V)/(partial S) = 1/S, (partial^2 V)/(partial S^2) = -1/S^2, (partial V)/(partial t) = 0$

  Step 2: Substitute into formula
  $ d(ln S) = (0 + mu S (1/S) + 1/2 (sigma S)^2 (-1/S^2)) d t + sigma S (1/S) d W $
  $ d(ln S) = (mu - 1/2 sigma^2) d t + sigma d W $

  Step 3: Integrate
  $ ln S(t) - ln S(0) = (mu - 1/2 sigma^2) t + sigma W(t) $
  $ S(t) = S(0) exp((mu - 1/2 sigma^2) t + sigma W(t)) $
]

=== Supplementary Problems

#supplementary[Ornstein-Uhlenbeck Process][
  Analyze the mean-reverting process $d X = theta (mu - X) d t + sigma d W$. Find the mean and variance as $t -> infinity$.
]

#supplementary[Stochastic Stability][
  Define what it means for the trivial solution $X(t) = 0$ of an SDE to be stochastically stable in the large.
]
