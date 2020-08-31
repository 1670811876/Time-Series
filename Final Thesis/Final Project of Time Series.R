library(TSA)
library(ggfortify)
library(forecast)
library(MTS)
library(fUnitRoots)

data = read.csv("Export_Shanghai.csv")
data$Exports_Others <- data$Exports_Total-data$Exports_USA
head(data)
ts.data <- ts(data, start = c(2015, 2), frequency = 12)
plot(ts.data, type="l", main="Shanghai Export volume")

## Establish model for total exports
ts.exports.total <- ts(data$Exports_Total, start = c(2015, 2), frequency = 12)
adfTest(data$Exports_Total, lags=12)
decompose.ts.exports.total <- decompose(ts.exports.total)
plot(decompose.ts.exports.total)
par(mfcol = c(3, 1))
plot(ts.exports.total)
acf(data$Exports_Total, lag = 36)
pacf(data$Exports_Total, lag = 36)
adfTest(data$Exports_Total, lags=12)

m1 <- arima(data$Exports_Total, order = c(0, 0, 1), seasonal = list(order = c(0, 0, 1), period = 12))
m1

tsdiag(m1, lag=24)
Box.test(m1$residuals, lag=12, type="Ljung")


## Establish model for exports towards USA
ts.exports.usa <- ts(data$Exports_USA, start = c(2015, 2), frequency = 12)
adfTest(data$Exports_USA, lags=12)
decompose.ts.exports.usa <- decompose(ts.exports.usa)
plot(decompose.ts.exports.usa)
par(mfcol = c(2, 1))
acf(data$Exports_USA, lag = 36)
pacf(data$Exports_USA, lag = 36)

m2 <- arima(data$Exports_USA, order = c(0, 0, 2), seasonal = list(order = c(0, 0, 1), period = 12))
m2

tsdiag(m2, lag=24)
Box.test(m2$residuals, lag=12, type="Ljung")

## Regression model with time series error term
m3 <- lm(data$Exports_USA[2:55]~data$Exports_Total[1:54])
summary(m3)

m4 <- arima(data$Exports_USA[2:55], order = c(0, 0, 2), 
           seasonal = list(order = c(0, 0, 1), period = 12),
           xreg=data$Exports_Total[1:54])
m4

tsdiag(m4, lag=24)
Box.test(m4$resdiuals, lag=12, type="Ljung")

source("backtest.R")
mm2 <- backtest(m2, data$Exports_USA, 53, 1)
mm4 <- backtest(m4, data$Exports_USA, 53, 1, xre=data$Exports_Total)

# Test ARCH effect
Box.test(m2$residuals^2, lag=12, type="Ljung-Box")
Box.test(m4$residuals^2, lag=12, type="Ljung-Box")

# Construct VAR model
multi.data <- cbind(data$Exports_USA, data$Exports_Others)
VARorder(multi.data)
m5 <- VAR(multi.data, 2)
mq(m5$residuals, adj=12)
VARchi(multi.data, p=2, thres=1.96)
m6 <- refVAR(m5, thres=1.96)
MTSdiag (m6, adj=12) 
mq(m6$residuals, adj=12)
