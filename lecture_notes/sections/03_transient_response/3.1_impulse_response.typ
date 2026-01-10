#import "../../utils.typ": *
== Impulse Response Function

=== Mathematical Review

The impulse response characterizes a system's behavior to an instantaneous input.

#definition[Impulse Response][
  The impulse response $h(t)$ is the output when input is the Dirac delta function $delta(t)$:
  $ h(t) = cal(L)^(-1){G(s)} $
  where $G(s)$ is the transfer function.
]

#example[First-Order Impulse Response][
  For $G(s) = 1/(s+a)$:
  $ h(t) = e^(-a t) u(t) $
  where $u(t)$ is the unit step function.
]

#theorem[Convolution Integral][
  The output $y(t)$ for any input $u(t)$ can be computed via convolution:
  $ y(t) = integral_0^t h(tau) u(t - tau) d tau = h(t) * u(t) $
]

#example[Convolution Application][
  For $h(t) = e^(-t)$ and $u(t) = u(t)$ (unit step):
  $ y(t) = integral_0^t e^(-tau) d tau = 1 - e^(-t) $
]

#definition[Frequency Response][
  The frequency response is the Fourier transform of the impulse response:
  $ G(j omega) = integral_(-infinity)^infinity h(t) e^(-j omega t) d t $
]

#example[Frequency Response Magnitude][
  For $G(s) = 1/(s+1)$:
  $ |G(j omega)| = 1/sqrt(1 + omega^2) $
]

=== Solved Problems

#solved_problem[Impulse Response from Transfer Function][
  Find impulse response for $G(s) = (s+2)/(s^2 + 3s + 2)$.
]
#solution[
  Factor denominator: $G(s) = (s+2)/((s+1)(s+2)) = 1/(s+1)$

  Taking inverse Laplace:
  $ h(t) = e^(-t) u(t) $
]

#solved_problem[Convolution Calculation][
  Find output for $h(t) = 2e^(-2t)$ with input $u(t) = 3u(t)$.
]
#solution[
  $ y(t) = integral_0^t 2e^(-2tau) dot 3 d tau = 6 integral_0^t e^(-2tau) d tau $
  $ = 6 [(-1/2)e^(-2tau)]_0^t = 3(1 - e^(-2t)) $
]

=== Supplementary Problems

#supplementary[Second-Order Impulse][
  Find impulse response for $G(s) = omega_n^2/(s^2 + 2 zeta omega_n s + omega_n^2)$ with $zeta < 1$.
]

#supplementary[Convolution Properties][
  Prove that convolution is commutative: $h * u = u * h$.
]
