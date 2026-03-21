#import "../../../utils.typ": *
== Biological Rhythms and Oscillations in Physiology

=== Mathematical Review

Biological systems exhibit intrinsic oscillatory behavior that can be characterised using frequency-domain tools identical to those in classical control engineering.

#definition[Circadian and Ultradian Rhythms][
  Biological oscillations classified by period $T$:
  - *Ultradian* ($T < 24$ hr): Insulin pulsatile secretion ($T approx 5$–$15$ min), cardiac cycle.
  - *Circadian* ($T approx 24$ hr): Cortisol, melatonin, fasting glucose levels.
  - *Infradian* ($T > 24$ hr): Monthly hormonal cycles.

  Each corresponds to a dominant frequency $omega_0 = 2pi/T$ that can be identified from a *power spectral density (PSD)* plot of the signal $G(t)$ or $I(t)$.
]

#definition[Biological Transfer Function — Pulsatile Secretion][
  Pulsatile insulin secretion can be modelled as a periodic forcing function applied to the glucose-insulin loop. If the glucose-insulin system has transfer function $H(j omega)$, then the steady-state insulin amplitude at stimulation frequency $omega$ is:
  $ |I(j omega)| = |H(j omega)| dot |U(j omega)| $
  Resonance occurs when $omega approx omega_n$ (the natural frequency of the closed-loop system), potentially amplifying oscillations and disrupting homeostasis.
]

#theorem[Nyquist Criterion Applied to Glucose Regulation][
  The closed-loop glucose-insulin system is stable if and only if the open-loop transfer function $G_"ol"(j omega)$ does not encircle $(-1, 0)$ in the Nyquist diagram. Encirclement indicates that feedback has turned destabilising — corresponding clinically to pathological oscillations (hypoglycaemic episodes) or divergence to chronic hyperglycaemia.
]

=== Solved Problems

#solved_problem[Period of Insulin Micro-Pulses][
  Insulin is secreted in pulses with frequency $f = 0.1$ Hz. Calculate the angular frequency $omega$ and explain what it means if the glucose-insulin closed-loop has a resonant frequency at $omega_n = 0.1$ rad/min.
]
#solution[
  $ omega = 2 pi f = 2 pi times 0.1 approx 0.628 "rad/s" $
  Converting: $omega = 0.628 times 60 approx 37.7$ rad/min. The resonant frequency $omega_n = 0.1$ rad/min is far below the stimulation frequency, so the system filters the high-frequency pulses effectively. No dangerous resonance occurs.
]

=== Supplementary Problems

#supplementary[Circadian Glucose Peak][
  The dawn phenomenon raises fasting glucose levels at approximately 6:00 AM due to cortisol and growth hormone surges. If modelled as a sinusoidal disturbance with $T = 24$ hr, compute its frequency in rad/hr and sketch where it falls on a Bode plot relative to the glucose-insulin crossover frequency $omega_c approx 1$ rad/hr.
]
