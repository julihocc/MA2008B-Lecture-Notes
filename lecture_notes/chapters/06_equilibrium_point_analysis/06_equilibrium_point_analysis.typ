#import "../../../utils.typ": *

= Equilibrium Point Analysis

This chapter analyzes equilibrium points in nonlinear systems with a special focus on physiological vs. pathological steady states, including the Topp/Mohammed metabolic models _(Topp et al., J. Theor. Biol. 206(4):605–619, 2000)_.
// TODO: Add full citation for Mohammed et al. model variant.

*Learning objectives:*
- Identify planar nullclines and equilibrium points from nonlinear vector fields.
- Use Jacobian-based linearization to classify local equilibrium behavior.
- Connect phase-plane structure to biological interpretation in metabolic and excitable systems.
- Relate parameter changes to saddle-node mechanisms in physiological state transitions.

== Application: Vector Fields and Phase Portraits in 2D Systems

In this section, we expand our mathematical toolkit to visualize the global behavior of two-dimensional nonlinear systems using phase portraits and vector fields. While our core focus is the geometric analysis of dynamical systems, we apply these techniques to classical biological and ecological models. A key mathematical distinction in these applications is the restriction of the state space: variables such as population densities or chemical concentrations are inherently strictly non-negative, confining our analysis to the first quadrant $RR_+^2$.

=== Mathematical Definitions

#definition[Vector Fields and Trajectories][
  Consider an autonomous planar system:
  $ x' &= f(x,y) \ y' &= g(x,y) $
  where $f, g: RR^2 -> RR$ are continuously differentiable ($C^1$). This system assigns a velocity vector $(f(x,y), g(x,y))$ to every point $(x,y)$ in the relevant domain. The set of all such vectors constitutes the *vector field*. A solution curve, or *trajectory*, $(x(t), y(t))$ plotted in the $x y$-phase plane is always tangent to the vector field at every point.
]

#definition[Nullclines and Equilibria Geometry][
  Nullclines are the geometric curves in the phase plane where the vector field is exclusively horizontal or vertical.
  - The *x-nullcline* is the set of points where $x' = f(x,y) = 0$. The vector field is purely vertical.
  - The *y-nullcline* is the set of points where $y' = g(x,y) = 0$. The vector field is purely horizontal.

  Mathematically, equilibrium points are strictly located at the intersections of the $x$-nullclines and $y$-nullclines.
]

=== Canonical Models

#definition[The FitzHugh-Nagumo Excitable System][
  The original Hodgkin-Huxley framework is a conductance-based biophysical model for membrane electrophysiology. In modern notation, it combines one voltage equation with three gating-variable equations, producing a four-dimensional nonlinear system that tracks ionic currents (mainly sodium and potassium) and their channel kinetics.
  // TODO: cite [Hodgkin and Huxley, 1952]

  In this chapter, our goal is phase-plane geometry and equilibrium analysis. For that reason, we use a reduced two-dimensional model that preserves the key fast-slow mechanism of excitability while remaining visually analyzable in the $(v,w)$ plane.

  The FitzHugh-Nagumo model _(FitzHugh, Biophys. J. 1(6):445–466, 1961; Nagumo et al., Proc. IRE 50(10):2061–2070, 1962)_ is a simplified 2D mathematical reduction of the Hodgkin-Huxley equations for neuronal action potentials. The system couples a fast variable $v(t)$ to a slow recovery variable $w(t)$:
  $ v' &= v - v^3 / 3 - w + I_"ext" \ w' &= epsilon (v + a - b w) $
  where $I_"ext"$ is an applied stimulus current, and $0 < epsilon lt.double 1$ induces a separation of time scales. 

  *Biological interpretation of the variables and parameters:*
  - $v(t)$: dimensionless membrane-potential variable. A rapid increase in $v$ represents the upstroke of an action potential (neuronal firing), while a decrease represents repolarization.
  - $w(t)$: recovery (or adaptation) variable that aggregates slower ionic processes, mainly potassium activation and sodium inactivation effects.
  - $I_"ext"$: external current input modeling synaptic drive, electrical stimulation, or an equivalent net input from surrounding tissue.
  - $a, b$: shape parameters that shift and scale the recovery nullcline, controlling firing threshold and excitability regime.
  - $epsilon$: time-scale ratio between fast voltage dynamics and slow recovery; smaller $epsilon$ produces clearer fast-slow behavior.

  *Physiological meaning in the phase plane:*
  In this model, resting behavior corresponds to trajectories attracted to a stable equilibrium (quiescent neuron). Repetitive spiking corresponds to trajectories attracted to a stable limit cycle. A transient but sufficiently strong increase in $I_"ext"$ can push the state across a threshold manifold, triggering a large excursion in phase space that represents an action potential before recovery returns the system toward rest.

  *Context:* Physically, $v$ represents the cell membrane voltage and $w$ governs the recovery of ion channels. Mathematically, analyzing the intersection of the cubic $v$-nullcline and the linear $w$-nullcline allows us to geometrically predict phenomena such as excitability, threshold loops, and continuous bursting (limit cycles).
]

=== Solved Problems

#solved_problem[Lotka-Volterra Predator-Prey Phase Portrait][
  Consider the classic Lotka-Volterra equations modeling the mathematical dynamics between a prey population $x(t)$ and a predator population $y(t)$:
  $ x' &= a x - b x y \ y' &= -c y + d x y $
  where $a,b,c,d > 0$ are constants related to growth, predation, and death rates. Find the nullclines, locate the equilibria in $RR_+^2$, and describe the vector field orientation in each region.
]
#solution[
  *1. Nullcline Equations:*
  Set $x' = x(a - b y) = 0 => x=0$ or $y = a/b$. These form the $x$-nullclines.
  Set $y' = y(-c + d x) = 0 => y=0$ or $x = c/d$. These form the $y$-nullclines.

  *2. Equilibrium Points:*
  The intersections of the orthogonal nullcline sets yield two equilibria: the origin $(0,0)$ (extinction state) and the interior co-existence point $(c/d, a/b)$.

  *3. Regional Vector Field Analysis:*
  The internal horizontal and vertical nullclines $x = c/d$ and $y = a/b$ intersect, dividing the interior of the first quadrant into four distinct regions:
  - *Bottom-Left ($x < c/d, y < a/b$):* $x'>0$ and $y'<0$. The vector field points Right and Down.
  - *Bottom-Right ($x > c/d, y < a/b$):* $x'>0$ and $y'>0$. The vector field points Right and Up.
  - *Top-Right ($x > c/d, y > a/b$):* $x'<0$ and $y'>0$. The vector field points Left and Up.
  - *Top-Left ($x < c/d, y > a/b$):* $x'<0$ and $y'<0$. The vector field points Left and Down.

  By continuously following the direction of the vector field arrows across the regional boundaries, we deduce that the trajectories must rotate counter-clockwise around the interior equilibrium $(c/d, a/b)$.

  *Important Mathematical Note:* Simply showing rotation is insufficient to prove the existence of closed periodic cycles, nor does the linear center analysis guarantee it (due to structural instability of linear centers). However, constructing a first integral (a constant of motion) $V(x,y) = d x - c ln x + b y - a ln y$ rigorously establishes that the orbits form strictly closed concentric curves _(cf. Strogatz, Nonlinear Dynamics and Chaos, §6.4; Murray, Mathematical Biology, Vol. I, §3.1)_.
]

=== Supplementary Problems

#supplementary[Competitive Exclusion Principle Phase Analysis][
  Two species $x(t)$ and $y(t)$ competing for the same limited resource can be modeled by the Lotka-Volterra competition system:
  $ x' &= r_1 x(1 - x - alpha y) \ y' &= r_2 y(1 - y - beta x) $
  Sketch the corresponding nullclines for the case where $alpha > 1$ and $beta > 1$ (representing strong inter-species competition). Use phase plane geometry to visually demonstrate that the interior co-existence equilibrium is a saddle point, providing mathematical justification for the ecological principle of competitive exclusion _(Hardin, Science 131:1292–1297, 1960; Gause, The Struggle for Existence, 1934)_ (i.e., almost all trajectories converge to either $(1,0)$ or $(0,1)$).
  *Hint:* Compute all equilibria first, then use the Jacobian determinant at the interior point to verify saddle behavior.
]

#supplementary[Directional Field Sign Analysis in a Cubic-Linear System][
  Consider the planar nonlinear system:
  $ x' &= x - x^3 - y \ y' &= mu (x - y) $
  with parameter $mu > 0$.
  1. Compute the $x$-nullcline and $y$-nullcline equations.
  2. Determine all equilibrium points as functions of $mu$.
  3. Partition the phase plane using nullclines and determine the sign of $(x', y')$ in each region.
  4. State whether the first and third quadrants are forward invariant and justify your answer mathematically.
  *Hint:* Use nullcline intersections to form sign regions and test the vector field orientation on each boundary.
]

#supplementary[Linearization and Local Type of Equilibria][
  For the system
  $ x' &= x(1 - x) - a y \ y' &= y(-1 + b x) $
  with $a, b > 0$:
  1. Find all equilibrium points in $RR_+^2$.
  2. Compute the Jacobian matrix at each equilibrium.
  3. Classify each equilibrium (node, saddle, focus, or center) using trace-determinant criteria.
  4. Identify parameter conditions under which an interior equilibrium changes stability.
  *Hint:* After finding equilibria, evaluate $text("tr")(J)$ and $det(J)$ symbolically before substituting parameter values.
]

#supplementary[Bendixson-Dulac Exclusion of Closed Orbits][
  Consider the system
  $ x' &= x(2 - x - y) \ y' &= y(-1 + x - y) $
  on the simply connected domain $Omega = {(x,y) in RR^2 : x > 0, y > 0}$.
  1. Compute the divergence $partial f / partial x + partial g / partial y$.
  2. Use the Bendixson criterion to determine whether periodic orbits can exist in $Omega$.
  3. If the criterion is inconclusive for some parameterized variation, propose a Dulac function $B(x,y)$ and test again.
  *Hint:* Check whether the divergence has one strict sign on the whole first-quadrant domain.
]

#supplementary[FitzHugh-Nagumo Excitability Threshold Exercise][
  For the FitzHugh-Nagumo system
  $ v' &= v - v^3 / 3 - w + I_"ext" \ w' &= epsilon (v + a - b w), $
  assume $a, b, epsilon > 0$ and $0 < epsilon lt.double 1$.
  1. Derive explicit formulas for the $v$- and $w$-nullclines.
  2. Show how the number of equilibrium points depends on the relative position of the cubic and linear nullclines.
  3. Explain, using phase-plane geometry, how a transient increase in $I_"ext"$ can trigger a large excursion (spike) before returning near rest.
  4. Sketch a qualitative portrait for one quiescent regime and one oscillatory regime.
  *Hint:* Treat $I_"ext"$ as a vertical shift of the cubic nullcline and track intersection multiplicity.
]

== Application: Equilibrium Point Analysis in Biological Models

In this section, we apply the mathematical tools of equilibrium point analysis to a nonlinear system of ordinary differential equations. While our primary focus remains on the mathematical methods—identifying equilibria, computing Jacobians, and determining local asymptotic stability—contextualizing these models provides concrete examples of multiple equilibria and bifurcation phenomena. To achieve this, we will briefly introduce the biological meaning of the variables in our model so that the mathematical equations have a clear physical interpretation.

=== The Topp Model of Glucose-Insulin Dynamics

We consider a mathematical model defined on the state space $cal(X) subset RR_+^3$ by the following autonomous vector field $x' = F(x)$:

#definition[The Extended Topp Model _(Topp et al., J. Theor. Biol. 206(4):605–619, 2000)_][
  Let the state vector be $x(t) = (G(t), I(t), beta(t))^T$. These variables represent:
  - $G(t)$: Blood glucose concentration (sugar in the blood).
  - $I(t)$: Blood insulin concentration (hormone that regulates sugar).
  - $beta(t)$: Pancreatic $beta$-cell mass (the cells that produce insulin).

  The system dynamics are governed by:
  $
    G'    &= P_G - k_1 G - k_2 I G \
    I'    &= beta f(G) - gamma I \
    beta' &= beta (r(G) - d(G))
  $
  where all parameters are strictly positive constants with the following biological interpretations:
  - $P_G$: Constant glucose production rate (e.g., produced by the liver).
  - $k_1$: Insulin-independent glucose utilization rate (sugar consumed constantly by organs like the brain).
  - $k_2$: Insulin-dependent glucose utilization rate (sugar consumed by muscles when insulin is present).
  - $gamma$: Insulin clearance rate (how fast insulin is removed from the blood).

  The functions $f(G)$, $r(G)$, and $d(G)$ are sufficiently smooth ($C^1$) non-negative scalar functions representing insulin secretion, $beta$-cell replication, and $beta$-cell death (apoptosis) rates, respectively.
]

In many practical analyses, $beta(t)$ evolves on a much slower timescale than $G(t)$ and $I(t)$. By invoking timescale separation, we treat $beta$ as a constant parameter ($beta equiv beta_0$), reducing the system to a two-dimensional planar subsystem.

=== Mathematical Definitions of Biological States

Biological states are mathematically defined by the equilibrium points of the system and their stability properties. Let $x^* = (G^*, I^*)$ be an equilibrium point of the planar subsystem, satisfying $F(x^*) = 0$.

#definition[Stable Homeostatic State (Normoglycemia)][
  An equilibrium point $x_1^*$ is defined as the *healthy state* (or "normoglycemia") if glucose is at a healthy resting level ($G^* approx 90$ mg/dL; _ADA Standards of Medical Care in Diabetes_, 2024) and the point is locally asymptotically stable. Mathematically, this implies that the Jacobian matrix $J(x_1^*)$ has eigenvalues $lambda_1, lambda_2$ satisfying $max(text("Re")(lambda_1), text("Re")(lambda_2)) < 0$.
]

#definition[Attracting Pathological State (Diabetes)][
  An equilibrium point $x_3^*$ is defined as the *pathological state* (Type 2 Diabetes) if it exhibits chronic high blood sugar ($G^* gt.double 90$ mg/dL), associated with a severely depleted capacity to produce insulin (a very low parameter $beta_0$). If $x_3^*$ is locally asymptotically stable, trajectories originating within its basin of attraction $cal(B)(x_3^*)$ will strictly converge to $x_3^*$ as $t -> oo$, mathematically representing a chronic disease state.
]

=== Solved Problems

#solved_problem[Nullcline Intersection and Equilibria][
  Consider the $(G, I)$ planar subsystem with constant $beta_0$. Determine the algebraic equations for the nullclines and outline the procedure to locate the equilibrium points.
]
#solution[
  The equilibrium points $(G^*, I^*)$ are solutions to the nonlinear algebraic system:
  $ P_G - k_1 G - k_2 I G = 0 \
  beta_0 f(G) - gamma I = 0 $

  Isolating $I$ yields the nullcline equations:
  1. *The $G$-nullcline*: $I = (P_G - k_1 G) / (k_2 G)$.
  2. *The $I$-nullcline*: $I = (beta_0 f(G)) / gamma$.

  The phase-plane equilibria correspond to the intersections of these two curves. Substituting the $I$-nullcline into the $G$-nullcline yields a single nonlinear algebraic equation in $G$:
  $ P_G - k_1 G - k_2 G ((beta_0 f(G)) / gamma) = 0 $
  The positive real roots of this equation determine the $G$-coordinates of the equilibrium points.
]

#solved_problem[Numerical Computation and Saddle-Node Bifurcation][
  Given the parameter values: $P_G = 864$, $k_1 = 1.44$, $k_2 = 36$, $gamma = 0.2$, $beta_0 = 1.0$, and the non-linear function $f(G) = G^2/(13000 + G^2)$ _(adapted from Topp et al., J. Theor. Biol. 206(4):605–619, 2000)_. Compute the equilibrium points mathematically.
]
#solution[
  Substituting the given functions and parameters into the intersection equation:
  $ 864 - 1.44 G - 36 G ((1.0 dot G^2)/(13000 + G^2) dot 1/0.2) = 0 $
  $ 864 - 1.44 G - (180 G^3)/(13000 + G^2) = 0 $
  Multiplying by the non-zero denominator $(13000 + G^2)$ yields a cubic polynomial equation:
  $ 864 (13000 + G^2) - 1.44 G (13000 + G^2) - 180 G^3 = 0 $
  $ -181.44 G^3 + 864 G^2 - 18720 G + 11232000 = 0 $

  Solving this cubic polynomial numerically yields three real positive roots, corresponding to three equilibria:
  - $x_1^*$ where $G_1^* approx 100$. (Stable Node)
  - $x_2^*$ where $G_2^* approx 250$. (Unstable Saddle)
  - $x_3^*$ where $G_3^* approx 600$. (Stable Node)

  *Bifurcation Analysis:* Treating $beta_0$ as a bifurcation parameter, a decrease in $beta_0$ translates the $I$-nullcline. Through a saddle-node bifurcation at a critical value $beta_0 = beta_c$, the stable point $x_1^*$ and saddle point $x_2^*$ collide and annihilate, leaving $x_3^*$ as the unique global equilibrium.
]

=== Supplementary Problems

#supplementary[Jacobian Matrix and Local Stability][
  For the planar $(G, I)$ subsystem with constant $beta_0$:
  1. Compute the analytical Jacobian matrix $J(G,I)$ evaluated at an arbitrary point $(G, I)$.
  2. For the three numerically computed equilibrium points $x_1^*, x_2^*, x_3^*$, evaluate the Jacobian matrix.
  3. Compute the trace, determinant, and eigenvalues of each matrix to rigorously classify the local asymptotic stability of each equilibrium point.
  *Hint:* Derive $J(G,I)$ once in symbolic form and reuse it at each equilibrium.
]

#supplementary[Positivity and Forward Invariance of the Physiological Region][
  Consider the reduced planar subsystem
  $ G' &= P_G - k_1 G - k_2 I G \ I' &= beta_0 f(G) - gamma I, $
  with $P_G, k_1, k_2, beta_0, gamma > 0$ and $f(G) >= 0$ for $G >= 0$.
  1. Prove that the non-negative set $RR_+^2$ is forward invariant.
  2. Evaluate the vector field on the boundaries $G=0$ and $I=0$.
  3. Explain the biological interpretation of forward invariance in terms of glucose and insulin concentrations.
  *Hint:* Show that boundary vector components point inward or tangent on each coordinate axis.
]

#supplementary[Existence of Equilibria via a Scalar Intersection Equation][
  Starting from the nullcline substitution
  $ P_G - k_1 G - k_2 G ((beta_0 f(G)) / gamma) = 0, $
  define
  $Phi(G) = P_G - k_1 G - (k_2 beta_0 / gamma) G f(G).$
  1. Show that equilibria correspond to positive roots of $Phi(G)=0$.
  2. Under mild assumptions on $f$ (continuous, bounded, non-negative), show that at least one positive equilibrium exists.
  3. Give sufficient graphical conditions for having one versus three positive roots.
  *Hint:* Compare $Phi(0)$ and $Phi(G)$ for large $G$, then apply the intermediate value theorem.
]

#supplementary[Parameter Sensitivity of the Healthy Equilibrium][
  Assume $x_1^* = (G_1^*, I_1^*)$ is a stable equilibrium branch parameterized by $beta_0$.
  1. Using implicit differentiation of the equilibrium equation, derive an expression for $d G_1^* / d beta_0$.
  2. Determine the sign of $d G_1^* / d beta_0$ under biologically reasonable assumptions on $f$.
  3. Interpret the result in terms of how reduced $beta$-cell function shifts the glycemic steady state.
  *Hint:* Differentiate $Phi(G_1^*(beta_0), beta_0)=0$ with respect to $beta_0$ and isolate $d G_1^* / d beta_0$.
]

#supplementary[Local Bifurcation Condition at a Fold Point][
  Let $Phi(G, beta_0) = P_G - k_1 G - (k_2 beta_0 / gamma) G f(G)$.
  1. Write the algebraic conditions that characterize a saddle-node (fold) bifurcation in this scalar reduced equation.
  2. Express these conditions as simultaneous equations in $(G_c, beta_c)$ using $Phi(G_c, beta_c)=0$ and $partial Phi / partial G (G_c, beta_c)=0$.
  3. Explain why these conditions correspond to the collision and disappearance of two equilibria in the full planar system.
  *Hint:* At a fold, the graph of $Phi(G, beta_0)$ is tangent to the horizontal axis at the critical root.
]
