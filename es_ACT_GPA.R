GPA <- c(2.8, 3.4, 3.0, 3.5, 3.6, 3.0, 2.7, 3.7)
ACT <- c(21, 24, 26, 27, 29, 25, 25, 30)

mean(GPA)
mean(ACT)


uh <- residuals(lm(GPA~ACT))
yh <- fitted(lm(GPA~ACT))
sum(uh)

b0b1 <- coefficients(lm(GPA~ACT))
                     
b0b1[1] + b0b1[2]*20

summary(lm(GPA~ACT))
## l'Rquadro è 0.57
# possiamo concludere che act è un ottimo predittore per il gpa
