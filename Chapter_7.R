## ---------------------------------------------------------------------------------------------
library(wooldridge)
data("gpa2")
head(gpa2[,names(gpa2) %in% c("colgpa", "sat", "hsperc",
                              "athlete", "female") ], n = 10)


## ---------------------------------------------------------------------------------------------
data("wage1")
str(wage1)
table(wage1$female)
mean(wage1$female)
table(wage1$female)/length(wage1$female)


## ---------------------------------------------------------------------------------------------
summary(lm(wage ~ female, data = wage1))


## ---------------------------------------------------------------------------------------------
summary(lm(wage ~ female + exper , data = wage1))


## ---------------------------------------------------------------------------------------------
x <- rnorm(100)
eq1 <- -0.5 + sort(x)
eq2 <- 0.5 + sort(x)
plot(sort(x), eq2, "l", 
     xlim = c(-0.5,0.5), ylim = c(-1,+1), 
     xlab = "", ylab = "", 
     main = "Different intercept but same slope", 
     axes = F, col = "red")
axis(1, line = T)
axis(2, line = T)
lines(sort(x), eq1, "l", col = "blue")


## ---------------------------------------------------------------------------------------------
summary(lm(wage ~ female + educ + exper + tenure, data = wage1))


## ---------------------------------------------------------------------------------------------
male <- 1 - wage1$female 
summary(lm(wage ~ male + educ + exper + tenure, data = wage1))


## ---------------------------------------------------------------------------------------------
summary(lm(wage ~ female + male + educ + exper + tenure, data = wage1))


## ---------------------------------------------------------------------------------------------
summary(lm(lwage ~ female, data = wage1))
summary(lm(lwage ~ female + exper, data = wage1))


## ---------------------------------------------------------------------------------------------
marrmale <- wage1$married *male
marrfem <- wage1$married *wage1$female
singmale <- (1 - wage1$married) *male
singfem <- (1 - wage1$married) * wage1$female


## ---------------------------------------------------------------------------------------------
summary(lm(lwage ~ marrmale + marrfem + singfem +
educ + exper + expersq + tenure + tenursq, data = wage1))


## ---------------------------------------------------------------------------------------------
library(multcomp)
mod1 <- lm(lwage ~ marrmale + marrfem + singfem +
educ + exper + expersq + tenure + tenursq, data = wage1)
summary(glht(mod1, linfct = c("marrfem - singfem = 0")))


## ---------------------------------------------------------------------------------------------
summary( lm(lwage ~ marrmale + singmale + singfem +
educ + exper + expersq + tenure + tenursq, data = wage1))


## ---------------------------------------------------------------------------------------------
library(wooldridge)
data("beauty")
str(beauty)
table(beauty$look)


## ---------------------------------------------------------------------------------------------
table(beauty$look, beauty$belavg)

colSums(table(beauty$look, 
              beauty$belavg)/length(beauty$belavg))

table(beauty$look, beauty$abvavg)

colSums(table(beauty$look, 
              beauty$abvavg)/length(beauty$abvavg))

length(beauty$look[beauty$look == 3])/length(beauty$look)

length(beauty$look[beauty$look == 3])/length(beauty$look) + 
  as.numeric(colSums(table(beauty$look,
          beauty$abvavg)/length(beauty$abvavg))[2]) +
  as.numeric(colSums(table(beauty$look, beauty$belavg)
                     /length(beauty$belavg))[2])


## ---------------------------------------------------------------------------------------------
beau <- lm(lwage ~ belavg + abvavg, data = beauty)
summary(beau)


## ---------------------------------------------------------------------------------------------
# stimiamo il modello considerando i sottomedia e i sopra media
beau <- lm(lwage ~ belavg + abvavg +
             educ + exper + expersq +female, data = beauty)
summary(beau)

#belavg --> guadagnano circa il 20% in meno rispetto a quelli in media
# effetto statisticamente significativo (pvalue < t-value)

# avavg --> guadagnano il 4.5% in meno rispetto a quelli in media
# effetto statisticamente Non significativo (pvalue > t-value)

## ---------------------------------------------------------------------------------------------
beau <- lm(lwage ~ belavg + abvavg +
             educ + exper + expersq, data = beauty[beauty$female == 1,])
summary(beau)

# belavg non statisticamente singificativo
# abvavg non è statisticamente singificativo

## ---------------------------------------------------------------------------------------------

# inseriamo una varaibile di interazione tra due varaibili dummy
femalemarried <- wage1$female * wage1$married
summary(lm(lwage ~  female + married + femalemarried +
educ + exper + expersq + tenure + tenursq, data = wage1))


## ---------------------------------------------------------------------------------------------
x <- rnorm(100)
eq1 <- -0.5 + 0.3 * sort(x)
eq2 <- 0.5 + 1.2 * sort(x)
plot(sort(x), eq2, "l", 
     xlim = c(-0.5,0.5), ylim = c(-1,+1), 
     xlab = "", ylab = "", 
     main = "Different intercepts and slopes", 
     axes = F, col = "red")
axis(1, line = T)
axis(2, line = T)
lines(sort(x), eq1, "l", col = "blue")


## ---------------------------------------------------------------------------------------------
femexp <- wage1$female*wage1$exper
mod1 <- lm(lwage~female + exper + femexp, data = wage1)
summary(mod1)

# gli uomini guadagna ìno il 29% in piu delle donne
# il termine di interazione delta1 dice che la differenza nello slope è al 5% (non significativa)



## ---------------------------------------------------------------------------------------------
data("mroz")
?mroz

summary(mroz$nwifeinc)
# è possibile stimare modelli con varaibile dipendente binaria
# cambia di molto l'interpetazione dei coefficeinti e stimare il modello con l'OLS non è ottimale

m1 <- lm(inlf~ nwifeinc+ educ+ exper+ expersq+ age+ kidslt6+ kidsge6,
         data = mroz)
summary(m1)

# l'intercetta è la probabilità che y=1 quando tutte le x sono zero

# per una donna che ha altre fonti di reditto la probabilità che si trovi in forza lavoro diminuisce

# per ogni hanno di educazione in piu aumenta la probabilità di 0.037 (l'effetto è positivo)

# per ogni anno in piu la probabilità diminuisce di 0.016 (effetto molto basso)


## ---------------------------------------------------------------------------------------------
summary(fitted(m1))
which(fitted(m1)<0)
which(fitted(m1)>1)

# la varianza costante è sempre vilata in questi modelli perchè la varianza dipende dalle x