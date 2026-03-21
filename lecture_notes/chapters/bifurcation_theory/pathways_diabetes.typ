#import "../../../utils.typ": *
== Pathways to Diabetes: A Bifurcation Perspective

=== Mathematical Review

#definition[Saddle-Node Bifurcation][
  As a bifurcation parameter $mu$ (e.g., insulin resistance $R$) increases, the two equilibria $P_1$ (stable healthy node) and $P_2$ (unstable saddle) approach each other. At the critical value $mu = mu_c$ they *collide and annihilate*, leaving only $P_3$ (diabetic). This is a saddle-node bifurcation.
]

#definition[Parametric Sensitivity and "Point of No Return"][
  Before $mu_c$, the system is multistable: trajectories starting near $P_1$ remain healthy, while those past the separatrix converge to $P_3$. At $mu > mu_c$, there is no $P_1$ at all — the patient is mathematically locked into the diabetic basin.
]

=== Solved Problems

#solved_problem[Bifurcation Diagram Interpretation][
  In a glucose-insulin model, the healthy equilibrium $G_1^*(R)$ depends on insulin resistance $R$. As $R$ increases, $G_1^*$ rises. At a critical $R_c$, $G_1^*$ and an unstable $G_2^*(R)$ meet and merge. Describe the bifurcation diagram.
]
#solution[
  Plot $G^*$ on the vertical axis versus $R$ on the horizontal axis. The stable $P_1$ branch rises gently. The unstable $P_2$ branch descends. At $R = R_c$ they merge at a "fold point" — the saddle-node bifurcation. For $R > R_c$ only the diabetic $P_3$ branch persists.
]

=== Supplementary Problems

#supplementary[Hysteresis and Irreversibility][
  Explain why a patient who crosses $R = R_c$ cannot simply reverse the disease by reducing insulin resistance back slightly below $R_c$. How does the concept of hysteresis in bifurcation diagrams explain the clinical difficulty of reversing Type 2 Diabetes?
]
