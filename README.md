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

## Course Topics

The course is divided into three main parts:

### Part I: Control Theory
1. Control Theory (Methods and Principles)
2. Modeling and Simulation of Dynamic Systems
3. Transient Response and Steady-State Error Analysis
4. System Optimization (Root Locus)
5. Analysis and Design via Frequency Response
6. Design Techniques and Control System Compensation

### Part II: Dynamical Systems
7. Non-linear Differential Equations

### Part III: Selected Topics
8. Lyapunov Stability (Time-varying systems, Fractals, and Chaos)
9. Finite Element Method (Rigid method, Dynamic problem formulation)
10. Non-linear Analysis with Finite Elements
11. Topics and Trends in Numerical Analysis for Optimization

## Repository Structure

The files are organized into the following main directories:

- **`docs/`**: General course and administrative documents.
  - `MA2008B-Analítico.md`: Detailed course syllabus, objectives, requirements, content, and evaluation criteria.
- **`lecture_notes/`**: The core instructional material for the course, written in [Typst](https://typst.app/).
  - Contains subdirectories for each section/topic in the syllabus.
  - Generates the main `lecture_notes.pdf` document.
- **`quizzes/`**: Self-evaluation quizzes for the corresponding sections in the lecture notes.
- **`my_lyceum_book/`**: Additional compilation or project-related Typst files (like a structured book format for the notes).

## Technologies Used

- **[Typst](https://typst.app/)**: Used for writing the lecture notes, books, and mathematical formulas efficiently.
- **Python** (via pyproject.toml & uv.lock): Used for executing numerical analysis code, simulations, and any autograding or analysis scripts in the repository.

## Prerequisites

- Current enrollment or completion of **MA2004B**.
- Knowledge of differential equations systems and programming.
