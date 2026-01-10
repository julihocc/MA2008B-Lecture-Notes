#import "../../utils.typ": *
== Block Diagrams and Signal Flow Graphs

=== Mathematical Review

*Block Diagrams* graphically represent systems where functional blocks are connected by signals.

#definition[Block Diagram Algebra][
  - *Series:* $G_{eq}(s) = G_1(s) G_2(s)$
  - *Parallel:* $G_{eq}(s) = G_1(s) + G_2(s)$
  - *Feedback Loop:* For negative feedback $H(s)$, the closed-loop transfer function is:
    $ T(s) = G(s) / (1 + G(s)H(s)) $
]

#example[System in Series][
  Two blocks $G_1(s) = s$ and $G_2(s) = 1/s$ in series give $G_{eq}(s) = s dot (1/s) = 1$.
]

*Signal Flow Graphs (SFG)* are directed graphs where nodes represent variables and branches represent gains. *Mason's Gain Formula* computes the transfer function of an SFG.

=== Solved Problems

#problem[Feedback Reduction][
  A system has forward path $G(s) = K / (s+1)$ and unity negative feedback ($H(s)=1$). Find the closed loop transfer function $T(s)$.
]
#solution[
  Using the feedback formula:
  $ T(s) = G(s) / (1 + G(s)) = (K / (s+1)) / (1 + K / (s+1)) $
  Multiply numerator and denominator by $(s+1)$:
  $ T(s) = K / (s + 1 + K) $
]

#problem[Mason's Rule Application][
  Find the transfer function $C/R$ for a simple loop with forward gain $G$ and feedback $H$.
]
#solution[
  - Forward paths: $P_1 = G$.
  - Loops: $L_1 = -G H$.
  - Determinant $Delta = 1 - (sum L_i) = 1 - (-G H) = 1 + G H$.
  - Path cofactor $Delta_1 = 1$ (loop touches the path).
  - Result: $T = (P_1 Delta_1) / Delta = G / (1 + G H)$.
]

=== Supplementary Problems

#supplementary[Multiple Loops][
  Simplify a block diagram with two nested feedback loops.
]

#supplementary[Signal Flow Construction][
  Draw the Signal Flow Graph corresponding to the equations: $x_2 = a x_1 + b x_3$, $x_3 = c x_2$.
]
