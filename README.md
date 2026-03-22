# MA2008B - Análisis numérico para la optimización no-lineal
*(Numerical Analysis for Non-Linear Optimization)*

**Professor:** Dr. Juliho Castillo Colmenares, Ph.D.
**Institution:** Tecnológico de Monterrey

## Overview

This repository contains the lecture notes, quizzes, and resources for the course **MA2008B**, an intermediate-level course focused on acquiring the skills and knowledge necessary to formulate large-scale mathematical optimization models using control theory and dynamic systems analysis.

Students will learn to:
- Design efficient optimization algorithms.
- Utilize modern technological resources for their execution.
- Understand the theoretical foundations of non-linear optimization processes.
- Implement efficient algorithms for the simulation of dynamic systems.

## Course Topics (Reorganized 2024)

The course is divided into four main pedagogical blocks, comprising 16 specialized chapters:

### Part I: Control Theory & Bio-System Modeling
1. Fundamentals of Bio-Systems Modeling
2. Transient Response in Physiology
3. Frequency Response & Biological Oscillations
4. Control Strategy Design & Compensation

### Part II: Nonlinear Systems & Stability Analysis
5. Nonlinear Differential Equations in Biology
6. Equilibrium Point & Phase Plane Analysis
7. Stability Theory & Lyapunov Functions
8. Bifurcation Theory & Hopf Dynamics

### Part III: Advanced Analytical Tools for Bio-Systems
9. Positivity & Invariant Sets
10. The LCIS Method for State-Space Analysis
11. Metabolic Networks: Case Study
12. Computational Implementation (FEM & ODE45)

### Part IV: Physics-Informed Neural Networks (PINNs)
13. Introduction to Scientific Machine Learning
14. Forward Problem: Solving ODEs with PINNs
15. Inverse Problem: Parameter Discovery
16. Hybrid Modeling & Safety Under Constraints

## Repository Structure

The files are organized into the following main directories:

- **`docs/`**: General course and administrative documents.
  - `MA2008B-Analítico.md`: Detailed course syllabus, objectives, requirements, content, and evaluation criteria.
- **`lecture_notes/`**: The core instructional material for the course, written in [Typst](https://typst.app/).
  - Contains subdirectories for each chapter/topic in the syllabus.
  - Generates the main `lecture_notes.pdf` document.
- **`quizzes/`**: Self-evaluation quizzes for the corresponding chapters in the lecture notes.
- **`my_lyceum_book/`**: Additional compilation or project-related Typst files (like a structured book format for the notes).

## Technologies Used

- **[Typst](https://typst.app/)**: Used for writing the lecture notes, books, and mathematical formulas efficiently.
- **Python** (via pyproject.toml & uv.lock): Used for executing numerical analysis code, simulations, and any autograding or analysis scripts in the repository.

## Prerequisites

- Current enrollment or completion of **MA2004B**.
- Knowledge of differential equations systems and programming.
