#import "@preview/touying:0.5.3": *
#import themes.university: *

#show: university-theme.with(aspect-ratio: "16-9", config-info(
  title: [Solution of Time-Invariant State Equation],
  subtitle: [Section 4.1],
  author: [Dr. Juliho Castillo Colmenares, Ph.D.],
  date: datetime.today().display("[day] [month repr:long] [year]"),
  institution: [Tecnológico de Monterrey],
  logo: none,
), config-colors(
  primary: rgb("#0033a0"), // Tec blue
  primary-light: rgb("#e6f0fa"),
  secondary: rgb("#000000"),
))

= Solution of Time-Invariant State Equation

== Introduction to State Equations

This module covers root-locus analysis and design, a powerful graphical method for analyzing and designing control systems. 

#pause
*Key Objectives:*
- Understand the solution of time-invariant state equations.
- Examine how closed-loop poles move as system parameters vary.
- Learn general rules for constructing Root Locus diagrams.
- Apply Root Locus analysis to control system design.

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
  #block(fill: rgb("#e6f0fa"), inset: 12pt, radius: 4pt, stroke: 1pt + rgb("#0033a0"))[
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

= Solved Problems

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
