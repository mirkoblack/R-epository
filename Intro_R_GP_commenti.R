## ----setup, include=FALSE------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, keep_tex = T)


## help(mean)

## ?mean


## install.packages("wooldridge")

## library(wooldridge)


## ---- arithmetic expressions and assign----------------------------------------------------
5+1
4-3
4^2
3/4
2*9


## ---- assign, eval = T, echo = T-----------------------------------------------------------
## assengare valori
x <- 4
x
y <- 3
y
z <- x-y
z
t <- 2
t
r <- 5
r
z <- log(t)/r
z


## ---- generating vectors-------------------------------------------------------------------
## c in r significa concatenate, permette di creare un vettore
z <- c(3,2.1,4.55,3,9)
z
e <- c(1,2,3,4,5)
e
## concatante puo anche concatenare piu vettori
p <- c(z,e)
p
## vettore stringa
names <- c("price","sqrft","bed","bath")
names
names2 <- "growth"
names2
Names <- c(names,names2)
Names


## ---- sort---------------------------------------------------------------------------------
z <- c(3,2.1,4.55,3,9)

## la funzione sort prende come primo argomento il bettore e come 
## secondo decreasing (true se decrescente)
#(false se crescente)   riordina

zdec <- sort(z, decreasing = TRUE)
zdec

## di defualt il decreasing è false, crescente
zsort <- sort(z)
zsort

## ---- indexed------------------------------------------------------------------------------
## l'indexing è l'estrazione di valori da u vettore

## genero un vettore q da z prendendo solo i valori di z >=3
q <- z[z>=3]
q

## se evidenzio z>=3 crea un vettore che prende il nome di vettore logico
## assegna true hai valori che rispettano il vincolo
##false a cuqelli che non lo rispettano
z>=3


## quando il vettore logico è nelle parentesi quaadre il vettore prenderà solo il valori 
## con true nel vettorie logico


## estraggo l'elemento in posizione 3 nel vettore z e lo assegno ad una variabile
p <- z[3]
p

## i due punti indicano una sequenza estraggo più elementi contemporanemnte
## (prenid i primi 3 elementi di z e assegnali ad u)
u <- z[1:3]
u

## si pio usare concatenate per indicare gli elementi del vettore
## prenid lgi elementi 1 e 2 di z con concatenate e assengali ad u1
u1 <- z[c(1,2)]
u1

## elimino i valori in posizione 1 e 2
u2 <- z[-c(1,2)]
u2


## ---- sequence-----------------------------------------------------------------------------

## la fuznione sequence permette di creare vettori
## crea una sequenza partendo dal primo elemento difino al secondo
Q1 <- seq(1,5)
Q1

## l'ultimo elemento definisce il passo ( di defualt è 1)
## (vai da uno a 3 con passo di 0.5)
q1 <- seq(1, 3, 0.5)
q1

## due sequenze possono essere unite con concatenate
A <- c(seq(1, 30, 5), seq(1, 2, 0.1))
A

## si possono crrare anche sequenze che vanno da un numero più grande ad un numero più piccolo
Q2 <- seq(15, 1)
Q2


com <- c(seq(0, 6, 2), seq(1, 7, 2))
com
sort(com)
sort(com, decreasing = TRUE)

## la funzione reverse inverte il vettore (l'ultimo diventa il primo, il penultimo il secondo....)
q1 <- rev(q) 
q1


## ------------------------------------------------------------------------------------------
1:5
5:1


## ---- rep----------------------------------------------------------------------------------
## replicate replica il primo argomento un numero di volte pari al secondo argomento
i <- rep(1, 10)
i


## ------------------------------------------------------------------------------------------
## è possibile replicare le sequenze pi volte
q <- 1:5
q
## il primo parametro è la sequenza, il secondo il numero di volte
qqq <- rep(q, 3)
qqq


## ------------------------------------------------------------------------------------------
## unique estrea da un vettore solo i valori ripeturi una volta sola
## (se ci sono ripetizioni le si prende una volta sola)
q <- unique(qqq)
q


## ------------------------------------------------------------------------------------------
## replicare una sequenza q e onguno dei nueri deve essere ripetuto due volte
qq <- rep(q, 2, each=2)
qq


## ---- sum,diff,prod,cumsum,cumprod---------------------------------------------------------
## fai la somma
sum(q)

## differenza (crea una sequenza dove calcola il secodno - il primo, il terzo - il secondo, il quarto - il terzo....)
diff(q)

# prodotto
prod(q)

## la somma cumulata crea un vettore in cui il primo elemento è il primo
# il secodno = primo + secodno
# il terzo = primo + secodno + terzo ....
cumsum(q)

# prodotto cumulato
cumprod(q)


## ---- generating from a normal distribution------------------------------------------------
# genereare vettori da distribuzioni note (distribuzioni di probabilità)
## la forma della normale dipende solo da media e varianza (dev standard) 
# è continua

# norm indica la distrubizione normale
# r inidca "generating random number"

# r norm indica la generqzione di numeri causali a partire da una distribuzine normale
norm1 <- rnorm(10)
norm2 <- rnorm(100)
norm3 <- rnorm(1000)
norm4 <- rnorm(10000)
norm5 <- rnorm(100000)
norm6 <- rnorm(1000000)


## ------------------------------------------------------------------------------------------
## per ogni vettore calcolo media e deviazione standard
res1 <- c(mean(norm1), sd(norm1))
res2 <- c(mean(norm2), sd(norm2))
res3 <- c(mean(norm3), sd(norm3))
res4 <- c(mean(norm4), sd(norm4))
res5 <- c(mean(norm5), sd(norm5))
res6 <- c(mean(norm6), sd(norm6))

# sd standard deviation
# mettiamo i risultati in una tabella
tab <- rbind(res1, res2, res3, res4, res5, res6)
colnames(tab) <- c("mean","st.dev")
tab


## ------------------------------------------------------------------------------------------
norm6 <- rnorm(1000000)

## varianza
var(norm6)

# mediana
median(norm6)

# calcola il minimo
min(norm6)

#calcola il massimo
max(norm6)

# la funzione range tira fuori due numeir: il minimo e il massimo
range(norm6)

# calcolimao la differenza del ragne 
diff(range(norm6))


## ---- plots of histograms, echo= T, eval = T-----------------------------------------------

# GRAFICI IN R

# par è una funzione che permette di definire i parametri dei grafici (par --> parametro)
# mfrow --> multiple features rows
# creaimo un grafico che contiene multipli sottografici
## concateniamo i grafici in una matrice avente due righe e due colonne
par(mfrow=c(2,2))

p <- rnorm(100)
y <- rnorm(1000)
z <- rnorm(10000)
w <- rnorm(100000)

# hist sta per instogramma
# curve è un grafico a curva che viene fuori dalla distruìibuziine neromale
# lines è un grafico che prende dei punti e ci crea un grafico a linea

# xlab = label asse delle x
# main = main title del grafico
# border = coloro bordo del grafico
hist(p, freq = FALSE, xlab = "n=100", main = "A", border = "yellow")
curve(dnorm(x), add = T)
lines(sort(p), dnorm(sort(p)), "l", col = "blue")
lines(density(p), col = 4)

hist(y, freq = FALSE, xlab = "n=1000", main = "B", border = "yellow")
lines(sort(y), dnorm(sort(y)), "l", col = "blue")
lines(density(y), col = 4)

hist(z, freq = FALSE, xlab = "n=10000", main = "C", border = "yellow")
lines(sort(z), dnorm(sort(z)), "l", col = "blue")
lines(density(z), col = 4)

hist(w, freq = FALSE, xlab = "n=100000", main = "D", border = "yellow")
lines(sort(w), dnorm(sort(w)), "l", col = "blue")
lines(density(w), col = 4)


## ---- echo= T, eval = T--------------------------------------------------------------------
## chi quadrato (è una funzione a simmetrica) rchisq
par(mfrow=c(2,2))
x <- rchisq(100, 3)
y <- rchisq(1000, 3)
z <- rchisq(10000,3)
w <- rchisq(100000,3)
hist(x, freq = FALSE, xlab = "n=100", ylim = c(0,0.30))
lines(sort(x), dchisq(sort(x), df = 3), col = 2)
hist(y, freq = FALSE, xlab = "n=1000", ylim = c(0,0.30))
lines(sort(y), dchisq(sort(y), df = 3), col = 2)
hist(z, freq = FALSE, xlab = "n=10000", ylim = c(0,0.30))
lines(sort(z), dchisq(sort(z), df = 3), col = 2)
hist(w, freq = FALSE, xlab = "n=100000", ylim = c(0,0.30))
lines(sort(w), dchisq(sort(w), df = 3), col = 2)


## ---- echo=TRUE, eval=TRUE-----------------------------------------------------------------
## distribuzione uniforme runif (dipende da due parametri: a,b)
n <- 6
op <- par(mfrow = n2mfrow(n))
x <- runif(100,-2,2)  #100 = numero osservazioni -2 primo parametro 2 secondo parametro
y <- runif(1000,-2,2)
z <- runif(10000,-2,2)
w <- runif(100000,-2,2)
q <- runif(1000000,-2,2)
m <- runif(10000000,-2,2)
hist(x, freq = FALSE, xlab = "n=100", col = 1)
hist(y, freq = FALSE, xlab = "n=1000", col = 2)
hist(z, freq = FALSE, xlab = "n=10000", col = 3)
hist(w, freq = FALSE, xlab = "n=100000", col = 4)
hist(q, freq = FALSE, xlab = "n=1000000", col = 5)
hist(m, freq = FALSE, xlab = "n=10000000", col = 6)


## ---- echo= T, eval = T--------------------------------------------------------------------
## t di student rt
par(mfrow=c(2,2))
p <- rt(100, df=120)
y <- rt(1000, df=120)
z <- rt(10000,df=120)
w <- rt(100000,df=120)

## GRAFICI SBAGLIATI

hist(p, freq = FALSE, xlab = "n=100",main = "A", border = "yellow", ylim = c(0,0.30))
curve(dt(x,df=120),add=T)
lines(sort(p), rt(sort(p), df = 3), col = 2)
lines(density(p), rt(sort(p), df = 3), col = 2)


hist(y, freq = FALSE, xlab = "n=1000", main = "A", border = "yellow", ylim = c(0,0.30))
curve(dt(x,df=120),add=T)
lines(sort(y), rt(sort(y), df = 3), col = 2)


hist(z, freq = FALSE, xlab = "n=10000", main = "A", border = "yellow", ylim = c(0,0.30))
curve(dt(x,df=120),add=T)
lines(sort(z), rt(sort(z), df = 3), col = 2)


hist(w, freq = FALSE, xlab = "n=100000", main = "A", border = "yellow", ylim = c(0,0.30))
curve(dt(x,df=120),add=T)
lines(sort(w), rt(sort(w), df = 3), col = 2)



## ---- echo= T, eval = T--------------------------------------------------------------------
## distribuzione f rf
par(mfrow=c(2,2))
p <- rf(100, df1=70, df2=10)
y <- rf(1000, df1=70, df2=10)
z <- rf(10000, df1=70, df2=10)
w <- rf(100000, df1=70, df2=10)

## GRAFICI SBAGLIATI

hist(x, freq = FALSE, xlab = "n=100", main = "A", border = "yellow", ylim = c(0,1))
curve(df(x,df1=70, df2=10), add = T)
lines(sort(x), df(sort(x), df1 = 70, df2 =10), "l", col = 2)
lines(density(w), col = 4)

hist(y, freq = FALSE, xlab = "n=1000", main = "A", border = "yellow", ylim = c(0,1))
curve(df(x,df1=70, df2=10), add = T)
lines(sort(y), rf(sort(y), df = 3), col = 2)

hist(z, freq = FALSE, xlab = "n=10000", main = "A", border = "yellow", ylim = c(0,1))
curve(df(x,df1=70, df2=10), add = T)
lines(sort(z), rf(sort(z), df = 3), col = 2)

hist(w, freq = FALSE, xlab = "n=100000", main = "A", border = "yellow", ylim = c(0,1))
curve(df(x,df1=70, df2=10), add = T)
lines(sort(w), rf(sort(w), df = 3), col = 2)





## ---- prelim-------------------------------------------------------------------------------
#i vettori in R non hanno dimensione a differenza delle matrici e degli array
# i vettori hanno un altro attributto, l'attributo lunghezza lenght
x <- 1:5
x
dim(x) #
length(x) # lunghezza (numero elementi)


## ------------------------------------------------------------------------------------------
## funzione per definire le dimensioni di un vettore 
dim(x) <- c(1,5) #assenga dimensioni al vettore x, le dimensioni sono 1,5 (si usa concatenate) 
## (una riga, cinque colonne)
## essendo una matrice ha solo 2 dimensioni (gli elementi non possono avere piu di due dimensioni)
dim(x)
x
class(x) ## x è una matrice
## le matrici in R sono sottoinsiemi di array
## gli array sono matrici a più dimensioni


## ------------------------------------------------------------------------------------------
## la funzione t (transpose) fa la trasposta di una matrice
y <- t(x)
y
dim(y)


## ------------------------------------------------------------------------------------------
## la funzione array concerte un vettore in matrice ?? (2 paramteri: vettore e dimensione )
x <- 1:5
x <- array(x, c(1,5))
class(x)


## ------------------------------------------------------------------------------------------
p <- rnorm(30)
p <- array(p, c(5,2,3))
p
PO <- p[,,1] ## permette di isolare gli elementi di un arrray (sto isolando solo la prima delle 3 dimensioni)
## prendi tutte le righe e tutte le colonne ma solo la prima dell aterza dimendione
PO
## controllo booleano su array (è un array o no?)
is.array(p)


## ------------------------------------------------------------------------------------------
d <- seq(1,16) ## genero numeri da 1 a 16
C <- matrix(d, nrow = 4, ncol = 4) ## li organizzo in una matrice 4x4
C
## notiamo che la matrice viene ordinata per colonna
#byrow permette di ordinare i valori per riga
R <- matrix(d, 4, 4, byrow = TRUE)
R
dim(R) ## restituisce le dimensioni della matrice
is.matrix(R) # controllo booleano sulle matrici
is.array(R) # se un oggetto è una matrice a maggior ragione è anche in array
class(R) # se controlliamo la classe notimao che viene indicata sia matrix che array


## ------------------------------------------------------------------------------------------
a <- rnorm(3)
b <- rnorm(3)
c <- rnorm(3)
a
b
c
## rbind e cbind 
# rbind mette isnieme i vettori per riga (primo vettore una riga, secondo vettore un altra rgia e...)
M <- rbind(a, b, c)
M
# cbind mette inisme i vettori per colonna (primo vettore una colonna, secondo u altra e ...)
J <- cbind(a, b, c)
J

J1 <- t(M) # se fai la trasposta di M (con cbind) ottiene M (con rbind)
J1

is.matrix(M)
is.matrix(J)


## ------------------------------------------------------------------------------------------
ncol(M) # restituisce numero colonne
nrow(M) # restituisce numero di righe
rowSums(M) # somma per riga
colSums(M) # somma per colonna


## ------------------------------------------------------------------------------------------
## indexing
M
M[2,3]      ## single elements estrazione (sto estraendo l'elemento che si torva nella seconda riga e terza colonna)
sr <- M[2,] ## single row estraggo la seconda riga (tutti gli elementi della seconda riga)
sr
tc <- M[,3] ## single column estraggo la terza colonna (tutti gli elemeni della terza colonna)
tc
# nel momento in cui estrai una colon a o una riga ottieni un vettore
class(tc)
str <- M[c(1,3),] ## multiple rows (prima secodna terza riga)
stc <- M[,2:3]    ## multiple columns (seconda terza colonna)
mtc <- M[,-3]     ## delete a single column


## ------------------------------------------------------------------------------------------
# diag sta per diagonale
a <- rnorm(3)
b <- rnorm(3)
c <- rnorm(3)
M <- rbind(a, b, c)
## se l'argomenyo è un numero crea una matrice nXn con 1 sulle diagonali
diag(3)
# se largomento è una Lettere
diag(M)
# se l'argomento è un vettore si ottine una matrice con gli elementi del vettore sulla diagonale
x <- seq(1,5)
diag(x)
# specificare gli elementi sulla diagolnale
diag(M) <- 0 # metti tutti gli elementi sulla diagonale di M a 0
M


## ------------------------------------------------------------------------------------------
colnames(M) <- c("First","Second", "Third") # assegnare nomi a colonne
rownames(M) <- c("Row1","Row2", "Row3") # assegnare nomi a righe
M


## ------------------------------------------------------------------------------------------
# operazioni su matrici
A <- matrix(1:9,3,3)
B <- matrix(1:9,3,3)
# queste operazioni sono operazioni element per elemento
A-B # differenza (in ogni posizion x c'è la differnza tra A[x] e B[x])
A+B # somma elelemtno x elemento

v <- 2
A*v # prodotto matrice x scalare (ogni elemento della matrice viene moltiplicato singolarmente per lo scalare)
A/v # rapporto matrice x scalare


## ------------------------------------------------------------------------------------------
# generiamo due array 
x <- array(1:5, c(1,5))
y <- array(5:1, c(1,5))
x
y
# moltiplicazione degli elementi di due array nelle stesse rispettive posizoni
## prodotto elemento x elemento tra due array
z <- x*y
z


## ------------------------------------------------------------------------------------------
M <- matrix(1:9, 3, 3) # matrive
v <- c(1:3) # vettore
M
v
v*M # moltiplico il vettore per ogni colonna 
M*v # succede la stessa cosa, il vettore viene conisderato come vettore colonna
M-v #
M+v
M/v

# se le dimensioni del vettore sono diverse dalle dimensioni della matrice da errore
f <- c(1:4)
M * f

## ------------------------------------------------------------------------------------------
# prodotto matriciale
v %*% M ## R assume che il vettore v sia una matrice 1x3
M %*% v ## siccome v non ha dimension (se pre moltiplicato R lo assume come 1x3, se post moltilicato lo assuma come 3x1)


## ---- eval=FALSE---------------------------------------------------------------------------
## v <- array(v,c(1,3))
## dim(v)
## v %*% M
## M %*% v
## creo il vettore come array (gli assegno delle dimensioni)


## ------------------------------------------------------------------------------------------
r <- 1:3
A/r 

as.matrix(r) # forza il vettore a diventare una matrice

## ------------------------------------------------------------------------------------------
x <- 1:3
## la funzione outer (outer product) che permette di calcolare il vettore x il suo trasposto
outer(x, x)
x %o% x
x %*% t(x)


## ------------------------------------------------------------------------------------------
## cross product (prendo x e calcolo il trasposto * x)
X <- matrix(runif(400,1,10), 100, 4)
Xt <- t(X)
dim(Xt)
XtX <- Xt%*%X
XtX
XtX2 <- crossprod(X)
XtX2
all.equal(XtX,XtX2) # controlla se gli elementi di due matrici sono uguali


## ------------------------------------------------------------------------------------------
# crossporduct puo essere utilizzata anche con piu argomenti, non con un singolo
A <- matrix(1:6, 2,3)
A
B <- matrix(seq(2.5,5,0.5), 2, 3)
B
C <- crossprod(A, B)
C
dim(C)

## ------------------------------------------------------------------------------------------
X <- matrix(rnorm(100),25,4)
y <- rnorm(25)


## ------------------------------------------------------------------------------------------
## OSL (X'X) alla -1 X' y
Xt   <- t(X)
XpX  <- Xt%*%X
XpXi <- solve(XpX) # solve colacola l'inverso (alla -1)
Xpy  <- Xt%*%y
b    <- XpXi%*%Xpy
b


## ------------------------------------------------------------------------------------------
# SECONDO MODO uso del cross product
XpX2  <- crossprod(X)
Xpy2  <- crossprod(X,y)
XpXi2 <- solve(XpX2)
b2    <- XpXi2%*%Xpy2
b2


## ------------------------------------------------------------------------------------------
# TERZO MODO in una sola linea 
# la funzione solve è utile a troavre la soluzione di un sistema di equazioni lineari quando sono specificati i due argomenti
b3   <- solve(crossprod(X),crossprod(X,y))
b3


## ------------------------------------------------------------------------------------------
## lista
# una lista in R è una collezione di oggetti differenti
vec <- c("one","two","three")
n <- 1:8
AN <- list(char = vec, numer = n) #list permette di creare una lista (questa lista ha 2 oggetti)
AN


## ------------------------------------------------------------------------------------------
# con il $ estraggo dalli lista l'elemento con quel nome
AN$char
AN$numer


## ------------------------------------------------------------------------------------------
# si possono usare due parentesi quadrate per estrarre elementi dalla lista
AN[[1]]
AN[[2]]


## ------------------------------------------------------------------------------------------
AN[[1]][1] ## estraggo elementi specifici di uno specifico elemento della lista
AN[[2]][1:2]
class(AN)

AN$char[1]

## ------------------------------------------------------------------------------------------
# DATASETS
names <- list(male = c("Bob","Paul"), female = c("Rebecca","Elisabeth")) ## due elementi ognuno contenente due elementi (due nomi)
height <- list(tall = c(6.2, 7), normal = c(5.8, 6))
lst <- c(names, height)# metto insieme due liste con la funzione concatenate
lst
lst$male
lst[[1]]
lst2 <- list(names, height) # creo una lista delle due liste
lst2
lst2$male
lst2[[1]]
lst2[[1]]$male
class(lst)
class(lst2)


## ------------------------------------------------------------------------------------------
# DATAFRAME
# creo 5 vettori tutti con la funzione concatenate (ognuno per ogni attributo)
# utilizzando data.frame creiamo un dataFrame prendendo come parametri i vettori contenteti i valori degli attributi
# LA POSIZIONE DEGLI ELEMENTI NEI DIVERSI VETTORI CHE RIFERISCONO ALLA STESSA UNITA' STATISTICA SI DEVONO TROVARE
# NELLA STESSA POSIZIONE IN OGNI VETTORE
FNames <- c("Brad","Russel","Nicolas", "Mel", "Kobe", "LeBron",
            "Hillary","Paris","Nicole","Julia", "Serena","Venus")
LNames <- c("Pitt","Crowe","Cage","Gibson","Bryant","James",
            "Clinton","Hilton","Kidman", "Roberts","Williams","Williams")
sex <- c(rep("Male",6),rep("Female",6))
yborn <- c(1963,1964,1964,1956,1978,1984,1947,1981,1967,1967,1981,1980)
height <- c(5.11, 5.11, 6, 5.9, 6.6, 6.8, 5.6, 5.7, 5.10, 5.8, 5.10, 6.1)
Data <- data.frame(FNames,LNames,sex,yborn,height)
class(Data) 


## ------------------------------------------------------------------------------------------
str(Data)
?str

Data$LNames # estrarre singole variabili usando il dollaro

## ------------------------------------------------------------------------------------------
attributes(Data) 


## ------------------------------------------------------------------------------------------
Data$sex
head(Data, n = 6) # head permette di estrarre un numero specifico di elementi (in questo caso 6)


## ------------------------------------------------------------------------------------------
summary(Data) # il sommario fornisce informazioni importanti quali media mediana e quartili


## ------------------------------------------------------------------------------------------
# attraverso le espressioni logiche è possibile estrarre elementi che soddisfano determinate condizioni dal dataset
Data[sex == "Male" & yborn >= 1970,] # estraggo tutti i maschi nati il 1970 o dopo


## ------------------------------------------------------------------------------------------
w <- subset(Data, sex=="Male") # subset crea un subset dei dati secondo un espressione logica
# prende due argomenti (il dataset e l'espressione logica)
w
class(w)
Data$LNames[sex=="Male" & yborn >= 1970]


## ------------------------------------------------------------------------------------------
# transform prende come primo argomento il dataset, come seondo parametro crei una variabile che si puo creare combinando variabili del dataset
Data2 <- transform(Data, age=2023 - yborn)
Data2


## ------------------------------------------------------------------------------------------
# split crea due o piu dataset con i valori di una varaibile
# se splitti rispetto al sesso si creano due dataset indipendeti (uno contentente solo uomini e uno solo donne)
# in questo modo sp diventa una lista di dataset
sp <- split(Data, sex)
sp$"Female"
sp$"Male"


## ---- background= "yellow", highlight=TRUE-------------------------------------------------
# order permette di modificare l'ordine
ORD <- order(Data2$age, Data2$height) # (il primo criterio è l'età, a parità del primo criterio si considera il secondo, l'altezza)
# (i numeri sotto ORD indicano la posizione nella quale si trovava l'elemento nel dataset non ordinato)
cbind(Data2, ORD)
Data2[ORD,]


## ------------------------------------------------------------------------------------------
## come costruire una funzione 
# quetsa funzione calcola media e varianza campionaria di un vettore
# parola chiave function
# tra parentesi i parametri/argomenti
# il primo è il vettore, 
# il secondo indica come bisogna comportari con i MV
#rm_mv significa remove_missing_value, di default è false
# il corpo della funzione va messo tra parentesi graffe
myfunct <- function(x, rm_mv = FALSE){
         xbar <- sum(x, na.rm = rm_mv)/length(x)
         v <- sum((x-xbar)^2, na.rm = rm_mv)/(length(x)-1)
         return(list(Mean = xbar, Variance = v))
}

# na.rm indica cosa fare dei missing value, essendo uguale a rm_mv (che è false) significa che non vanno elimnati
myfunct

## ------------------------------------------------------------------------------------------
source("meanvar.R") # cariare file da stessa directory
x <- rnorm(100)
MV <- myfunct(x)
MV


## ------------------------------------------------------------------------------------------
mean(x)
var(x)


## ------------------------------------------------------------------------------------------
# ciclo for
# voglio calcoalre la somma delle righe di una matrice
A <- matrix(1:16, 4, 4) # costruisco la matrice
s <- c() # creo un vettore vuoto per mettere la somma delle righe

# il for loop ha una variabile di loop generalmente chiamata i (per i che va da 1 a numero di righe di A [nrow(A)])
for (i in 1 : nrow(A)){
  s[i] <- sum(A[i,])	# metti nella posizone i-esima del vettore s la somma dell'i-esima rig di A
}
s
rowSums(A)


## ------------------------------------------------------------------------------------------
# apply permette di creare anche lui dei loop
# è una funzione che ha lo stesso effetto di un loop
# ammete solamente matrici
# argomenti: 
# primo - matrice
# secondo - inidca o le rgihe o le colonne della matrice (1 inidca le righe)(2 inidca le colonne)
# terzo - una funzione (qualsiasi, anche creata da te)
# apply sta dicendo quindi di applicare alle righe della matrice A la funzione sum

apply(A, 1, sum)

apply(A,1,myfunct)


## ------------------------------------------------------------------------------------------
# ciclo while
i <- 1
k <- c()

while (i <= 10){
  
  k[i] <- 2^i
  i = i + 1
  
}
k


## ------------------------------------------------------------------------------------------
# creo un vettore i = 10
# creo un vettore conunt_ite che conta le iterazioni
# genero un vettore casuale da una normale di lunghezza i (10)
# genero una epsilon (generalmente un numero piccolo)

i = 10
count_ite = 0
x <- rnorm(i)
eps <- 0.001

# i loop calcola i * 2
# rigenera il vettore x
# aumento le iterazioni
# rimango nel loop finche il valore assoluto della media del vettore è maggiore di epsilon

while (abs(mean(x)) > eps) {
  
 	i = i*2
 	x <- rnorm(i)
 	count_ite = count_ite + 1
 	
 	}
mean(x)
length(x)
count_ite


## ------------------------------------------------------------------------------------------
# condizione if
x <- seq(-5,5) # creo una sequenza di numeri tra -5 e 5
x
if (any(x < 0))
  x = abs(x) # se c'è qualche x <0 calcolaci il valore assoluto

x

## ------------------------------------------------------------------------------------------
x <- seq(-5,5) # creo un vettore sewuenza da -5 a 5
y <- vector("double", length(x)) # creo un vettore di lunghezza pari a x tutti 0

# per tutti i valori di i che sono nella sequenza di x seq_along(x) [ singidica per i che va da 1 alla lunghezza di x]
for(i in seq_along(x)){
		if (x[i] < 0) y[i] = sqrt(abs(x)[i]) # se x < 0 assegna ad y[i] la radice quadrata del valore assoluto di x
		else y[i] = sqrt(x[i]) # altrimenti calcola semplicemente la radice quadrata di x
		}
x
y


## ------------------------------------------------------------------------------------------
# stop permette di bloccare l'esecuzione e restituisce un messaggio di erroere

k <- c("one", "two", "three", "four", "five")
x <- 1:5

# se x è un vettore numerico calcola la somma altrimenti fermati e dai il messaggio
if (is.numeric(x))(sum(x)) else stop( "x is not a numeric vector")

if (is.numeric(k))(sum(k)) else stop( "k is not a numeric vector")


## ------------------------------------------------------------------------------------------
# switch
# 3 argomenti, x y (vettori/scalari) operazione
# entrati nello switch, switch è come concatenare è if/else elif 

ex_swtc <- function(x, y, op) {
   
  switch(op,
       "plus" = x + y, # se op è = a plus fa la somma
       "minus" = x - y, # se = minus fa la dufferenza
       "times" = x * y, # se = times prodotto
       "divide" = x / y, # se = divide rapporto
       stop("Unknown op!") # se non è nessuno delle operazioni stop ed errore
       )
}

ex_swtc(3, 2, op = "divide")	

ex_swtc(7,9,op = "nessuna")
