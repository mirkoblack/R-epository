library(wooldridge)
data(wage2)

mod1 <- lm(lwage ~ educ, data=wage2)
summary(mod1)

mod2 <- lm(lwage ~ educ + IQ, data=wage2)
summary(mod2)

# siamo in una situazione in cui B1 tilde è maggiore B1hat
# b1 tilde = 0.059
# b1hat = 0.039

# andando a calcoare il delta1 la correlazione sarà positiva
# entrambe sono positive e si vanno a sommare a B1hat per dare Btilde

# CALCOLIAMO DELTA1TILDE

# reg x2 su x1
mod3 <- lm(IQ ~ educ, data = wage2)
summary(mod2)

#B1hat + B2hat *
coefficients(mod2)[2] + coefficients(mod2)[3] * coefficients(mod3)[2]

# è uguale a
coefficients(mod1)[2]


# SECODNO ESEMPIO
data("attend")
mod1 <- lm(final ~ missed, data =attend)
summary(mod1)

mod2 <- lm(final ~ missed + priGPA, data =attend)
summary(mod2)

# B1tilde è minore B1hat (b1hat - una certa quantità)
# se priorGPA è positvo cio significa che delta1tilde deve essere negativo

# calcoliamo covarianza priorgpa e missed
cov(attend$misse, attend$priGPA)
# è negativa

#m mode che mette in relazione priorgpa e misseed
mod3 <- lm(priGPA ~ missed, data=attend)
summary(mod3)
coefficients(mod2)[2] + coefficients(mod2)[3] * coefficients(mod3)[2] 
