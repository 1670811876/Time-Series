setwd("E:/Time Series/Homework")

data <- read.table("data/q-gnp4710.txt", header=T)
head(data)
G <- data$VALUE
LG <- log(G)
gnp <- diff(LG)
dim(data)
tdx <- c(1:153)/4+1947
par(mfcol=c(2, 1))
acf(gnp, lag=12)
pacf(gnp, lag=12)
m1 <- arima(gnp, order=c(3, 0, 0))
m1
tsdiag(m1, gof=12)
names(m1)
m1$coef
p1 <- c(1, -m1$coef[1:3])
r1 <- polyroot(p1)
r1
Mod(r1)