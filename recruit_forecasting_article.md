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

### Organizing Timeseries

### SARIMAX

### Parameter Tuning

### Performance Metrics

Conveniently, the Kaggle competition provides us with their performance metric for evaluation—`RMSLE`, or [Root mean squared log error](https://www.kaggle.com/wiki/RootMeanSquaredLogarithmicError), and as they define it:

$\sqrt{\dfrac{1}{n}\sum_{i=1}^{n}(\log(p_i+1)-\log(a_i+1))^2}
where:

$n$ is the total number of observations
$p_i$ is your prediction of visitors
$a_i$ is the actual number of visitors
$log(x)$ is the natural logarithm of $x$.

However, this doesn't tell the full story. When computing ARIMA forecasts, a common performance metric is `AIC` or the Akaike’s Information Criterion. One convenient way of thinking of AIC is "how well a model fits the data while taking into account the overall complexity of the model". Seasonal ARIMA models are non-linear equations from seven factors as described above; so the complexity spoken of here is the dimension of these terms. The other major component to performance metrics, is determining a models performance on the historical data, by simulating forecasts from days in the historical series, and benchmarking them against the actual data. We do this using both 1-day predictions and 40-day predictions.

#### Historical Performance 1-day

For each point in the historical data series(after a certain minimal number of days), a model with parameters `X` can be trained, and predictions can be generated for the next day. Then, those predictions can be measured against that days actual values, to provide the performance evaluation. As time goes on, the data used to generate these predictions grows longer, and so we expect on average the performance to improve. Additionally, as the series gets closer to the current day, we anticipate it's predictive power to get more similar to how we expect it to perform in the actual future. This suggest the possibility of weighting the performance metric, but we'll discuss that more at length later.

For the truncated historical data series `ƒ_T(t)` where `T` is day we truncate to, we generate `F_T`, which is the 1-day forecast for the day `T+1`. The series of `F_T`'s forms another data series we call `F(t)` and `RMSLE(F_T(t), ƒ_T(t))` is the measure of these 1-day forecasts. Importantly, this value will not provide a good expectation of the predictions for our submission, because the submission requires us to predict the period of 40-days after the last day of the historical series. However, we see that these provide a simple summary of how the forecasts will do across the entire historical series. We also see that these are more computationally inexpensive to compute than the 40-day forecasts, so we use this as a first pass for performance.

#### Historical Performance 40-day

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
