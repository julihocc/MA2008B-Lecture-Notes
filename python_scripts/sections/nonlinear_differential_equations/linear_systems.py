# %% [markdown]
# # 4.2 Constant-Coefficient Linear Systems
# Computational companion aligned with critical-point classification for x' = A x.

# %%
import sympy as sp


def print_header(title: str) -> None:
    print(f"\n{'=' * 78}\n{title}\n{'=' * 78}")


# %% [markdown]
# ## Setup

# %%
t = sp.symbols("t", real=True)
lam = sp.symbols("lam", real=True)


# %% [markdown]
# ## Solved Problem: Stable Node Classification

# %%
A_node = sp.Matrix([[-1, 0], [0, -3]])
x0_node = sp.Matrix([1, 2])
phi_node = sp.exp(A_node * t)
x_node = sp.simplify(phi_node * x0_node)

print_header("4.2 Solved: Stable Node")
print("A =")
sp.pprint(A_node)
print("Eigenvalues:", A_node.eigenvals())
print("x(t) =")
sp.pprint(x_node)


# %% [markdown]
# ## Solved Problem: Saddle Classification

# %%
A_saddle = sp.Matrix([[2, 0], [0, -1]])
trace_saddle = A_saddle.trace()
det_saddle = A_saddle.det()

print_header("4.2 Solved: Saddle")
print("Eigenvalues:", A_saddle.eigenvals())
print(f"trace = {trace_saddle}, det = {det_saddle}")


# %% [markdown]
# ## Solved Problem: Stable Focus Classification

# %%
A_focus = sp.Matrix([[-1, -4], [1, -1]])
char_focus = sp.expand((sp.Symbol("l") * sp.eye(2) - A_focus).det())

print_header("4.2 Solved: Stable Focus")
print("A =")
sp.pprint(A_focus)
print("Characteristic polynomial in l:", char_focus)
print("Eigenvalues:", A_focus.eigenvals())


# %% [markdown]
# ## Solved Problem: Defective Repeated Eigenvalue

# %%
A_def = sp.Matrix([[-2, 1], [0, -2]])
phi_def = sp.simplify(sp.exp(A_def * t))

print_header("4.2 Solved: Defective Repeated Eigenvalue")
print("A =")
sp.pprint(A_def)
print("Eigenvalues:", A_def.eigenvals())
print("e^(At) =")
sp.pprint(phi_def)


# %% [markdown]
# ## Solved Problem: Trace-Determinant Classification

# %%
A_td = sp.Matrix([[1, 4], [-1, -3]])
tau = A_td.trace()
Delta = A_td.det()
D = sp.simplify(tau**2 - 4 * Delta)

print_header("4.2 Solved: Trace-Determinant Classification")
print("A =")
sp.pprint(A_td)
print(f"tau = {tau}, Delta = {Delta}, D = {D}")
print("Eigenvalues:", A_td.eigenvals())


# %% [markdown]
# ## Supplementary Template Runner

# %%
def run_supplementary_examples() -> None:
    print_header("4.2 Supplementary: Center Example")
    A_center = sp.Matrix([[0, -2], [2, 0]])
    print("Eigenvalues:", A_center.eigenvals())

    print_header("4.2 Supplementary: Trajectory from Initial Data")
    A = sp.Matrix([[-2, 0], [0, 1]])
    x0 = sp.Matrix([3, -2])
    x_t = sp.simplify(sp.exp(A * t) * x0)
    print("x(t) =")
    sp.pprint(x_t)


run_supplementary_examples()
