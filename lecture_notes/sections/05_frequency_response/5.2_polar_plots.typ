#import "../../utils.typ": *
== Polar Plots

=== Mathematical Review

*Polar plots* (also called Nyquist plots) provide a graphical representation of the frequency response $G(j omega)$ in the complex plane, with frequency as a parameter.

#definition[Polar Plot][
  A polar plot is a parametric plot of $G(j omega)$ in the complex plane as $omega$ varies from $0$ to $infinity$:
  $ G(j omega) = text(Re)[G(j omega)] + j text(Im)[G(j omega)] $
  where the horizontal axis represents the real part and the vertical axis represents the imaginary part.
]

#example[First-Order System][
  For $G(s) = 1/(tau s + 1)$:
  $ G(j omega) = 1/(j omega tau + 1) = (1 - j omega tau)/(1 + (omega tau)^2) $
  Real part: $text(Re)[G(j omega)] = 1/(1 + (omega tau)^2)$
  Imaginary part: $text(Im)[G(j omega)] = -omega tau/(1 + (omega tau)^2)$
]

=== Construction Techniques

#theorem[Polar Plot Characteristics][
  Key features for polar plot construction:
  1. Starting point ($omega = 0$): $G(j 0)$
  2. Ending point ($omega -> infinity$): $lim_(omega -> infinity) G(j omega)$
  3. Intersection with imaginary axis: $text(Re)[G(j omega)] = 0$
  4. Intersection with real axis: $text(Im)[G(j omega)] = 0$
]

#theorem[Type Number Effects][
  The system type affects the low-frequency behavior:
  - Type 0: Starts at finite point on real axis
  - Type 1: Starts at infinity along negative imaginary axis
  - Type 2: Starts at infinity along negative real axis
]

=== Solved Problems

#solved_problem[Polar Plot Construction][
  Construct the polar plot for $G(s) = 10/(s+1)(s+2)$.
]
#solution[
  First, find $G(j omega)$:
  $ G(j omega) = 10/((j omega + 1)(j omega + 2)) = 10/((1 - omega^2) + j(3 omega)) $
  
  Multiply numerator and denominator by the complex conjugate:
  $ G(j omega) = 10((1 - omega^2) - j(3 omega))/((1 - omega^2)^2 + 9 omega^2) $
  
  Key points:
  - $omega = 0$: $G(j 0) = 10/2 = 5$ (on real axis)
  - $omega -> infinity$: $G(j omega) -> 0$ (origin)
  - Imaginary axis intersection: Set real part to zero
    $1 - omega^2 = 0 => omega = 1$ rad/s
    At $omega = 1$: $G(j 1) = -j(10 × 3)/(9 + 0) = -j(10/3)$
]

#solved_problem[Nyquist Plot for Type 1 System][
  Sketch the Nyquist plot for $G(s) = K/(s(s+1)(s+2))$.
]
#solution[
  This is a Type 1 system with three poles.
  
  Key characteristics:
  - $omega -> 0^+$: $G(j omega) approx K/(j omega × 1 × 2) = K/(j 2 omega) -> -j infinity$
  - $omega -> infinity$: $G(j omega) -> 0$ (origin)
  - The plot starts at $-j infinity$ and approaches the origin
  - For $K > 0$, the plot remains in the third and fourth quadrants
  - The curve is convex and approaches the origin at an angle of $-270°$
]

=== Supplementary Problems

#supplementary[Second-Order System][
  Construct the polar plot for $G(s) = omega_n^2/(s^2 + 2 zeta omega_n s + omega_n^2)$ with $zeta = 0.5$ and $omega_n = 2$.
]

#supplementary[Stability Assessment][
  For $G(s) = 5/(s-1)(s+2)$, determine if the polar plot encircles the $-1 + j 0$ point.
]