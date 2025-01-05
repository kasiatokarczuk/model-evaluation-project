# Statistical Modeling and Regression Evaluation for Weather Data

## Overview

This repository contains the implementation of statistical modeling and regression evaluation applied to weather data. The data is sourced from the German Meteorological Service and consists of information related to meteorological stations described by 22 features/variables. The goal of this project is to train and evaluate various regression models for predicting the average annual rainfall based on station data.

The project is divided into several key tasks, each focusing on a different aspect of the modeling process, from data preparation to model creation and evaluation.

## Project Structure

- **Part I: Data Preparation and Filtering**
    - Load the dataset `weather.csv` containing meteorological station data.
    - Inspect and analyze variable types, identify irrelevant variables, and clean the data by removing rows with missing values.
    - Split the dataset into training and test sets using a 70%/30% split ratio.
    - Extract the dependent variable `MEAN.ANNUAL.RAINFALL` and create explanatory matrices.
    - Perform a scatterplot matrix to visualize relationships and calculate correlations among variables.
    - Filter out pairs of variables with high correlation (|r| >= 0.5) for further analysis.

- **Part II: Model Creation and Prediction**
    - Build a baseline model for predicting the average annual rainfall.
    - Create linear regression models using the most correlated variables with `MEAN.ANNUAL.RAINFALL`.
    - Compute the Root Mean Square Error (RMSE) for each model to evaluate performance.
    - Train and test different models including simple and multiple linear regression models, comparing the RMSE for training and testing datasets.

- **Part III: Stepwise Methods and AIC Criterion**
    - Apply stepwise selection methods (Forward Selection and Backward Selection) using the Akaike Information Criterion (AIC) to choose the best model.
    - Implement the `step()` function in R to perform forward and backward selection for model refinement.
    - Compute the RMSE for the final model based on selected variables.

## Steps and Tasks

### Part I: Data Preparation and Filtering
1. **Load Data**: Import the `weather.csv` dataset and inspect its structure.
2. **Variable Analysis**: Identify irrelevant variables such as `id`, `DWD_ID`, `STATION.NAME`, `FEDERAL.STATE`, and `PERIOD` (related to meteorological stations).
3. **Data Cleaning**: Remove rows with missing values and calculate the number of rows removed.
4. **Split Data**: Divide the dataset into training and test sets using a 70%/30% split ratio.
5. **Extract Dependent Variable**: Extract `MEAN.ANNUAL.RAINFALL` and create matrices of explanatory variables.
6. **Correlation Analysis**: Compute and visualize the correlation between variables.
7. **Filter Variables**: Eliminate variables with correlation |r| >= 0.5 and perform further analysis on selected variables.

### Part II: Model Creation and Prediction
1. **Create Baseline Model**: Build a simple baseline model (mean of `MEAN.ANNUAL.RAINFALL`).
2. **RMSE Calculation**: Calculate the Root Mean Square Error (RMSE) for the baseline model on both training and testing datasets.
3. **Linear Regression Model**: Build a linear regression model using the variable with the highest Pearson correlation to `MEAN.ANNUAL.RAINFALL`.
4. **Model Evaluation**: Evaluate the model using RMSE and compare results.
5. **Multiple Linear Regression**: Create a multiple linear regression model using multiple explanatory variables.
6. **Prediction**: Use the model to predict values on the test dataset and calculate RMSE.

### Part III: Stepwise Methods and AIC Criterion
1. **Forward Selection**: Perform forward selection to build a model by adding variables that minimize the AIC.
2. **Model Refinement**: Create a model based on selected variables from forward selection and calculate RMSE.
3. **Backward Selection**: Perform backward selection starting with a full model and remove variables with the least contribution to the model.
4. **Model Evaluation**: Evaluate the model created from backward selection by computing RMSE on both training and test datasets.

## Libraries and Tools

The project uses the following tools and libraries:
- **R Programming Language** for statistical modeling.
- **Packages**: 
  - `caTools` for data splitting.
  - `GGally` for scatterplot matrix visualization.
  - `corrplot` for visualizing correlations.
  - `step()` function for stepwise model selection.
- **Metrics**:
  - Root Mean Square Error (RMSE) for model evaluation.

## Key Concepts

- **Linear Regression**: A basic regression model used to predict a dependent variable based on one or more independent variables.
- **Multiple Linear Regression**: An extension of linear regression that uses multiple explanatory variables.
- **Stepwise Selection**: A method for selecting the best set of predictor variables based on a chosen criterion, such as AIC.
- **Akaike Information Criterion (AIC)**: A statistical measure used to compare models and select the best one by penalizing complex models.
