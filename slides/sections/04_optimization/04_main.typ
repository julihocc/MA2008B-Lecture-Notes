#import "@preview/touying:0.5.3": *

= System Optimization

== Introduction to Section 4

This module covers root-locus analysis and design, a powerful graphical method for analyzing and designing control systems. 

#pause
*Key Objectives:*
- Understand the solution of time-invariant state equations.
- Examine how closed-loop poles move as system parameters vary.
- Learn general rules for constructing Root Locus diagrams.
- Apply Root Locus analysis to control system design.

= 4.1 Solution of Time-Invariant State Equation

== State Transition Matrix

For the linear time-invariant homogeneous system $dot(x)=A x$, the state transition matrix $Phi(t)$ is the unique matrix function such that:

#align(center)[
  #block(fill: luma(250), inset: 12pt, radius: 4pt, stroke: 1pt + gray)[
    $ dot(Phi)(t)=A Phi(t), quad Phi(0)=I $
  ]
]

#pause
Consequently, for any initial condition $x(0)$, the state evolves as:
$ x(t)=Phi(t)x(0) $

== Representations of $Phi(t)$

*Time-Domain Representation:*
For a constant matrix $A$, the state transition matrix is given by the matrix exponential:
$ Phi(t)=e^(A t) $

#pause
*Laplace-Domain Representation:*
Taking the Laplace transform yields the resolvent matrix:
$ cal(L){Phi(t)}=(s I - A)^(-1) $

== Complete Solution

For the state equation $dot(x) = A x + B u$, the complete state response is:

#align(center)[
  #block(fill: rgb("#f4f9fd"), inset: 12pt, radius: 4pt, stroke: 1pt + rgb("#b3d4ec"))[
    $ x(t) = e^(A t) x(0) + integral_0^t e^(A(t-tau)) B u(tau) d tau $
  ]
]

#pause
*Response Components:*
- $e^(A t) x(0)$ : *Zero-input response* (free response).
- $integral(...) d tau$ : *Zero-state response* (forced response).

== Eigenvalue Decomposition

Suppose $A$ is diagonalizable, so that $A = V Lambda V^(-1)$, where:
- $V$ is the eigenvector matrix 
- $Lambda$ is a diagonal matrix of eigenvalues.

#pause
The matrix exponential can be computed efficiently as:
#align(center)[
  $ e^(A t) = V e^(Lambda t) V^(-1) $
]

== Solved Problem: Diagonal Matrix Exponential

*Task:* Compute the state transition matrix $e^(A t)$ for

#align(center)[
  $ A = mat(-1, 0;0, -2) $
]

using the power-series definition.

== Solved Problem: Compute State Transition Matrix

*Task:* Find $e^(A t)$ for

#align(center)[
  $ A = mat(0, 1;-1, 0) $
]

== Solved Problem: Matrix via Eigenvalue Decomposition

*Task:* Compute $e^(A t)$ for

#align(center)[
  $ A = mat(0, 1;-2, -3) $
]

using diagonalization.

== Solved Problem: Zero-Input & Zero-State Responses

*Task:* Consider the system components:
$ A = mat(-1, 0;0, -2), quad B = mat(1;1), quad u(t) = 1, quad x(0) = mat(1;2) $

#pause
Compute the complete response:
$ x(t) = e^(A t)x(0) + integral_0^t e^(A(t-tau))B u(tau) d tau $


= 4.2 Root Locus Analysis

== Parameterized Characteristic Equation

Consider a one-parameter family of characteristic equations:
#align(center)[
  $ Delta(s, K) = P(s) + K Q(s) = 0 $
]
where $s in CC$ and $K in RR$ is a scalar gain.

#pause
*Definition (Root Locus):*
The set of all points $s$ in the complex plane that satisfy this equation for $K >= 0$.

== Normalized Form

Assuming $P(s) != 0$, the characteristic equation can be normalized into the form:

#align(center)[
  #block(fill: luma(250), inset: 12pt, radius: 4pt, stroke: 1pt + gray)[
    $ 1 + K F(s) = 0, quad "where" F(s) = Q(s)/P(s) $
  ]
]

#pause
*Note:* This standard form is the fundamental basis for all graphical root-locus construction rules.

== Angle and Magnitude Conditions

For a point $s_0 in CC$ to lie on the root locus (for $K > 0$), it must satisfy two conditions based on $K F(s_0) = -1$:

#pause
*1. Angle Condition:* 
$ angle F(s_0) = (2k+1)180 degree, quad k in ZZ $

#pause
*2. Magnitude Condition:* 
$ |K F(s_0)| = 1 $

== Solved Problem: Characteristic Equation & Poles

*Task:* For the characteristic equation
#align(center)[
  $ Delta(s, K)=s(s+2)+K $
]
derive the characteristic roots as functions of $K$.

== Solved Problem: Angle Condition Check

*Task:* For the open-loop transfer function
#align(center)[
  $ F(s)=1/((s+1)(s+2)) $
]
check whether the test point $s_0=-1.5$ satisfies the angle condition.

== Solved Problem: Breakaway/Break-in Point

*Task:* For the characteristic equation
#align(center)[
  $ Delta(s, K)=1+K/(s(s+2)) $
]
compute the real-axis breakaway/break-in point.

== Solved Problem: Design for Damping

*Task 1:* Sketch the root locus for the normalized equation
$ 1+K/(s(s+1)(s+3))=0. $

#pause
*Task 2:* For $Delta(s, K)=s^2+4s+K$, find the gain $K$ required for a damping ratio of $zeta=0.5$.


= 4.3 Root Locus Plots

== Trajectory Branches

Let:
- $n$ = number of poles of $F(s)$
- $m$ = number of zeros of $F(s)$

#pause
*Branch properties:*
- The root locus has exactly $n$ branches.
- At $K=0$, the $n$ branches start at the poles of $F$.
- As $K -> infinity$, $m$ branches terminate at the finite zeros.
- The remaining $n-m$ branches go to infinity.

== Asymptotes and Centroid

The $n-m$ branches that go to infinity approach straight-line asymptotes.

#pause
*Asymptote Angles:* 
$ theta_k = ((2k+1)180 degree)/(n-m), quad k=0, 1, ..., n-m-1 $

#pause
*Centroid (Real Axis Intercept):*
$ sigma_a = (sum_"poles" p_i - sum_"zeros" z_j)/(n-m) $

== Solved Problem: Basic Plot Data

*Task:* For the characteristic equation
#align(center)[
  $ 1+K/(s(s+4))=0 $
]
determine:
- Branch count
- Start/end points
- Finite breakaway points

== Solved Problem: Asymptotes and Centroid

*Task:* For the characteristic equation
#align(center)[
  $ 1+K (s+1)/(s(s+2)(s+3))=0 $
]
compute the asymptote count, asymptote angles, and centroid.

== Solved Problem: Complete Root-Locus Sketch

*Task:* Sketch the complete root locus for
#align(center)[
  $ 1+K (s+2)/(s(s+1)(s+4))=0 $
]

== Solved Problem: Imaginary-Axis Crossing Parameter

*Task:* Determine where the root locus crosses the imaginary axis for
#align(center)[
  $ Delta(s, K)=s^3+7s^2+10s+K=0 $
]


= 4.4 Construction Rules

== Real-Axis Segment Criterion

*Rule:* 
A point on the real axis belongs to the root locus if and only if the total number of real poles and real zeros of $F(s)$ strictly to its right is *odd*.

== Breakaway & Imaginary-Axis Crossings

*Breakaway Points:* 
- Candidate points satisfy $(d K)/(d s) = 0$ when formulated as $K(s) = -1/F(s)$. 
- Only candidates on admissible real-axis segments are valid.

#pause
*Imaginary-Axis Crossings:*
- Found by applying the Routh-Hurwitz criterion to $Delta(s, K)$. 
- A crossing occurs when a row in the first column evaluates to zero.

== Departure and Arrival Angles

For a complex pole $p_i$, the departure angle evaluates how the branch leaves the pole:
#align(center)[
  #block(fill: rgb("#f9f4fd"), inset: 12pt, radius: 4pt, stroke: 1pt + rgb("#d1b3ec"))[
    $ theta_("dep") = 180 degree + sum angle(p_i - z_k) - sum_(j != i) angle(p_i - p_j) $
  ]
]

#pause
*(The arrival angle for a complex zero is calculated symmetrically).*

== Solved Problem: Apply All Rules

*Task:* Construct the root locus for
#align(center)[
  $ 1 + K/((s+1)(s^2+2s+2)) = 0 $
]
using systematic construction rules.

== Solved Problem: Design Using Root Locus

*Task:* For the equation
#align(center)[
  $ Delta(s, K)=s(s+2)+K=0 $
]
find the gain $K$ for target poles at $s = -1 plus.minus j$.

== Solved Problem: Imaginary-Axis Crossing by Routh

*Task:* Determine the crossing gain and frequency for
#align(center)[
  $ Delta(s, K)=s^3+3s^2+2s+K=0 $
]


= 4.5 Root Locus of Control Systems

== Second-Order Target Pair

For a desired damping ratio $zeta$ and natural frequency $omega_n$, the target dominant pole pair is:
$ s_d = -zeta omega_n plus.minus j omega_n sqrt(1-zeta^2) $

#pause
*Time-domain design approximations:*
- *Settling Time (2%):* $quad t_s approx 4 / (zeta omega_n)$
- *Maximum Overshoot:* $quad M_p approx exp(-(zeta pi)/sqrt(1-zeta^2))$

== Compensator Geometry

*Lead Compensation:*
- Zero closer to origin than pole.
- Introduces positive phase. 
- *Effect:* Attracts root locus branches to the left, increasing damping and speed.

#pause
*Lag Compensation:*
- Pole closer to origin than zero.
- Introduces negative phase. 
- *Effect:* Improves steady-state error without significantly altering the transient geometry.

== Solved Problem: Settling-Time Feasibility Check

*Task:* For the characteristic equation
#align(center)[
  $ Delta(s, K)=s(s+6)+K=0 $
]
determine whether $t_s=1\s$ (2% criterion) is achievable by gain adjustment alone.

== Solved Problem: Compensator Design

*Task:* Design a lead compensator for
#align(center)[
  $ P(s)=1/(s(s+1)) $
]
so that dominant poles are at $ s_d=-1 plus.minus j sqrt(3) $.
*(Equivalently $zeta=0.5$, $omega_n=2$)*.

== Solved Problem: Dominant-Pole Interpretation

*Task:* For the open-loop transfer function
#align(center)[
  $ L(s)=K/((s+1)(s+2)(s+20)) $
]
explain why the pair near $-1$ and $-2$ is treated as dominant in preliminary design.


= 4.6 Root Contour Diagrams

== Root-Contour Family

Root contours generalize root-locus geometry from one-parameter variation (like gain $K$) to *multi-parameter families* (like varying compensator zeros and poles simultaneously).

#align(center)[
  $ Delta(s, alpha, beta) = 0 $
]

We analyze constant-damping rays (fixed $zeta$) and constant-natural-frequency circles (fixed $omega_n$).

== Admissible Performance Region

For requirements $zeta >= zeta_min$ and $omega_n <= omega_(n,max)$, the admissible dominant poles must satisfy:

#align(center)[
  #block(fill: rgb("#fdfcf4"), inset: 12pt, radius: 4pt, stroke: 1pt + rgb("#ecebb3"))[
    $ |s| <= omega_(n,max) quad "and" quad |arg(s)| >= cos^(-1)(zeta_min) $
  ]
]

#pause
This defines a wedge-shaped region bounded by an outer circular arc in the left-half plane.

== Solved Problem: Parameter Space Design

*Task:* For the equation
#align(center)[
  $ Delta(s, K_1, K_2)=s(s+1)(s+3)+K_1(s+K_2)=0 $
]
find $(K_1, K_2)$ for $zeta = 0.7$, $omega_n = 2$.

== Solved Problem: Sensitivity Analysis

*Task:* Analyze sensitivity of pole location to a 10% variation in $K$ for
#align(center)[
  $ Delta(s, K)=s^2+2s+K=0 $
]

== Solved Problem: Performance Region Interpretation

*Task:* For the requirements
#align(center)[
  $ zeta >= 0.5 quad "and" quad omega_n <= 4 $
]
describe the admissible dominant-pole region.
