# Recruit Forecasting Kaggle Competition

In late 2017/early 2018 qCoh worked on the [Kaggle Competition](https://www.kaggle.com/c/recruit-restaurant-visitor-forecasting) in which we were presented with a large number of restaurants' visitor data, in addition to their reservation data, and asked to predict a 40 day window of visitors for those restaurants' visitors in the future(technically still in the past, but future w.r.t. the dataset).

In this article we will address a few things:
- our approach, and learnings
- some generalization to forecasting methods and how this is applicable beyond this competition
- a refined approach that does better than the competition submission, and is more suitable for generalization to other problems.

We(as a group) learned a lot of non-technical things, but those will not be the focus of this article.

## Datasets

### Summarizing the data

### Organizing the data

### Feature engineering

## Solution architecture

### Performance Metrics

### Organizing Timeseries

### SARIMAX

### Parameter Tuning

#### Historical Performance 1-day

#### Historical Perforamnce 40-day

#### Putting those analysis together

### Reservations

#### Reservation Percentage CDF

#### Reservation Regression

### Exogenous Variables

#### TS-Fresh

#### Holidays

#### Restaurant Clusterings

#### Dynamic Time Warping

### Boosting from residuals

## A many-series Forecasting Pipeline

### Dealing with lots of models

### Avoiding over-fitting

### Abstracting this type of forecasting problem

## Improved methods and submissions

### Adding exog to competition submission

### Deeper parameter search

### Ensembles of features

### Keras NN
