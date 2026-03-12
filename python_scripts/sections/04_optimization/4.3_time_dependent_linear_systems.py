# %% [markdown]
# # 4.3 Time-Dependent Linear Systems
# Computational companion aligned with x' = A(t) x, transition matrices,
# variation of constants, and norm-based growth bounds.

# %%
import numpy as np
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
# ## Solved Problem: Computing Vector and Matrix Norms

# %%
A_num = np.array([[1, 2], [0, -1]])
x_num = np.array([3, -4])

print_header("4.3 Solved: Computing Vector and Matrix Norms")
print("A =\n", A_num)
print("x =", x_num)

# Vector norms
print("\nVector Norms for x:")
print("||x||_1 =", np.linalg.norm(x_num, 1))
print("||x||_2 =", np.linalg.norm(x_num, 2))
print("||x||_inf =", np.linalg.norm(x_num, np.inf))

# Matrix norms (induced)
print("\nInduced Matrix Norms for A:")
print("||A||_1 =", np.linalg.norm(A_num, 1))
print("||A||_2 =", np.linalg.norm(A_num, 2))
print("||A||_inf =", np.linalg.norm(A_num, np.inf))

# Verify induced property for infinity norm
Ax = A_num @ x_num
norm_Ax = np.linalg.norm(Ax, np.inf)
norm_A_norm_x = np.linalg.norm(A_num, np.inf) * np.linalg.norm(x_num, np.inf)
print("\nVerify ||Ax||_inf <= ||A||_inf * ||x||_inf:")
print(f"{norm_Ax} <= {norm_A_norm_x}  ({norm_Ax <= norm_A_norm_x})")


# %% [markdown]
# ## Demonstration: Grönwall's Inequality

# %%
C = sp.symbols("C", positive=True, real=True)
v = sp.Function("v")(s)

bound_gronwall = C * sp.exp(sp.integrate(v, (s, 0, t)))

print_header("4.3 Demo: Grönwall's Inequality Bound")
print("If u(t) <= C + integral_0^t v(s)u(s) ds")
print("Then u(t) <=")
sp.pprint(bound_gronwall)

# Example: constant v(s) = M
M_val = sp.symbols("M", positive=True, real=True)
bound_explicit = bound_gronwall.subs(v, M_val).doit()
print("\nFor v(s) = M (constant):")
print("u(t) <=")
sp.pprint(bound_explicit)


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
