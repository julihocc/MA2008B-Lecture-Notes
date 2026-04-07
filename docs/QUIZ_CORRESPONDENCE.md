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
| **1.** | `01_fundamentals_systems_modeling` | `quizzes/01_fundamentals_systems_modeling/quiz.txt` | `01_fundamentals_systems_modeling_canvas.zip` |
| **2.** | `02_transient_response_physiology` | `quizzes/02_transient_response_physiology/quiz.txt` | `02_transient_response_physiology_canvas.zip` |
| **3.** | `03_frequency_response_oscillations` | `quizzes/03_frequency_response_oscillations/quiz.txt` | `03_frequency_response_oscillations_canvas.zip` |
| **4.** | `04_design_compensation_control` | `quizzes/04_design_compensation_control/quiz.txt` | `04_design_compensation_control_canvas.zip` |

### Part II: Nonlinear Systems & Stability Analysis

| Ch. | Topic / Directory Name | Text Seed File | Exported Canvas QTI Package |
| :-- | :--- | :--- | :--- |
| **5.** | `05_nonlinear_differential_equations` | `quizzes/05_nonlinear_differential_equations/quiz.txt` | `05_nonlinear_differential_equations_canvas.zip` |
| **6.** | `06_equilibrium_point_analysis` | `quizzes/06_equilibrium_point_analysis/quiz.txt` | `06_equilibrium_point_analysis_canvas.zip` |
| **7.** | `07_stability_theory` | `quizzes/07_stability_theory/quiz.txt` | `07_stability_theory_canvas.zip` |
| **8.** | `08_bifurcation_theory` | `quizzes/08_bifurcation_theory/quiz.txt` | `08_bifurcation_theory_canvas.zip` |

### Part III: Advanced Analytical Tools for Bio-Systems

| Ch. | Topic / Directory Name | Text Seed File | Exported Canvas QTI Package |
| :-- | :--- | :--- | :--- |
| **9.** | `09_positivity_invariant_sets` | `quizzes/09_positivity_invariant_sets/quiz.txt` | `09_positivity_invariant_sets_canvas.zip` |
| **10.** | `10_the_lcis_method` | `quizzes/the_lcis_method/quiz.txt" | `the_lcis_method_canvas.zip` |
| **11.** | `11_metabolic_case_study` | `quizzes/11_metabolic_case_study/quiz.txt` | `11_metabolic_case_study_canvas.zip` |
| **12.** | `12_computational_implementation` | `quizzes/12_computational_implementation/quiz.txt` | `12_computational_implementation_canvas.zip` |

### Part IV: Physics-Informed Neural Networks

| Ch. | Topic / Directory Name | Text Seed File | Exported Canvas QTI Package |
| :-- | :--- | :--- | :--- |
| **13.** | `13_scientific_ml_intro` | `quizzes/13_scientific_ml_intro/quiz.txt` | `13_scientific_ml_intro_canvas.zip` |
| **14.** | `14_pinns_forward_problem` | `quizzes/14_pinns_forward_problem/quiz.txt` | `14_pinns_forward_problem_canvas.zip` |
| **15.** | `15_pinns_inverse_problem` | `quizzes/15_pinns_inverse_problem/quiz.txt` | `15_pinns_inverse_problem_canvas.zip` |
| **16.** | `16_hybrid_modeling_safety` | `quizzes/16_hybrid_modeling_safety/quiz.txt` | `16_hybrid_modeling_safety_canvas.zip` |

---

## ⚙️ Modification & Generation Rules

1. **Do not embed LaTeX** inside the `quiz.txt` files. Canvas uses plain text formatting by default.
2. The `*` character inside a `quiz.txt` indicates the correct answer index.
3. If you rename a directory in `lecture_notes/chapters/`, you **must** rename its corresponding sibling directory inside `quizzes/`.
4. You can re-generate the entire Canvas curriculum at once using `python generate_canvas_quizzes.py`.
5. You can generate a specific chapter's package using `python generate_single_canvas_quiz.py path/to/quiz.txt`.
