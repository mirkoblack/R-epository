library(wooldridge)
data(gpa2)
head(gpa2[,names(gpa2) %in% c("colgpa","sat",
                              "hsperc","athlete","female")], n=10)

# %in% ---> fai un match tra i nomi del dataset gpa2 e questo vettore che ti indico di seguito #

# nelle prime 10 osservazioni solo due individui sono donne (l'1 e il 10)
# due atleti fanno sport (uno è donna e uno è uomo)



# visualizzare le dummy in R
# puoi usare str per visualizzare quali variabili sono dummy
data(wage1)
str(wage1)

# applichiamo table a female, ci dice quanti campioni sono donne e qunti no
table(wage1$female)

# la media ci dice la proporzione tra uomini e donne (le donne sono il 47.9%)


table(wage1$female) / length(wage1$female)



# stimiamo il modello
mod <- lm(wage~female, data=wage1)
summary(mod)

# in media un uomo guadagna cirsca 7 dollari all'ora (interetta)
# in media una dnna guadagna 4.5 dollari all'ora (7-2.5)
# le donne guadagnano in media due dollari e mezzo in meno degli uomini

# la differenza è signifivativa? guardiamo al t-value e al p-value di delta0
# il t-value è 8.279
# il p-value è molto piccolo
# la differenza è quindi statisticamente significativa


# AGGIUGNIAMO UN ALTRA VARIABILE AL MODELLO
mod1 <- lm(wage~female + exper, data=wage1)
summary(mod1)

# la differenza dei salario tra uomo è donna rimane alta (2.48 circa)
# la differenza tra il salario medio di una donna e di un uomo 
# CON LO STESSO LIVELLO DI ESPERIENZA è di 2.48$


# nel primo modello l'intercetta equivale all amedia degli stipendi degli uomini
mean(wage1$wage[which(wage1$female==0)])

# B0+delta0 sarà la media nelle donne
mean(wage1$wage[which(wage1$female==1)])


# in questo modello l'intercetta può cambiare ma lo slope è fisso


x <- rnorm(100)
eq1 <- -0.5 + sort(x)
eq2 <- 0.5 + sort(x)

plot(sort(x), eq2, "l",
     xlim = c(-0.5,0.5), ylim = c(-1,+1),
     xlab = "", ylab = "",
     main = "intercette differenti - stesso slope",
     axes = F, col = "red")
axis(1, line = T)
axis(2, line = T)
lines(sort(x), eq1, "l", col = "blue")



mod2 <- lm(wage~female + exper+educ+tenure, data=wage1)
summary(mod2)
# è strano che l'intercetta sia negativa, dipende dai dati



#
100*(exp(-0.397)-1)
#

?wage1
#

# male <- 
  
marrmale <- wage1$married *male
marrfem <- wage1$married *female
singmale <- (1-wage1$married) *male
singfem <- (1-wage1$married) *wage1$male


mod <- (lwage~marrmale+marrfem+singfem+educ+exper+expersq+tenure+tenuresq, data=wage1)
summary(mod)