#import "../../utils.typ": *
== Routh Stability Criterion

=== Mathematical Review

The Routh-Hurwitz criterion determines stability without finding roots explicitly.

#definition[Routh Stability Criterion][
  A system is stable if and only if all elements in the first column of the Routh array are positive.

  For characteristic equation $a_n s^n + a_(n-1) s^(n-1) + ... + a_1 s + a_0 = 0$, construct Routh array.
]

#example[Routh Array Construction][
  For $s^3 + 6s^2 + 11s + 6 = 0$:

  $
    s^3: quad & 1 quad 11 \
    s^2: quad & 6 quad 6 \
    s^1: quad & (6 times 11 - 1 times 6)/6 = 10 quad 0 \
    s^0: quad & 6
  $

  All first column positive → stable.
]

#theorem[Necessary Condition][
  For stability, all coefficients $a_i$ must be present and have the same sign.
]

#example[Unstable by Inspection][
  $s^3 + 2s^2 - 3s + 1 = 0$ is unstable (negative coefficient).
]

#definition[Special Cases][
  - *Zero in first column:* Replace with small $epsilon$, take limit
  - *Entire row zero:* Auxiliary equation indicates imaginary axis poles
]

#example[Zero in First Column][
  For $s^3 + 2s^2 + s + 2 = 0$:

  $
    s^3: quad & 1 quad 1 \
    s^2: quad & 2 quad 2 \
    s^1: quad & (2 times 1 - 1 times 2)/2 = 0 -> epsilon
  $

  Replace 0 with $epsilon > 0$, continue analysis.
]

=== Solved Problems

#solved_problem[Stability Analysis][
  Determine stability of $s^4 + 2s^3 + 3s^2 + 4s + 5 = 0$.
]
#solution[
  Routh array:
  $
    s^4: quad & 1 quad 3 quad 5 \
    s^3: quad & 2 quad 4 quad 0 \
    s^2: quad & (2 times 3 - 1 times 4)/2 = 1 quad 5 \
    s^1: quad & (1 times 4 - 2 times 5)/1 = -6 quad 0 \
    s^0: quad & 5
  $

  Sign change in first column ($1 -> -6$) → unstable.
  Number of sign changes = 1 → one pole in RHP.
]

#solved_problem[Range of K for Stability][
  Find range of $K$ for stability: $s^3 + 3s^2 + (K+2)s + 4K = 0$.
]
#solution[
  Routh array:
  $
    s^3: quad & 1 quad K+2 \
    s^2: quad & 3 quad 4K \
    s^1: quad & (3(K+2) - 4K)/3 = (3K+6-4K)/3 = (6-K)/3 \
    s^0: quad & 4K
  $

  For stability:
  1. $(6-K)/3 > 0 => K < 6$
  2. $4K > 0 => K > 0$

  Stable range: $0 < K < 6$
]

=== Supplementary Problems

#supplementary[Marginal Stability][
  Find $K$ for marginal stability (poles on imaginary axis).
]

#supplementary[Auxiliary Equation][
  Use auxiliary equation to find imaginary axis poles.
]

#supplementary[Higher-Order Stability][
  Analyze fifth-order system stability.
]
