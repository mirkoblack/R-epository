
# which of the following can cause the usual OLS t-statistics to be invalid (that is, not to have t distributions under H0)?
#  a) heteroskedasticity
#  b) a sample correlation coefficient of 0.95 between two indipendent variables that are in the model
#  c) omitting an important explanatory variable


# il punto b indica multicollinearità, il quale non è un problema perchè non viola nessun ipotesi del modello lineare
# cio che garantisce che la t-value abbia un t-distribution sotto la nulla è che gli errori sono normali con 
# una certa media e un certa varianza

# LA RISPOSTA GIUSTA è 
# a -> perchè un ipotesi base necessaria (gauss markov)  

# b -> se elimini una variabile rilevante fa si che questa è comprese nell'errore, facendo quezto non possiamo più assumere
# che E(u)|x sia zero


# ESERCIZIO 2
# log(salary) = B0 + B1log(sales) + B2roe + B3ros + u

# PUNTO A
# sotto h0 b3 = 0 :H0  
# sotto h1 b3 > 1 :H0 (xk vogliamo studiare l'aumenta del salario / se aumenta a seguito dello stock market)


# PUNTO B
library(wooldridge)
data("ceosal1")
?ceosal1

mod <- lm(lsalary~lsales+roe+ros, data=ceosal1)
summary(mod)

# 1.2% salary a seguito di aumento di 50 punti ros
# no, perchè un aumento del 50% corrisponde ad un aumento di 1.2% del salario


# PUNTO C
# one sided, size 10%
# troviamo t-stat (B3 / standard error)

0.0002417 / 0.0005418  

qt(0.90, 205, lower.tail = T)

# non possiamo rigettare l'ipotesi nulla

# calcolo con p-value
pt(0.4461056, 205, lower.tail = F)


# PUNTO D
# essendo il campione molto piccolo non è da fidarsi ne di B3 ne dello standard error
# è possibile che il campione essendo piccolo non è rappresentatvio
# fare vedere che questa variabile non ha effetto di per se è gia un risultato perchè uno si aspetta il contrario
# andrebbe tenuta perchè un modello economico fatto bene la deve includere 



# ESERCIZIO 1 
# log(rent) = B0 + B1log(pop) + B2log(avginc) + B3pctstud + u

# punto A 
# two sided alternative 
# H0 : B3 = 0
# H1 : B3 != 0

# punto B
# sia B1 che B2 positivi

# punto C
library(wooldridge)
data("rental")
?rental

mod<-lm(lrent~lpop+lavginc+pctstu, data=rental)
summary(mod) 
# è sbagliato, un aumento del 10% della popolazione corrisponde ad un aumento dello 0.43% nel rent e non del 6,6%

# punto D
tstat <- 0.0056 / 0.0017
tstat

qt(0.995, df=124)
# rigettiamo l'ipotesi nulla (critical value < tstat)



# ESERCIZIO 2
# price = B0 + B1assess + u


tstat1 <- 14.47/-16.27
tstat1
qt(0.975, 86, lower.tail = F)

# non rigetti
tstat2 <- 0.976/0.049
tstat2

qt(0.975, 86)


# punto B
# (SSRristretto - SSR non ristretto / q) / SSR nonristretto / n-k-1

numeratore <- (209448.99 - 165644.51) / 2
denominatore <- 165644.51 / (88-2-1)

numeratore/denominatore

qf(0.975, 2 ,df)

# F > critical value rigettiamo l'ipotesi nulla

2* pf(11.23907, 2, 86, lower.tail = F)



# punto C
numeratore = (0.829-0.82)/ 3
denominatore = (1-0.829) / 83

numeratore/denominatore

qf(0.975, 3, 83)
# non rigettiamo l'ipotesi nulla






# ESERCIZIO 3 voteA = B0 + B1log(expendA) + B2log(expendB) + B3prtystrA + u

