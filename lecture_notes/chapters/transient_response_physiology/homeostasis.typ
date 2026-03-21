#import "../../../utils.typ": *
== Homeostasis as Biological Steady State

=== Mathematical Review

#definition[Homeostasis][
  The self-regulatory process by which a biological system maintains its internal state near a reference set-point despite external disturbances. Formally, a system is homeostatic if its equilibrium $x^*$ is stable: $lim_{t -> infinity} x(t) = x^*$ for all initial conditions in a neighborhood.
]

#definition[Type 1 Biological Regulation][
  For a system to exhibit zero steady-state error to persistent disturbances (e.g., constant glucose intake), it must act as a Type 1 controller — i.e., possess at least one integrator in the closed-loop. Endocrine systems often achieve this through integral-like feedback (slow protein synthesis and degradation).
]

=== Solved Problems

#solved_problem[Homeostatic Controller Classification][
  A simple hormone system follows $H'(t) = -a H + b (G - G_0)$ where $H$ is hormone level, $G$ is glucose, and $G_0$ is the set-point. Identify the control action type.
]
#solution[
  This is a *proportional* controller. The hormone output is proportional to the current error $(G - G_0)$. In steady state: $H^* = b(G^* - G_0)/a$. If $G^* != G_0$, there is a non-zero steady-state error.
]

=== Supplementary Problems

#supplementary[Integral Adaptation][
  Modify the above system so that it adds an integral term. Show how this eliminates steady-state error even in the presence of a constant glucose disturbance.
]
