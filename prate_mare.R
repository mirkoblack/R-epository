library(wooldridge)
data("ceosal2")
?ceosal2

SalarioMed <- mean(ceosal2$salary)
SalarioMed

TenMed <- mean(ceosal2$ceoten)
TenMed

length(ceosal2$ceoten[ceosal2$ceoten == 0])

# oppure

length(which(ceosal2$ceoten == 0))


max(ceosal2$ceoten)


#
length(which(ceosal2$ceoten == max(ceosal2$ceoten)))

table(ceosal2$ceoten)
#

mod <- lm(ceosal2$lsalary~ceosal2$ceoten, data = ceosal2)

summary(mod)
  
# ad un aumentare di un anno di ceo il salario aumenta dello 0.97%