data(Journals, package = "AER")
library(sandwich)
library(lmtest)

journ <- Journals[,c("subs", "price",
                     "citations",
                     "foundingyear")]
head(journ)
journ$citeprice <- journ$price/journ$citations
journ$age <- 2023 - journ$foundingyear

journ_lm <- lm(log(subs) ~ log(citeprice), data = journ)
coeftest(journ_lm)

