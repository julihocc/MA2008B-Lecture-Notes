from __future__ import annotations

import sympy as sp
from sympy.integrals.transforms import inverse_laplace_transform


# Problem:
# Compute e^(A t) for A = [[0, 1], [-1, 0]] using Laplace tools.


def compute_phi_via_laplace() -> tuple[sp.Matrix, sp.Matrix, sp.Matrix]:
    s, t = sp.symbols("s t", real=True, positive=True)
    A = sp.Matrix([[0, 1], [-1, 0]])
    I = sp.eye(2)

    resolvent = (s * I - A).inv()

    phi_t = resolvent.applyfunc(
        lambda expr: sp.simplify(inverse_laplace_transform(expr, s, t))
    )

    expected = sp.Matrix([[sp.cos(t), sp.sin(t)], [-sp.sin(t), sp.cos(t)]])
    return resolvent, phi_t, expected


def main() -> None:
    resolvent, phi_t, expected = compute_phi_via_laplace()

    print("(sI - A)^(-1) =")
    sp.pprint(resolvent)

    print("\nPhi(t) = L^(-1){(sI - A)^(-1)} =")
    sp.pprint(phi_t)

    print("\nExpected rotation matrix =")
    sp.pprint(expected)

    print("\nDifference Phi(t) - Expected =")
    sp.pprint(sp.simplify(phi_t - expected))


if __name__ == "__main__":
    main()
