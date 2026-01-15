#import "../../utils.typ": *
== Nyquist Stability Criterion

=== Mathematical Review

The *Nyquist stability criterion* provides a powerful graphical method for determining the stability of closed-loop systems from the open-loop frequency response.

#definition[Nyquist Contour][
  The Nyquist contour is a closed path in the s-plane that encloses the entire right half-plane. It consists of:
  1. Imaginary axis from $-j infinity$ to $+j infinity$
  2. Semicircle of infinite radius in the right half-plane
]

#theorem[Argument Principle][
  For a transfer function $F(s)$ with $P$ poles and $Z$ zeros inside a contour:
  $ N = Z - P $
  where $N$ is the net number of clockwise encirclements of the origin by $F(s)$ as $s$ traverses the contour.
]

#definition[Nyquist Stability Criterion][
  For a closed-loop system with characteristic equation $1 + G(s)H(s) = 0$:
  $ Z = N + P $
  where:
  - $Z$ = number of unstable closed-loop poles
  - $N$ = net clockwise encirclements of $-1 + j 0$ point by Nyquist plot of $G(s)H(s)$
  - $P$ = number of unstable open-loop poles of $G(s)H(s)$
]

=== Special Cases

#theorem[Poles on Imaginary Axis][
  When open-loop poles lie on the imaginary axis, the Nyquist contour must be modified:
  1. Use small semicircular detours around each pole
  2. These detours produce $±180°$ arcs in the Nyquist plot
  3. The direction depends on whether the contour goes above or below the pole
]

#example[Poles at Origin][
  For $G(s)H(s) = K/s(s+1)$, the pole at $s = 0$ requires a detour:
  - As $s$ circles the origin clockwise, $G(s)H(s)$ traces a $180°$ arc at infinity
  - This arc connects the positive and negative imaginary axes
]

=== Solved Problems

#solved_problem[Nyquist Stability Analysis][
  Apply the Nyquist criterion to $G(s) = K/(s(s+1)(s+2))$.
]
#solution[
  Step 1: Determine $P$ (unstable open-loop poles)
  Open-loop poles: $s = 0, -1, -2$ → $P = 1$ (pole at origin is on imaginary axis)
  
  Step 2: Sketch Nyquist plot for different $K$ values
  - $omega -> 0^+$: $G(j omega) -> -j infinity$
  - $omega -> infinity$: $G(j omega) -> 0$
  - Real axis intersection: Find $omega$ where imaginary part = 0
  
  Step 3: Count encirclements
  For stability: $Z = N + P = 0$ → $N = -1$ (one counterclockwise encirclement)
  
  Step 4: Determine stability range
  The plot will encircle $-1 + j 0$ once counterclockwise if $0 < K < 6$.
  Therefore, the system is stable for $0 < K < 6$.
]

#solved_problem[Conditional Stability][
  Analyze the conditional stability of $G(s) = K(1+s)/(s^2(1+0.1s)(1+0.2s))$.
]
#solution[
  This is a conditionally stable system where stability depends on gain $K$.
  
  Open-loop poles: $s = 0$ (double pole), $s = -10$, $s = -5$ → $P = 2$
  
  Nyquist plot characteristics:
  - Starts at $-j infinity$ due to double pole at origin
  - Has complex shape due to zero at $s = -1$
  - Can encircle $-1 + j 0$ multiple times depending on $K$
  
  Stability conditions:
  - For low $K$: Unstable (insufficient encirclements)
  - For medium $K$: Stable (correct number of encirclements)
  - For high $K$: Unstable (excessive encirclements)
  
  The system is stable only in a specific range of $K$ values.
]

=== Supplementary Problems

#supplementary[Pole at Origin][
  Apply Nyquist criterion to $G(s) = K/(s(s+3))$ and determine the range of $K$ for stability.
]

#supplementary[Non-Minimum Phase][
  Analyze stability of $G(s) = K(s-1)/(s+2)(s+3)$ using Nyquist criterion.
]