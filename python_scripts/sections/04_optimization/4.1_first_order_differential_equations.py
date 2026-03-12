# %% [markdown]
# # 4.1 First-Order Differential Equations
# Computational companion aligned with the current notes:
# - IVP existence/uniqueness checks
# - phase-line and equilibrium stability
# - 1D bifurcation branch classification

# %%
import sympy as sp


def print_header(title: str) -> None:
    print(f"\n{'=' * 78}\n{title}\n{'=' * 78}")


# %% [markdown]
# ## Setup

# %%
t = sp.symbols("t", real=True)
x = sp.symbols("x", real=True)
lam = sp.symbols("lam", real=True)


# %% [markdown]
# ## Solved Problem: Linear IVP with Integrating Factor

# %%
x_linear = 2 - sp.exp(-2 * t)
residual_linear = sp.simplify(sp.diff(x_linear, t) + 2 * x_linear - 4)

print_header("4.1 Solved: Linear IVP with Integrating Factor")
print("x(t) =", x_linear)
print("Residual x' + 2x - 4 =", residual_linear)


# %% [markdown]
# ## Solved Problem: Equilibria and Stability for x' = x(1-x)

# %%
f_logistic = x * (1 - x)
df_logistic = sp.diff(f_logistic, x)
eq_logistic = sp.solve(sp.Eq(f_logistic, 0), x)

print_header("4.1 Solved: Equilibria and Stability for x' = x(1-x)")
print("Equilibria:", eq_logistic)
for eq in eq_logistic:
    val = sp.simplify(df_logistic.subs(x, eq))
    status = "locally asymptotically stable" if val < 0 else "unstable" if val > 0 else "inconclusive"
    print(f"x* = {eq}: f'(x*) = {val} -> {status}")


# %% [markdown]
# ## Solved Problem: Phase-Line Construction

# %%
f_phase = x * (x - 2) * (3 - x)
eq_phase = sp.solve(sp.Eq(f_phase, 0), x)
interval_points = [-1, 1, sp.Rational(5, 2), 4]

print_header("4.1 Solved: Phase-Line Construction")
print("Equilibria:", eq_phase)
for p in interval_points:
    sign = sp.sign(sp.simplify(f_phase.subs(x, p)))
    direction = "right" if sign > 0 else "left" if sign < 0 else "equilibrium"
    print(f"Sample x = {p}: f(x) sign = {sign} -> arrow {direction}")


# %% [markdown]
# ## Solved Problem: Classical Logistic IVP

# %%
r, K, x0 = sp.symbols("r K x0", positive=True, real=True)
x_logistic_ivp = K / (1 + ((K - x0) / x0) * sp.exp(-r * t))

print_header("4.1 Solved: Classical Logistic IVP")
print("x(t) =", sp.simplify(x_logistic_ivp))


# %% [markdown]
# ## Solved Problem: Saddle-Node Bifurcation and Stability

# %%
f_sn = lam - x**2
eq_sn = sp.solve(sp.Eq(f_sn, 0), x)
df_sn = sp.diff(f_sn, x)

print_header("4.1 Solved: Saddle-Node Bifurcation")
print("f_lam(x) = lam - x^2")
print("Equilibrium branches:", eq_sn)
print("f'_lam(x) =", df_sn)
print("f'_lam(+sqrt(lam)) =", sp.simplify(df_sn.subs(x, sp.sqrt(lam))))
print("f'_lam(-sqrt(lam)) =", sp.simplify(df_sn.subs(x, -sp.sqrt(lam))))
print("At lam = 0: f'_0(0) =", sp.simplify(df_sn.subs({lam: 0, x: 0})))


# %% [markdown]
# ## Solved Problem: Pitchfork Bifurcation Analysis

# %%
f_pf = lam * x - x**3
eq_pf = sp.solve(sp.Eq(f_pf, 0), x)
df_pf = sp.diff(f_pf, x)

print_header("4.1 Solved: Pitchfork Bifurcation")
print("f_lam(x) = lam*x - x^3")
print("Equilibrium branches:", eq_pf)
print("f'_lam(x) =", df_pf)
print("f'_lam(0) =", sp.simplify(df_pf.subs(x, 0)))
print("f'_lam(+/-sqrt(lam)) =", sp.simplify(df_pf.subs(x, sp.sqrt(lam))))
print("At lam = 0: f'_0(0) =", sp.simplify(df_pf.subs({lam: 0, x: 0})))


# %% [markdown]
# ## Solved Problem: Transcritical Bifurcation Analysis

# %%
f_tc = lam * x - x**2
eq_tc = sp.solve(sp.Eq(f_tc, 0), x)
df_tc = sp.diff(f_tc, x)

print_header("4.1 Solved: Transcritical Bifurcation")
print("f_lam(x) = lam*x - x^2")
print("Equilibrium branches:", eq_tc)
print("f'_lam(x) =", df_tc)
print("f'_lam(0) =", sp.simplify(df_tc.subs(x, 0)))
print("f'_lam(lam) =", sp.simplify(df_tc.subs(x, lam)))
print("At lam = 0: f'_0(0) =", sp.simplify(df_tc.subs({lam: 0, x: 0})))


# %% [markdown]
# ## Solved Problem: Finite-Time Blow-up

# %%
# Consider x' = x^2, x(0) = x0 > 0
x0_val = sp.symbols("x0_val", positive=True, real=True)
x_blowup = 1 / (1 / x0_val - t)

print_header("4.1 Solved: Finite-Time Blow-up")
print("IVP: x' = x^2, x(0) = x0 > 0")
print("Solution x(t) =", x_blowup)
print("Blow-up occurs at t_infinity =", 1 / x0_val)


# %% [markdown]
# ## Supplementary Template Runner

# %%
def run_supplementary_examples() -> None:
    print_header("4.1 Supplementary: Existence vs Uniqueness Check")
    f = t**2 + x**2
    dfdx = sp.diff(f, x)
    print("f(t,x) =", f)
    print("(partial f)/(partial x) =", dfdx)
    print("Both are continuous on bounded rectangles -> local existence + uniqueness.")

    print_header("4.1 Supplementary: Non-uniqueness Counterexample")
    f_nonunique = sp.sqrt(sp.Abs(x))
    print("For f(x) = sqrt(abs(x)): f(0) =", f_nonunique.subs(x, 0))
    print("f(x) is continuous at x=0 but not locally Lipschitz there.")
    print("Therefore uniqueness may fail for x(0)=0.")


run_supplementary_examples()
