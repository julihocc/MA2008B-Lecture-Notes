# %% [markdown]
# # 4.3 Time-Dependent Linear Systems
# Computational companion aligned with x' = A(t) x, transition matrices,
# variation of constants, and norm-based growth bounds.

# %%
import sympy as sp


def print_header(title: str) -> None:
    print(f"\n{'=' * 78}\n{title}\n{'=' * 78}")


# %% [markdown]
# ## Setup

# %%
t, s = sp.symbols("t s", real=True)


# %% [markdown]
# ## Solved Problem: Fundamental Matrix for Diagonal A(t)

# %%
Phi = sp.Matrix([[sp.exp(t**2 / 2), 0], [0, sp.exp(-2 * t)]])

print_header("4.3 Solved: Fundamental Matrix for Diagonal A(t)")
print("Phi(t) =")
sp.pprint(Phi)
print("det(Phi(t)) =", sp.simplify(Phi.det()))


# %% [markdown]
# ## Solved Problem: Transition Matrix and IVP Solution

# %%
x0 = sp.Matrix([2, -1])
Phi0 = Phi.subs(t, 0)
Phi_t0 = sp.simplify(Phi * Phi0.inv())
x_t = sp.simplify(Phi_t0 * x0)

print_header("4.3 Solved: Transition Matrix and IVP")
print("Phi(t,0) =")
sp.pprint(Phi_t0)
print("x(t) =")
sp.pprint(x_t)


# %% [markdown]
# ## Solved Problem: Variation of Constants with Input

# %%
A = sp.Matrix([[0, 0], [0, -1]])
Phi_h = sp.Matrix([[1, 0], [0, sp.exp(-t)]])
Phi_ts = sp.Matrix([[1, 0], [0, sp.exp(-(t - s))]])
r = sp.Matrix([1, sp.exp(-s)])

x1 = sp.integrate(1, (s, 0, t))
x2 = sp.simplify(sp.integrate(sp.exp(-(t - s)) * sp.exp(-s), (s, 0, t)))
x_voc = sp.Matrix([x1, x2])

print_header("4.3 Solved: Variation of Constants")
print("A(t) =")
sp.pprint(A)
print("Phi(t,s) =")
sp.pprint(Phi_ts)
print("x(t) =")
sp.pprint(x_voc)


# %% [markdown]
# ## Solved Problem: Norm Bound with Bounded A(t)

# %%
M = sp.Integer(2)
x0_norm = sp.Integer(3)
bound = sp.simplify(x0_norm * sp.exp(M * t))

print_header("4.3 Solved: Norm-Based Growth Bound")
print("If ||A(t)||_inf <= 2 and ||x(0)||_inf = 3, then")
print("||x(t)||_inf <=", bound)


# %% [markdown]
# ## Solved Problem: Transition from Nonzero Initial Time

# %%
t_pos = sp.symbols("t_pos", positive=True)
Phi_pos = sp.Matrix([[t_pos, 0], [0, sp.exp(-t_pos)]])
Phi_t1 = sp.simplify(Phi_pos * Phi_pos.subs(t_pos, 1).inv())
x1_data = sp.Matrix([3, 2])
x_from1 = sp.simplify(Phi_t1 * x1_data)

print_header("4.3 Solved: Transition from t0 = 1")
print("Phi(t,1) =")
sp.pprint(Phi_t1)
print("x(t) =")
sp.pprint(x_from1)


# %% [markdown]
# ## Supplementary Template Runner

# %%
def run_supplementary_examples() -> None:
    print_header("4.3 Supplementary: Fundamental Matrix Check")
    Phi_sup = sp.Matrix([[sp.exp(t**2), 0], [0, sp.exp(-3 * t)]])
    print("det(Phi_sup) =", sp.simplify(Phi_sup.det()))

    print_header("4.3 Supplementary: Norm Bound Application")
    bound_sup = sp.simplify(4 * sp.exp(sp.Rational(3, 5) * t))
    print("If ||A(t)||_2 <= 0.6 and ||x(0)||_2 = 4, then ||x(t)||_2 <=", bound_sup)


run_supplementary_examples()
