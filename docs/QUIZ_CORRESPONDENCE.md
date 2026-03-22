# 📚 Quiz & Lecture Notes Curriculum Correspondence

This document outlines the exact 1-to-1 correspondence between the reorganized IDM19 Lecture Notes curriculum (based on the RMIB 2024 Reorganization Plan) and the Canvas QTI Quiz export system.

## 🏗️ Directory Architecture

To ensure perfect synchronization, every chapter module inside `lecture_notes/chapters/` now has an **identically named counterpart** inside the `quizzes/` directory.

The automation scripts (`generate_canvas_quizzes.py` and `generate_single_canvas_quiz.py`) rely on these exact directory names to construct the final Canvas `.zip` packages.

---

## 🗺️ Curriculum Mapping

### Part I: Control Theory & Bio-System Modeling

| Ch. | Topic / Directory Name | Text Seed File | Exported Canvas QTI Package |
| :-- | :--- | :--- | :--- |
| **1.** | `fundamentals_systems_modeling` | `quizzes/fundamentals_systems_modeling/quiz.txt` | `fundamentals_systems_modeling_canvas.zip` |
| **2.** | `transient_response_physiology` | `quizzes/transient_response_physiology/quiz.txt` | `transient_response_physiology_canvas.zip` |
| **3.** | `frequency_response_oscillations` | `quizzes/frequency_response_oscillations/quiz.txt` | `frequency_response_oscillations_canvas.zip` |
| **4.** | `design_compensation_control` | `quizzes/design_compensation_control/quiz.txt` | `design_compensation_control_canvas.zip` |

### Part II: Nonlinear Systems & Stability Analysis

| Ch. | Topic / Directory Name | Text Seed File | Exported Canvas QTI Package |
| :-- | :--- | :--- | :--- |
| **5.** | `nonlinear_differential_equations` | `quizzes/nonlinear_differential_equations/quiz.txt` | `nonlinear_differential_equations_canvas.zip` |
| **6.** | `equilibrium_point_analysis` | `quizzes/equilibrium_point_analysis/quiz.txt` | `equilibrium_point_analysis_canvas.zip` |
| **7.** | `stability_theory` | `quizzes/stability_theory/quiz.txt` | `stability_theory_canvas.zip` |
| **8.** | `bifurcation_theory` | `quizzes/bifurcation_theory/quiz.txt` | `bifurcation_theory_canvas.zip` |

### Part III: Advanced Analytical Tools for Bio-Systems

| Ch. | Topic / Directory Name | Text Seed File | Exported Canvas QTI Package |
| :-- | :--- | :--- | :--- |
| **9.** | `positivity_invariant_sets` | `quizzes/positivity_invariant_sets/quiz.txt` | `positivity_invariant_sets_canvas.zip` |
| **10.** | `the_lcis_method` | `quizzes/the_lcis_method/quiz.txt" | `the_lcis_method_canvas.zip` |
| **11.** | `metabolic_case_study` | `quizzes/metabolic_case_study/quiz.txt` | `metabolic_case_study_canvas.zip` |
| **12.** | `computational_implementation` | `quizzes/computational_implementation/quiz.txt` | `computational_implementation_canvas.zip` |

### Part IV: Physics-Informed Neural Networks

| Ch. | Topic / Directory Name | Text Seed File | Exported Canvas QTI Package |
| :-- | :--- | :--- | :--- |
| **13.** | `scientific_ml_intro` | `quizzes/scientific_ml_intro/quiz.txt` | `scientific_ml_intro_canvas.zip` |
| **14.** | `pinns_forward_problem` | `quizzes/pinns_forward_problem/quiz.txt` | `pinns_forward_problem_canvas.zip` |
| **15.** | `pinns_inverse_problem` | `quizzes/pinns_inverse_problem/quiz.txt` | `pinns_inverse_problem_canvas.zip` |
| **16.** | `hybrid_modeling_safety` | `quizzes/hybrid_modeling_safety/quiz.txt` | `hybrid_modeling_safety_canvas.zip` |

---

## ⚙️ Modification & Generation Rules

1. **Do not embed LaTeX** inside the `quiz.txt` files. Canvas uses plain text formatting by default.
2. The `*` character inside a `quiz.txt` indicates the correct answer index.
3. If you rename a directory in `lecture_notes/chapters/`, you **must** rename its corresponding sibling directory inside `quizzes/`.
4. You can re-generate the entire Canvas curriculum at once using `python generate_canvas_quizzes.py`.
5. You can generate a specific chapter's package using `python generate_single_canvas_quiz.py path/to/quiz.txt`.
