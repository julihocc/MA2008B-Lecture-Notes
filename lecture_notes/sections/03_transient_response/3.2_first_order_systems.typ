#import "../../utils.typ": *
== First-Order Systems

=== Mathematical Review

First-order systems are the simplest dynamic systems, characterized by a single energy storage element.

#definition[First-Order Transfer Function][
  Standard form:
  $ G(s) = K/(tau s + 1) $
  where $K$ is DC gain and $tau$ is time constant.
]

#example[RC Circuit][
  For RC circuit: $G(s) = 1/(R C s + 1)$ with $tau = R C$.
]

#theorem[Step Response][
  For unit step input:
  $ y(t) = K(1 - e^(-t/tau)) $
  - Reaches 63.2% of final value at $t = tau$
  - Reaches 95% at $t = 3tau$
  - Reaches 98% at $t = 4tau$
]

#example[Time Constant Calculation][
  For $tau = 2"s"$, $K = 5$:
  - At $t = 2"s"$: $y = 5(1 - e^(-1)) = 3.16$
  - At $t = 6"s"$: $y = 5(1 - e^(-3)) = 4.75$
]

#definition[Performance Metrics][
  - *Rise time ($t_r$):* Time to go from 10% to 90% of final value: $t_r approx 2.2 tau$
  - *Settling time ($t_s$):* Time to stay within 2% of final value: $t_s approx 4 tau$
]

#example[Performance Calculation][
  For $tau = 0.5"s"$:
  - $t_r = 2.2 times 0.5 = 1.1"s"$
  - $t_s = 4 times 0.5 = 2"s"$
]

=== Solved Problems

#solved_problem[Design for Settling Time][
  Design first-order system with $t_s = 0.2"s"$.
]
#solution[
  From $t_s = 4 tau$:
  $ tau = t_s/4 = 0.2/4 = 0.05"s" $

  Transfer function: $G(s) = K/(0.05 s + 1)$
]

#solved_problem[Ramp Response][
  Find steady-state error for ramp input $r(t) = t$ with $G(s) = 2/(s+1)$.
]
#solution[
  For ramp input $R(s) = 1/s^2$:
  $ Y(s) = G(s)R(s) = 2/(s(s+1)) dot 1/s = 2/(s^2(s+1)) $

  Steady-state error:
  $ e_("ss") = lim_(t -> infinity) (r(t) - y(t)) = lim_(s -> 0) s E(s) $
  $ E(s) = R(s) - Y(s) = 1/s^2 - 2/(s^2(s+1)) = (s+1-2)/(s^2(s+1)) = (s-1)/(s^2(s+1)) $
  $ e_("ss") = lim_(s -> 0) s dot (s-1)/(s^2(s+1)) = lim_(s -> 0) (s-1)/(s(s+1)) = -1/0 = infinity $

  First-order system cannot track ramp with zero error.
]

=== Supplementary Problems

#supplementary[Thermal System][
  A room has time constant $tau = 30"min"$. How long to reach 90% of desired temperature?
]

#supplementary[Multiple Time Constants][
  Analyze system with two cascaded first-order blocks.
]
