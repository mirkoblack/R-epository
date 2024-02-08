library(wooldridge)
data("bwght")
?bwght

mod <- lm(bwght~cigs+faminc, data = bwght)
summary(mod)

# cambiamo unità del peso da once in pounce



# LOGARITMO
famincdol <- 1000*bwght$faminc
lfamincdol <- log(famincdol)

mod <- lm(lbwght~cigs+lfaminc, data=bwght)
summary(mod)

mod2 <- lm(lbwght~cigs+lfamincdol, data=bwght) 
summary(mod2)

# gli slope non sono cambiati, è cambiata solo l'intercetta
# questo perchè gli effetti di ciascuna variabile indipendente
# devono rimanere invariati sulla variabile dipendente



# INTERPRETAZIONE LOGARITMO
data(hprice2)
?hprice2

mod <- lm(lprice~lnox+rooms, data=hprice2)
summary(mod)

100*(exp(coefficients(mod)[3])-1)

# il cambio è 35% che è differente dal 30% trovato moltiplicando B2*100

