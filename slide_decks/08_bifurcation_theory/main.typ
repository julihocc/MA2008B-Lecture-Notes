#import "../_theme.typ" as theme
#import "../../utils.typ": *

#theme.slide_setup()

#theme.title_slide(
  "Bifurcation Theory",
  "Hopf, Saddle-Node, and Pathways to Diabetes",
  "MA2008B - Nonlinear Dynamics and Control",
  "2026",
)

#theme.slide("Roadmap", [
  - Bifurcation as qualitative change under parameter variation
  - Hopf bifurcation: onset/loss of oscillations
  - Saddle-node bifurcation: fold and branch annihilation
  - Hysteresis, irreversibility, and clinical interpretation
], footer: "Chapter 8")

#theme.slide("Learning Objectives", [
  By the end of this chapter, you should be able to:
  - State rigorous Hopf conditions in planar systems
  - Distinguish supercritical and subcritical Hopf via $ell_1$
  - Derive fold (saddle-node) conditions from $Phi(G, R)=0$
  - Interpret bifurcation diagrams in glucose-insulin dynamics
], footer: "Objectives")

#theme.section_slide("Part I", "Hopf Bifurcation")

#theme.slide("Hopf in Planar Systems", [
  For a sufficiently smooth system $dot(x)=f(x, mu)$ with Jacobian $A(mu)$ at equilibrium:
  - $tau(mu) = "tr"(A(mu))$
  - $Delta(mu) = det(A(mu))$

  Hopf at $mu=mu_c$ requires:
  - $tau(mu_c)=0$
  - $Delta(mu_c)>0$
  - $d tau / d mu (mu_c) != 0$

  Then eigenvalues cross as $lambda_(1,2)=plus.minus i omega_0$ with
  $omega_0 = sqrt(Delta(mu_c))$.
], footer: "Mathematical Review")

#theme.slide("Supercritical vs Subcritical", [
  #theme.definition("First Lyapunov Coefficient", [
    For sufficiently smooth planar systems, the sign of $ell_1$ determines the local Hopf type.
  ])

  - $ell_1 < 0$: supercritical Hopf, stable limit cycle emerges
  - $ell_1 > 0$: subcritical Hopf, unstable cycle and hard transition

  #theme.keypoint([
    Same trace crossing can lead to smooth adaptation or catastrophic regime shift.
  ])
], footer: "Mathematical Review")

#theme.section_slide("Part II", "Saddle-Node and Diabetes")

#theme.slide("Fold Conditions and Geometry", [
  Reduced equilibrium relation:
  $Phi(G, R)=0$.

  Saddle-node at $(G_c, R_c)$:
  - $Phi(G_c,R_c)=0$
  - $partial Phi / partial G (G_c,R_c)=0$
  - $partial^2 Phi / partial G^2 (G_c,R_c) != 0$
  - $partial Phi / partial R (G_c,R_c) != 0$

  Local branch form:
  $u_(plus.minus)(r) approx plus.minus sqrt(-(beta/gamma) r)$,
  showing branch collision and disappearance.
], footer: "Mathematical Review")

#theme.slide("Clinical Interpretation", [
  In glucose-insulin regulation:
  - Healthy stable branch $P_1$
  - Unstable threshold branch $P_2$
  - Diabetic attracting branch $P_3$

  At $R=R_c$, $P_1$ and $P_2$ annihilate (fold).

  #theme.keypoint([
    After crossing the fold, small rollback in $R$ may not restore health: this is hysteresis.
  ])
], footer: "Pathways to Diabetes")

#theme.slide("Takeaways", [
  - Hopf controls oscillation onset through eigenvalue crossing
  - Saddle-node controls equilibrium existence through fold geometry
  - Stability and bifurcation analysis convert physiology into testable dynamical predictions
], footer: "Chapter 8 Summary")
