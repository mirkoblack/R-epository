library(wooldridge)

#ESERCIZIO 2 PAGINA 165
# punto 1
# H0: B3 = 0
# H1: B3 > 0

# punto 2
50 * 100 * 0.00024
# no, l'effetto economico è molto basso perchè un aumento di 50 punti del ros
# corrisponde solo ad un aumento del 1.2% dello stipendi del ceo

# punto 3
tstat <- 0.00024/0.00054
tstat

cvalue <- qt(0.9, 205)
cvalue

# non rigettiamo l'ipotesi nulla

pvalue <- pt(tstat, 205)
pvalue

# p-value è maggiore di alpha, non rigetto


#ESERCIZIO 3 PAGINA 165
# punto 1
0.321 * 10 / 100
# se sales aumenta del 10% le spese in ricerca e sviluppo aumentano dello 0.0321%
# l'effetto economico è molto basso

# punto 2
# H0: B1 = 0
# H1: B1 > 0

tstats <- 0.321/0.216
tstats

cvalue5 <- qt(0.95, 29)
cvalue5
# non rigetto al 5%

cvalue10 <- qt(0.90, 29)
cvalue10
# rigetto al 10%


# punto 3
# ad un aumento dell'1% di profmarg corrisponde un aumento dello 0.05% delle le spese in ricerca e sviluppo
# l'effetto economico è basso perchè se aumenta profmarg del 100% le spese in R&D aumentano solo del 5%

# punto 4
tstatprofmarg = 0.05/0.046
tstatprofmarg
# no perchè la tstat è minore del critical value sia al 5 che al 10%


#ESERCIZIO 4 PAGINE 166

# punto 1
# H0: B3 = 0
# H1: B3 != 0

# punto 2
# positivi

# punto 3
# la rent non aumenta del 6.6% ma di 0.66%

# punto 4
tstat <- 0.0056/0.0017
tstat

qt(0.995, 60)

# rigettiamo l'ipotesi nulla perchè la t-statistica è maggiore del critical value

#ESERCIZIO 5 PAGINE 166
# punto 1
cvalue <- qt(0.975,137)
cvalue

estremoinferiore <- (0.412 - cvalue*0.094)
estremoinferiore

estremosuperiore <- (0.412 + cvalue*0.094)
estremosuperiore

# punto 2
# non puoi rigettare l'ipotesi perchè 0.4 si trova nell'intervallo di confidenza

# punto 3
# puoi rigettare l'ipotesi perchè 1 non si trova nell'intervallo di confidenza


#ESERCIZIO 6 PAGINE 166
# punto 1
# livello significatività 10%

criticalValue <- qt(0.95,86)
criticalValue

tstatB0 <- abs(-14.47/16.27)
tstatB0
# non rigettiamo l'ipotesi nlla

tstatB1 <- 0.976/0.049
tstatB1
# rigettiamo l'ipotesi nulla


# punto 2

numeratore <- (209448.99 - 165644.51) / 2
denominatore <- 165644.51 / (88-1-1)

fstat <- numeratore/denominatore
fstat





# ESERCIZIO 9 PAGINA 167

# punto 1
tstatEduc <- 11.13/5.88
tstatEduc

tstatAge <- 2.2/1.45
tstatAge

qt(0.975,702)

# non possiamo rigettare le ipotesi nulle


# punto 2
numeratore <- (0.113 - 0.103) / 2
denominatore <- (1 - 0.113) / 702

fstat <- numeratore/denominatore
fstat

qf(0.975,2,702)
# rigettiamo l'ipotesi in quanto la F-stat è maggiore del critical value


# ESERCIZIO C1
# punto 1
# all'aumentare di un'unità di spesa del candidato A per la campagna elettorale
# i voti del candidato A aumentano del 100*B1 %

# punto 2
# H0: B1 = -B2 (B1 + B2 = 0)

# punto 3
library(wooldridge)
data("vote1")
?vote1

mod <- lm(voteA ~ lexpendA + lexpendB + prtystrA, data=vote1)
summary(mod)

serror <- sqrt((0.38215)^2 + (0.37882)^2 + 2*vcov(mod)[2,3])
serror

tstat = (6.08332-6.61542)/serror
tstat


# ESERCIZIO 3 PAG 220
# punto 1
abs(0.0003/(2*0.000000007))
# al punto 21428

# punto 2
tstat <- 0.000000007/0.0000000037
tstat
# no perchè non è statisticamente signficativo

# punto 3
# rdintens = 2.613 + 0.3 salesbil - 0.0037 salesbil^2


# ESERCIZIO 1 PAG 257
# punto 1
# si c'è un eidenza che gli uomini dormono piu delle donne
# l'effetto è comunque molto basso in quanto mediamente di 88 minuti a settimana, meno di 15 al giorno

# punto 2
-0.163/0.018
# si il trade off è statisticamente significativo

# punto 3
# sleep su totwrk,educ,male


# ESERCIZIO 3
# punto 1
-2.19/0.53
# si il termine quadratico è statisticamente significativo

abs(19.3/(2*-2.19))
# il punto ottimale è 4.4

# punto 2
nonblackfem <- -45.09 + 1028.1
nonblackmale <- 1028.10

nonblackfem - nonblackmale
-45.09/4.29

# punto 3
# la differenza è di 169.81
-196.81/12.71
# la differenza è statisticamente singificativa

# punto 4
62.31 + 45.09
# la differenza è di 107.4

# per testare che la differenza sia signifciativa 
# dobbiamo scegliere come classe di riferiemnto nonblack-female


# ESERCIZIO 5
# punto 1
# l' intercetta cambia
# il coefficiente d0hat cambia di segno

# punto 2
#rimane invariata

# punto 3
# no perchè ci sarebbe perfetta collinearità