# GM Stock Price Forecasting Using ARIMA Models
Time series analysis and forecasting of General Motors (GM) stock prices using R. Applied ARIMA models, stationary testing, ACF/PACF analysis, and out-of-sample forecasting to evaluate predictive performance using RMSE.
## Project Overview
This porject focuses on analyzing and forecasting General Motors (GM) stock prices using time series analysis in R. The objective is to identify suitable ARIMA models, examine historical stock price movements, and to evaluate short-term forecasting accuracy.
## Project Objective
To apply statistical time series methods to financial market data and assess the predictive performance of ARIMA models for short-term stock price forecasting.
## Methodology
- **Data Cleaning**: The historical stock price data was cleaned and the adjusted closing prices were transformed into logarithmic values and log returns.
- **Exploratory Data Analysis**: Visualized stock price trends and return fluctuations over time.
- **Stationarity testing**: The Augmented Dickey-Fuller (ADF) test to examine stationarity in differenced log prices.
- **Time Series Modeling**: Developed and compared multiple ARIMA specifications, incl- ARIMA(1,1,1) and ARIMA (2,1,1).
- **Model Evaluation**: Akaike Information Criterion (AIC), coefficient significance tests, and residual diagnostics were used to assess model suitability.
- **Forecasting**: Generated 4 week ahead stock price forecasts and compared predictions against actual observed prices.
- **Performance Assessment**: Calculated Root Mean Squared Error (RMSE) to evaluate the out-of-sample forecasting accuracy.
## Tools
- **Programming Language**: R
- **Statistical Methods**: ARIMA, ADF test, ACF,PACF, AIC, RMSE
- **Libraries**: forecast,  tseries, lmtest, FinTS
- **Visualization**: Time series plots, forecast intervals, residual diagnostics.
