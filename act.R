GPA <- c(2.8, 3.4, 3.0, 3.5, 3.6, 3.0, 2.7, 3.7)
ACT <- c(21, 24, 26, 27, 29, 25, 25, 30)

mod <- lm(GPA ~ ACT)

summary(mod)


residuals <- c()

cont <- 1

while (cont <= length(GPA)){
  residuals[cont] <- GPA[cont] - (coefficients(mod)[1] + coefficients(mod)[2]*ACT[cont])
  
  cont = cont+1
}

residuals

sum(residuals)


# GPA con ACT = 20
coefficients(mod)[1] + coefficients(mod)[2]*20