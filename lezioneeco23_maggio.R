library(wooldridge)
data("econmath")

mod_nonristretto <- lm(score~work+I(work^2)+hsgpa+act, data=econmath)
summary(mod_nonristretto)

mod_ristretto <- lm(score~hsgpa+act, data=econmath)
summary(mod_ristretto)

anova(mod_ristretto,mod_nonristretto)

cor(econmath$work,econmath$work^2)

# modello solo work
mod <- lm(score~work+hsgpa+act, data=econmath)
summary(mod)



data("wage2")

# modello senza termine di interazione
mod1 <- lm(lwage~educ+IQ, data=wage2)
summary(mod1)


# modello con termine di interazione
educIQ <- wage2$educ * wage2$IQ
mod2 <- lm(lwage~educ+IQ+educIQ, data=wage2)
summary(mod2)
# le tre varaibili non sono statisticamente significative (t-value minore di 2)

# sottrei media
educ0IQ0 <- (wage2$educ - mean(wage2$educ)) * (wage2$IQ - mean(wage2$IQ))
mod3 <- lm(lwage~educ+IQ+educ0IQ0, data=wage2)
summary(mod3)

# educ e IQ sono tornate ad essere statisticamente singificative
# in questo caso i coefficienti di educ e IQ sono molto vicini a quelli che avevamo con il primo modello

# l'effetto dell'educzione sul salario quando il QI è 10 punti piu alto della media
# coefficinete educazione + (coefficiente educ0IQ0 * 10)


