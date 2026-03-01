#import "../../../utils.typ": *

= Comprehensive Quiz: Section 4 - Optimization (Time-Domain Solutions and Root Locus)

+ What is the definition of the state transition matrix $Phi(t)$ for the homogeneous linear time-invariant system $dot(x) = A x$?
+ Express the Laplace-domain representation of the state transition matrix $Phi(t)$ for a constant system matrix $A$.
+ In the complete state response equation $x(t) = e^(A t) x(0) + integral_0^t e^(A(t-tau)) B u(tau) d tau$, what do the two terms on the right-hand side represent?
+ How is the matrix exponential $e^(A t)$ computed if the matrix $A$ is diagonalizable such that $A = V Lambda V^(-1)$?
+ For a diagonal matrix $A$, what does the form of the state transition matrix $e^(A t)$ imply about the coupling between its modal states?
+ Write the normalized form of a parameterized characteristic equation initially given as $P(s) + K Q(s) = 0$.
+ State the angle condition that a point $s_0 in CC$ must satisfy to belong to the root locus of $1 + K F(s) = 0$ for $K > 0$.
+ How is the magnitude condition used to find the parameter $K$ for a given point $s_0$ on the root locus?
+ What is the condition involving the derivative of the gain $K$ with respect to $s$ used to find real-axis breakaway or break-in points?
+ For a transfer function $F(s)$ with $n$ poles and $m$ zeros ($n > m$), how many branches of the root locus terminate at finite zeros, and how many go to infinity?
+ Provide the formula for the asymptote angles $theta_k$ for the root locus branches that approach infinity.
+ What is the formula for calculating the centroid $sigma_a$ of the root locus asymptotes?
+ Describe the root locus construction rule for determining which segments of the real axis belong to the root locus.
+ In root locus analysis, how is the Routh-Hurwitz array commonly utilized?
+ Write the formula for determining the departure angle $theta_"dep"$ from a simple complex pole $p_i$.
+ For a second-order system with damping ratio $zeta$ and natural frequency $omega_n$, what is the common approximation for the 2% settling time $t_s$?
+ What is the condition that justifies using the dominant-pole approximation in transient response analysis?
+ Explain the geometric effect of introducing a real compensator zero to the open-loop transfer function in a root locus diagram.
+ Contrast the primary design objectives of placing a lead compensator versus a lag compensator in the context of root locus geometry.
+ In the context of root contour diagrams, what is the geometric shape of constant-damping ratio ($zeta$) loci in the left half of the complex plane?
+ Describe the geometric shape of constant-natural-frequency ($omega_n$) loci in the $s$-plane.
+ Geometrically describe the admissible region of dominant poles for the combined performance constraints $zeta >= zeta_"min"$ and $omega_n <= omega_(n,max)$ in the left half-plane.
+ Given a characteristic equation $Delta(s, p) = 0$, what is the formula for the local parameter sensitivity $(d s)/(d p)$ at a nominal point?
+ Why do poles located far to the left of the dominant poles (i.e., with much more negative real parts) have a negligible effect on the overall transient response?
+ Explain the fundamental difference between a single-parameter root locus and a multi-parameter root contour diagram.
