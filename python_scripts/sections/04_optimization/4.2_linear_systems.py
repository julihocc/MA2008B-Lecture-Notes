import sympy as sp


def print_header(title: str) -> None:
    print(f"\n{'=' * 72}\n{title}\n{'=' * 72}")


def run_solved_problems() -> None:
    t = sp.symbols("t", real=True)

    print_header("4.2 Solved Problem: Matrix Exponential for a Diagonal System")
    A_diag = sp.Matrix([[3, 0], [0, -1]])
    x0_diag = sp.Matrix([2, -1])
    phi_diag = sp.exp(A_diag * t)
    x_diag = sp.simplify(phi_diag * x0_diag)
    print(f"e^(At) =\n{phi_diag}")
    print(f"x(t) =\n{x_diag}")

    print_header("4.2 Solved Problem: State Transition with Constant Matrix")
    A = sp.Matrix([[0, 1], [-2, -3]])
    phi = sp.simplify(sp.exp(A * t))
    print(f"A =\n{A}")
    print(f"e^(At) =\n{phi}")

    print_header("4.2 Solved Problem: Infinity-Norm Growth Estimate")
    A_inf = sp.Matrix([[1, 2], [0, -1]])
    norm_inf = max(sum(abs(A_inf[i, j]) for j in range(A_inf.cols)) for i in range(A_inf.rows))
    print(f"A =\n{A_inf}")
    print(f"||A||_inf = {norm_inf}")
    print("Bound: ||x(t)||_inf <= exp(||A||_inf * t) ||x(0)||_inf")


def run_supplementary_problems() -> None:
    t = sp.symbols("t", real=True)
    A = sp.Matrix([[4, 1], [0, 2]])
    print_header("4.2 Supplementary Template: Matrix Exponential by Diagonalization")
    print(f"A =\n{A}")
    print(f"e^(At) =\n{sp.simplify(sp.exp(A * t))}")


if __name__ == "__main__":
    run_solved_problems()
    run_supplementary_problems()
