#import "../../utils.typ": *
== Transfer Function

=== Mathematical Review

The *Transfer Function* $G(s)$ of a Linear Time-Invariant (LTI) system is defined as the ratio of the Laplace transform of the output $Y(s)$ to the Laplace transform of the input $U(s)$, assuming all initial conditions are zero.

#definition[Transfer Function][
  $ G(s) = Y(s) / U(s) = (b_m s^m + ... + b_1 s + b_0) / (a_n s^n + ... + a_1 s + a_0) $
  where $n >= m$ for physical realizability. The roots of the denominator are the *poles*, and the roots of the numerator are the *zeros*.
]

*Impulse Response:* The system output when the input is a Dirac delta function $delta(t)$. Its Laplace transform is $G(s)$.

=== Solved Problems

#example[RC Circuit][
  Consider a series RC circuit where the input is voltage $v_{in}(t)$ and output is capacitor voltage $v_c(t)$. Find $G(s)$.
]
#solution[
  Kirchhoff's voltage law:
  $ v_{in}(t) = R i(t) + v_c(t) $
  Current relation: $i(t) = C dot(v)_c(t)$.
  Substituting:
  $ v_{in}(t) = R C dot(v)_c(t) + v_c(t) $
  Taking Laplace transform (zero initial conditions):
  $ V_{in}(s) = (R C s + 1) V_c(s) $
  Transfer function:
  $ G(s) = V_c(s) / V_{in}(s) = 1 / (R C s + 1) $
]

#example[Poles and Stability][
  Given $G(s) = 10 / (s^2 + 2s + 5)$, find the poles and determine stability.
]
#solution[
  The poles are roots of $s^2 + 2s + 5 = 0$.
  Using quadratic formula:
  $ s = (-2 +- sqrt(4 - 20)) / 2 = -1 +- 2j $
  Since the real part ($-1$) is negative, the system is *stable*.
]

=== Supplementary Problems

#exercise[Mechanical System][
  Find transfer function $X(s)/F(s)$ for a mass-spring-damper system: $M diaer(x) + B dot(x) + K x = f(t)$.
]

#exercise[Zero Locations][
  How do zeros in the right-half plane (non-minimum phase) affect the step response?
]
