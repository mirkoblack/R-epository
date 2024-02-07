library(wooldridge)
data("wage1")

mod <- lm(wage~educ, data = wage1)
summary(mod)

help(wage1)

# si chiama log level un modello avente la y logaritmica
mod1 <- lm(lwage~educ, data = wage1)
summary(mod1)

# interpeto b1
# il b1 moltiplicato per 100 è la variazione del salario 
# quando l'educazione aumenta di una unità

# volendo spiegare il logaritmo di y spegare l'intercetta è più difficile
# l'Rquadro dei due modelli anche se diverso, non soo confrontabili perchè stiamo osservando due modelli diversi
# uno con y = wage (linear)
# uno con Y =lwage (logaritm)

