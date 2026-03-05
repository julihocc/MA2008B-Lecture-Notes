# %% [markdown]
# # 4.3 Autonomous Systems
# Phase-plane classification, linearization, and Bendixson criterion.

# %%
import sympy as sp


def print_header(title: str) -> None:
    print(f"\n{'=' * 72}\n{title}\n{'=' * 72}")


# %% [markdown]
# ## Solved Problem: Phase-Plane Classification

# %%
x, y = sp.symbols("x y", real=True)
A = sp.Matrix([[0, 1], [-1, -sp.Rational(1, 5)]])

print_header("4.3 Solved Problem: Phase-Plane Classification")
print(f"A =\n{A}")
print(f"Eigenvalues: {A.eigenvals()}")


# %% [markdown]
# ## Solved Problem: Linearization of a Nonlinear System

# %%
f1 = y - x**3
f2 = -x - y
J = sp.Matrix([[sp.diff(f1, x), sp.diff(f1, y)], [sp.diff(f2, x), sp.diff(f2, y)]])
J0 = J.subs({x: 0, y: 0})

print_header("4.3 Solved Problem: Linearization of a Nonlinear System")
print(f"Jacobian J(x,y) =\n{J}")
print(f"J(0,0) =\n{J0}")
print(f"Eigenvalues at origin: {J0.eigenvals()}")


# %% [markdown]
# ## Solved Problem: Bendixson Criterion

# %%
P = x + y
Q = -x + 2 * y
divergence = sp.Matrix([P, Q]).jacobian([x, y]).trace()

print_header("4.3 Solved Problem: Bendixson Criterion")
print(f"P(x,y) = {P}")
print(f"Q(x,y) = {Q}")
print(f"div F = {divergence}")


# %% [markdown]
# ## Supplementary Template

# %%
f = x - y**2
g = x**2 - y
nullcline_x = sp.solve(sp.Eq(f, 0), y)
nullcline_y = sp.solve(sp.Eq(g, 0), y)

print_header("4.3 Supplementary Template: Nullcline Computation")
print(f"x' = {f}, y' = {g}")
print(f"x'-nullclines (y as function of x): {nullcline_x}")
print(f"y'-nullclines (y as function of x): {nullcline_y}")
