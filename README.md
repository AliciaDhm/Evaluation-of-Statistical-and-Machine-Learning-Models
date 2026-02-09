This project evaluates and compares variable selection methods from classical statistical learning and modern machine learning approaches using SAS. It includes simulation studies under various data-generation settings and an empirical application using the Diabetes dataset.

## Objective
To compare the performance of variable selection methods:

Statistical Learning: Forward, Backward, Stepwise
Machine Learning / Penalization: Lasso, LARS, Elastic Net

The comparison is carried out using multiple model selection criteria and performance metrics across different scenarios.

## Data
Simulated data under controlled scenarios:
- Independent predictors
- Correlated predictors (multicollinearity)
- Presence of outliers
- Structural breaks
- Combined cases

Real dataset:
- Diabetes dataset (Efron et al.) used to test empirical performance on real observations.

## Methodology
Main procedures:
- PROC IML (data generation / simulations)
- PROC GLMSELECT (variable selection)

Selection criteria:
- AIC/AICc, BIC/SBC, Cp, Adjusted R²
- K-fold Cross-Validation
- PRESS Statistic (Leave-One-Out)

Performance evaluation over multiple replications using:
- Perfect fit
- Overfitting
- Underfitting
- Wrong model selection

## Repository content
- Full Report.pdf: Full report (theory, simulation design, results, empirical analysis)
- Code/The bias variance trade-off.sas: Simulation illustrating the bias–variance trade-off
- Code/Simulations and metrics.sas: Simulation scenarios and performance metrics computation
- Code/Empirical Analysis.sas: Empirical study on the Diabetes dataset (EDA + model selection comparisons)


## Notes
- Some scripts may include local file paths; update them to match your environment.
- Detailed explanations and results are available in `Full Report.pdf`.
