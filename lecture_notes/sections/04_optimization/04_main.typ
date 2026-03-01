#import "../../../utils.typ": *
= System Optimization

This module covers root-locus analysis and design, a powerful graphical method for analyzing and designing control systems by examining how closed-loop poles move as system parameters vary.

Throughout this module, we use $s in CC$ for the complex variable and $K in RR$ for the primary real parameter. Characteristic equations are written as $Delta(s,K)=0$, often in the affine form $Delta(s,K)=P(s)+K Q(s)=0$. When $P(s) != 0$, we use the normalized representation $1+K F(s)=0$ with $F(s)=Q(s)/P(s)$. In control-design sections, the open-loop model is denoted by $L(s)$.

#include "4.1_time_invariant_solution.typ"
#include "4.2_root_locus_analysis.typ"
#include "4.3_root_locus_plots.typ"
#include "4.4_construction_rules.typ"
#include "4.5_control_system_root_locus.typ"
#include "4.6_root_contour_diagrams.typ"
