# %% [markdown]
# # 4.1 First-Order Differential Equations
# Symbolic companion for solved and supplementary problems.

# %%
import sympy as sp


def print_header(title: str) -> None:
    print(f"\n{'=' * 72}\n{title}\n{'=' * 72}")


# %% [markdown]
# ## Solved Problem: Linear IVP with Integrating Factor

# %%
t = sp.Symbol("t", real=True)
mu = sp.exp(2 * t)
x_linear = 2 - sp.exp(-2 * t)

print_header("4.1 Solved Problem: Linear IVP with Integrating Factor")
print(f"Integrating factor mu(t): {mu}")
print(f"x(t): {x_linear}")
print(f"Residual x' + 2x - 4: {sp.simplify(sp.diff(x_linear, t) + 2*x_linear - 4)}")


# %% [markdown]
# ## Solved Problem: Classical Logistic IVP

# %%
r, K, x0 = sp.symbols("r K x0", positive=True, real=True)
x_logistic = K / (1 + ((K - x0) / x0) * sp.exp(-r * t))

print_header("4.1 Solved Problem: Classical Logistic IVP")
print(f"x(t) = {sp.simplify(x_logistic)}")


# %% [markdown]
# ## Solved Problem: Pitchfork Bifurcation Analysis

# %%
lam, x = sp.symbols("lam x", real=True)
f = lam * x - x**3
df = sp.diff(f, x)
equilibria = sp.solve(sp.Eq(f, 0), x)

print_header("4.1 Solved Problem: Pitchfork Bifurcation Analysis")
print(f"f(x, lambda) = {f}")
print(f"Equilibria: {equilibria}")
print(f"f'(x) = {df}")


# %% [markdown]
# ## Supplementary Template

# %%
t = sp.Symbol("t", positive=True, real=True)
x_fun = sp.Function("x")
ode = sp.Eq(sp.diff(x_fun(t), t) - x_fun(t) / t, t**2)
candidate = sp.dsolve(ode, ics={x_fun(1): 0})

print_header("4.1 Supplementary Template: Variable-Coefficient Linear ODE")
print(f"ODE: {ode}")
print(f"Solution with x(1)=0: {candidate}")
