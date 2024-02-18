library(wooldridge)
data("wage2")

mod <- lm(lwage~educ+IQ+exper, data=wage2)
summary(mod)


## coefficients(mod)[2] / 

#
# ONE SIDED POSITIVE
#

# CALCOLCARE IL critical value SU R
# il primo elemento indica il valore
# il secondo i degrees of freedom
qt(.95, df=931)


data("gpa1")
?gpa1

mod2 <- lm(colGPA~hsGPA+ACT, data=gpa1)
summary(mod2)

qt(.90, df=138)

# l'ipotesi nulla per il coeffieciente hsGPA viene rigettata perchè il tvalue è maggiore del critical value
#
# per quanto riguarda ACT il t value è minore del critical value l'ipotesi non viene rigettata
#l'effetto di ACT non è statisticamente significativo

#
# ONE NEGATIVE SIDED
#

data("attend")
mod3 <- lm(final~missed+priGPA+ACT, data=attend)
summary(mod3)

# siccome dobbiamo prendere il negativo possiamo prendere direttamente la probabilità inversa (al posto di 0.99 prendi 0.01
# ed esce il segno opposto)
qt(.01, df=676)
qt(.05, df=676)
qt(.10, df=676)

# dato che i critical value all'1% è -2.33 e il t value -2.25 l'ipotesi non si può rifiutare
# al 5% la possiamo invece rigettare perchè il t value è più piccolo

data("mathpnl")
?mathpnl
meap98 <- mathpnl[mathpnl$y98==1,] 

mod <- lm(math4~lunch+ptr+avgsal+enrol, data = meap98)
summary(mod)

# all'aumentare del'1% del programma lunch il math score diminuisce di 0.32

# all'aumentare del' 1% del pupil/teacher ratio il math score diminuisce di 0.6

# se aumenta il salario medio degli insegnanti aumenta di 1000 dollari il math score aumenta di 0.21

# se aumenta lo school enrollment di 100 il math score aumenta di 0.00266

summary(meap98$enrol)
summary(meap98$avgsal)

critical_value <- qt(.975, df=545)
critical_value

# l'unica variabile non statisticamente significativa è enrol 
# perchè il valore assoluto del suo t-value è minore del critical value

# considerare logarimti avgsalary e enrol potrebbero avere una significatività differente


mod2 <- lm(math4~lunch+ptr+log(avgsal)+log(enrol), data = meap98)
summary(mod2)

# in questo caso log(avgsal) fa si che al 5% la variabile non è più statisticamente significativa


data("nbasal")
?nbasal
mod <- lm(lwage~games+avgmin+points+rebounds+assists, data=nbasal)
summary(mod)

# all'aumento di un games il salario aumenta dello 0.04%
# all'aumentare di un minuto medio a partita lo stipendio aumenta del 3%
# all'aumentare di un punto a partita lo stipendio aumenta del 3.6%
# all'aumentare di un rimbalzo a parita lo stipendio aumenta del 4%
# all'aumentare di un assist a parita il salario aumenta di 0.03%

# usando il p-value notiamo che fissando un alfa pari al 5%:
# hanno un p-value minore di 0.05:
# intercetta, avgmin, points  ----> sono le uniche singificative al 5%

# all'1% nessuna è statisticamente significativa

# CALCOLIAMO I P-VALUE
# usiamo le t-statistics come se fossero il critical-value
# usiamo la funzione pt (funzione che data la t-stat ci da la probabilità)

# t-stat avgminutes
tstat <- coefficients(mod)[3] / sqrt(vcov(mod)[3,3])

2*pt(abs(tstat), df=263, lower.tail = F)


# t-stat games
tstat <- coefficients(mod)[2] / sqrt(vcov(mod)[2,2])

2*pt(abs(tstat), df=263, lower.tail = F)


# t-stat points
tstat <- coefficients(mod)[4] / sqrt(vcov(mod)[4,4])

2*pt(abs(tstat), df=263, lower.tail = F)


# t-stat rebounds
tstat <- coefficients(mod)[5] / sqrt(vcov(mod)[5,5])

2*pt(abs(tstat), df=263, lower.tail = F)


# t-stat assists
tstat <- coefficients(mod)[6] / sqrt(vcov(mod)[6,6])

2*pt(abs(tstat), df=263, lower.tail = F)


data("wage2")
?wage2
mod <- lm(lwage~educ+IQ+exper+meduc, data=wage2)
summary(mod)

# i primi tre coefficienti sono statisticamente significativi in quanto minori il p-value è minore di 0.05

#@ c'è una regola che dice che se la t è maggiore di due il coefficients è statisticamente significativo @#


library(wooldridge)
data("campus")

?campus
 
mod <- lm(lcrime~lenroll, data=campus)
summary(mod)

tst <- (coefficients(mod)[2] - 1)/sqrt(vcov(mod)[2,2])
tst

# calcolo con il critical value
qt(.950, df=95, lower.tail = T)

qt(.975, df=95, lower.tail = T)
# anche con una two sided si rifiuta

# calcolo con p-value
2*pt(abs(tst), df=95, lower.tail = F)



# INTERVALLI COFIDENZA
data("nbasal")

mod <- lm(lwage~games+avgmin+points+rebounds+assists, data=nbasal)
summary(mod)

# primo coefficiente (games) intervallo confidenza
inferiore <- coefficients(mod)[2]- qt(.975, df=263, lower.tail = T) * sqrt(vcov(mod)[2,2])
superiore <- coefficients(mod)[2]+ qt(.975, df=263, lower.tail = T) * sqrt(vcov(mod)[2,2])
c(inferiore,superiore)
# basandoci su questo intervallo siccome il valore di Bj sotto l'ipotesi nulla (Bj = 0) è nell'intervallo di confidenza
# al 5% non possiamo rigettare l'ipotesi nulla


# secondo coefficiente (avgmin) intervallo confidenza
inferiore <- coefficients(mod)[3]- qt(.975, df=263, lower.tail = T) * sqrt(vcov(mod)[3,3])
superiore <- coefficients(mod)[3]+ qt(.975, df=263, lower.tail = T) * sqrt(vcov(mod)[3,3])
c(inferiore,superiore)
# possiamo rigettare l'ipotesi nulla perche il valore di Bj sotto l'ipotesi nulla (Bj = 0) 
# non è nell'intervallo di confidenza

# non è corretto dire che al 95% il parametro della popolazione si trova nell'intervallo
# è corretto dire che il 95% degli intervalli di confdenza costruiti con questo criterio contengono 
# il parametro della popolazione

# l'intervallo cambia sulla base del campione, cio significa che su 100 campioni, su 100 intervalli
# in 95 è presente il parametro


library(wooldridge)
data("twoyear")
?twoyear

mod <- lm(lwage~jc+univ+exper, data=twoyear)
summary(mod)

# all'aumentare di un credito 2-year il salario aumenta di 6.6% (statisticamente singificativo)
# all'auemntare di un credito 4-year il salario aumenta di 7.6% (statisticamente singificativo)

# notiamo quindi una differenza dell'1% tra jc e univ
# per vedere se la differenza è statisticamente significativa creiamo la t-stats

# numeratore: differenza tra jc e univ
numeratore <- coefficients(mod)[2]-coefficients(mod)[3]
numeratore

# denominatore: radice quadrata (standard deviation) della somma delle covarianze meno 2 x covarianza (jc, univ)
denominatore <- sqrt(vcov(mod)[2,2] + vcov(mod)[3,3] - 2*vcov(mod)[2,3] )
denominatore

tstat <- numeratore / denominatore
tstat

# critical value
qt(0.975, df=6759, lower.tail = F)

# usando questo critical value al 5% non possiamo rigettare l'ipotesi nulla 
# perchè il valore della t non è più estremo dei due critical value (-1.46 è interno all'intervallo)



# p-value
2*pt(abs(tstat), df=6759, lower.tail = F) # lowet.tail è FALSE perchè il valore assoluto è sempre positivo 
                                          # quindi considero la coda di destra
  
# è 0.14 non possiamo rigettare ne al 5 che al 10%

qt(0.05, df=6759, lower.tail = T)
# non rifiuto

# test one-sided 10%, possiamo rifiutare?
qt(0.1, df=6759, lower.tail = T)
# possiamo affermare che la nostra ipotesi nulla puo essere rigettata al 10% one-sided negative

# p-value
pt(tstat, df=6759, lower.tail = T) # non prendiamo il valore assoluto perchè sappiamo gia che è negativa


# altro modo: library multcomp
# SCARICARE

library(multcomp)
# funzione glth() general linear hypotesis testing
# parametri
# 1 modello stimato
# 2 stringa che specifica l'ipotesi nulla

funzione <- glht(mod, "jc - univ = 0") 
summary(funzione)



# TESTING MULTIPLE EXCLUSION RESTRICITION
library(wooldridge)
data("mlb1")
?mlb1

# unr = unresticted
unr <- lm(lsalary~years+gamesyr+bavg+hrunsyr+rbisyr, data=mlb1)
summary(unr)

# le ultime tre variabili singolarmente non sono statisticamente significative
# cio non esclude che però prese insieme lo siano

# non simao capcai di stimare com precisione le varianze dei B

# rest = resticted (modello in cui le variabili non singificative sono eliminate)
# vogliamo vedere se eliminadno le tre variabili il fit del modello si deteriora di tanto oppure rimane pio o meno simile
rest <- lm(lsalary~years+gamesyr, data=mlb1)
summary(rest)

# per fare cio vediamo le residuals sum of square (del restricted e dell'unrestricted)
# quello del modello unrestricted è minore

anova(rest, unr) # primo modello restricted, secondo unrestricted

# Res.DF 
# RRS residual sum of square
# F satistica test F
# PR(>F) probabilità che la distribuzione F sia maggiore della t-stat (possiamo riggettare l'ipotesi nulla che tutte e tre
# sono uguali a zero
# almeno uno dei tre è diverso da 0)

library(wooldridge)
data(apple)
?apple

full <- lm(ecolbs~ecoprc+regprc+hhsize+faminc+age+educ, data=apple)
summary(full)

red <- lm(ecolbs~ecoprc+regprc, data=apple)
summary(red)



# F USANDO LA FORMULA
((summary(full)$r.squared - summary(red)$r.squared) / 4) / ((1-summary(full)$r.squared) / 653)

# troviamo il p-value con la distribuzione F (qf e pf)
qf(0.95, 4, 657, lower.tail = T)

# la nostra statistica f (0.64) è piu piccola del critical value (non possiamo rigettare l'ipotesi nulla)
# le tre variabili possono quindi essere uguali a zero

# il primo argomento è la f (probability of f), il secondo degrees of freedom 1, il terzo degrees of freedom 2
pf(0.6478569, 4, 657, lower.tail = F)



anova(red,full)
