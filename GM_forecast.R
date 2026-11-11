GM <- GM[, c(1,6)]
GM <- GM[-c(262),]

GM$Adj.Close <- ts(GM$Adj.Close, start = c(2018,43), frequency = 52)
ts.plot(GM$Adj.Close, main= "GM$Adj.close vs Time")
trend <- lm(time(GM$Adj.Close) ~ (GM$Adj.Close))
abline(trend, col="red")
summary(trend)

GM$log_adj_close <- log(GM$Adj.Close)
ts.plot(GM$log_adj_close, main="GM$log_adj_close vs Time")

GM$log_return <- c(NA, diff(GM$log_adj_close))
GM$log_return <- ts(GM$log_return, start= c(2018,44), frequency = 52)
ts.plot(GM$log_return, main="GM$log_return vs Time")
abline(h=0, lty=2, col="red")

Testing <- GM[258:261,]
Training <- GM[1:257]

Training.log <- Training$log_adj_close
Testing.log <- Testing$log_adj_close

Training.diff <- diff(Training.log)

adf.test(Training.diff)

Acf(Training.diff, lag.max = 5)
Pacf(Training.diff, lag.max = 5)

Arima215 <- Arima(Training.log, order = c(2,1,5), include.drift = T)
summary(Arima215)
confint(Arima215)
coeftest(Arima215)

Arima214 <- Arima(Training.log, order = c(2,1,4), include.drift = T)
summary(Arima214)
confint(Arima214)
coeftest(Arima214)


Arima213 <- Arima(Training.log, order = c(2,1,3), include.drift = T)
summary(Arima213)
confint(Arima213)
coeftest(Arima213)


Arima212 <- Arima(Training.log, order = c(2,1,2), include.drift = T)
summary(Arima212)
confint(Arima212)
coeftest(Arima212)

Arima211 <- Arima(Training.log, order = c(2,1,1), include.drift = T)
summary(Arima211)
confint(Arima211)
coeftest(Arima211)

Arima111 <- Arima(Training.log, order = c(1,1,1), include.drift = T)
summary(Arima111)
confint(Arima111)
coeftest(Arima111)

Arima011 <- Arima(Training.log, order = c(0,1,1), include.drift = T)
summary(Arima011)
confint(Arima011)
coeftest(Arima011)

Arima010 <- Arima(Training.log, order = c(0,1,0), include.drift = T)
summary(Arima010)
confint(Arima010)
coeftest(Arima010)

Arima110 <- Arima(Training.log, order = c(1,1,0), include.drift = T)
summary(Arima110)
confint(Arima110)
coeftest(Arima110)

AIC_table <- data.frame(cbind(Arima010$aic, Arima211$aic, Arima111$aic, Arima212$aic))
names(AIC_table) <- c("arima010", "arima211", "arima111", "arima212")

log2price <- function(a.forecast) {
  a.forecast$mean <- exp(a.forecast$mean)
  a.forecast$upper <- exp(a.forecast$upper)
  a.forecast$lower <- exp(a.forecast$lower)
  a.forecast$x <- exp(a.forecast$x)
  return(a.forecast)
}



forecast111 <- forecast(Arima111, h=4)
View(forecast111)
forecast111[["mean"]]
priceforecast111 <- log2price(forecast111)
priceforecast111[["mean"]]
plot(priceforecast111)
lines(258:261, Testing$Adj.Close, type = "o",   col="red", lwd=2)



arima_forecast111 <- exp(forecast111$mean)
arima_forecast_error111 <- Testing$Adj.Close - arima_forecast111
arima_table111 <- data.frame(cbind(Testing$Adj.Close, arima_forecast111, arima_forecast_error111))
arima_table111

RMSE_Arima111 <- rmse(arima_table111$Testing.Adj.Close, arima_table111$arima_forecast111)
RMSE_Arima111


forecast211 <- forecast(Arima211, h=4)
forecast211[["mean"]]
priceforecast211 <- log2price(forecast211)
priceforecast211[["mean"]]
plot(priceforecast211)
lines(258:261, Testing$Adj.Close, type = "o", col= "red", lwd=2)

arima_forecast211 <- exp(forecast211$mean)
arima_forecast_error211 <- Testing$Adj.Close - arima_forecast211
arima_table211 <- data.frame(cbind(Testing$Adj.Close, arima_forecast211, arima_forecast_error211))

RMSE_arima211 <- rmse(arima_table211$Testing.Adj.Close, arima_table211$arima_forecast211)
RMSE_arima211

FinTS:: ArchTest(Arima211$residuals)
arch <- Arima211$residuals^2
plot(arch)

checkresiduals(Arima211)


