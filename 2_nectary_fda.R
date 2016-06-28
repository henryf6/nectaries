## ******************************************************************** ##
## nectary_growth_fda.R
##
## Author: Henry Frye
## Date Created: 2016-05-03
##
## Purpose:
## Applying FDA to growth patterns of Pelargonium nectaries and floral structures
## ******************************************************************** ##

####Set Up####
#Set working directory
if(Sys.info()['user']=='henryfrye') setwd("/Users/henryfrye/Dropbox/IntellectualEndeavours/UConn/Research/nectaries")

#import libraries
#library(fda)
#library(dplyr)
#library(tidyr)
#library(ggplot2)

#Read in nectary data
#ioniper <- read.csv(file = "p_ioni_perianth.csv")
#odorper <- read.csv(file = "p_odor_perianth.csv")
#ionitube <- read.csv(file = "p_ioni_tube.csv")
#odortube <- read.csv(file = "p_odor_tube.csv")
#ionipertube <- read.csv(file = "p_ioni_perianth_tube.csv")
#odorpertube <- read.csv(file = "p_odor_perianth_tube.csv")


#Convert to matrices
ionipermat <- data.matrix(ioniper, rownames.force = TRUE)
odorpermat <- data.matrix(odorper, rownames.force = TRUE)
ionitubmat <- data.matrix(ionitube, rownames.force = TRUE) 
odortubmat <- data.matrix(odortube, rownames.force = TRUE)


####Functional Object Creation####
#ionipermat calculations
days1=1:(nrow(ionipermat))
(ndays1 <- length(days1))
(ncasem1 <- ncol(ionipermat))
(dayRng1 <- range(days1))
daysfine1=seq(dayRng1[1],dayRng1[2],length=44)
rng1 = c(1,29)
knots1  <- 1:29
norder1 <- 8
nbasis1 <- length(knots1) + norder1 - 2
hgtbasis1 <- create.bspline.basis(range(knots1), nbasis1, norder1, knots1)
Lfdobj <- 4
lambda <- 10^(-0.5)
growfdPar1 <- fdPar(hgtbasis1, Lfdobj, lambda)
ioniperianthfd <- smooth.basis(knots1, ionipermat, growfdPar1)$fd

#odorpermat calculations
days2=1:(nrow(odorpermat))
(ndays2 <- length(days2))
(ncasem2 <- ncol(odorpermat))
(dayRng2 <- range(days2))
daysfine2=seq(dayRng2[1],dayRng2[2],length=46)
rng2 = c(1,29)
knots2  <- 1:29
norder2 <- 8
nbasis2 <- length(knots2) + norder2 - 2
hgtbasis2 <- create.bspline.basis(range(knots2), nbasis2, norder2, knots2)
Lfdobj <- 4
lambda <- 10^(-0.5)
growfdPar2 <- fdPar(hgtbasis2, Lfdobj, lambda)
odorperianthfd <- smooth.basis(knots2, odorpermat, growfdPar2)$fd

#ionitubmat calculations
days3=5:29
(ndays3 <- length(days3))
(ncasem3 <- ncol(ionitubmat))
(dayRng3 <- range(days3))
daysfine3=seq(dayRng3[1],dayRng3[2],length=36)
rng3 = c(5,29)
knots3 <- 5:29
norder3 <- 8
nbasis3 <- length(knots3) + norder3 - 2
hgtbasis3 <- create.bspline.basis(range(knots3), nbasis3, norder3, knots3)
Lfdobj <- 4
lambda <- 10^(-0.5)
growfdPar3 <- fdPar(hgtbasis3, Lfdobj, lambda)
ionitubefd <- smooth.basis(knots3, ionitubmat, growfdPar3)$fd

#odortubmat calculations
days4=5:29
(ndays4 <- length(days4))
(ncasem4 <- ncol(odortubmat))
(dayRng4 <- range(days4))
daysfine4=seq(dayRng4[1],dayRng4[2],length=36)
rng4 = c(5,29)
knots4  <- 5:29
norder4 <- 8
nbasis4 <- length(knots4) + norder4 - 2
hgtbasis4 <- create.bspline.basis(range(knots4), nbasis4, norder4, knots4)
Lfdobj <- 4
lambda <- 10^(-0.5)
growfdPar4 <- fdPar(hgtbasis4, Lfdobj, lambda)
odortubefd <- smooth.basis(knots4, odortubmat, growfdPar4)$fd


#ionipertubefd <- smooth.basis(knots, ionipertubmat, growfdPar)$fd
#odorpertubefd <- smooth.basis(knots, odorpertubmat, growfdPar)$fd




####Setting, fitting and derivatives####
ioniperianthfit <- eval.fd(days1, ioniperianthfd)
ioniper.vel <- eval.fd(days1, ioniperianthfd, 1)
ioniper.acc <- eval.fd(days1, ioniperianthfd, 2)
#ioniperianthhat <- eval.fd(daysfine1, ioniperianthfd)
#ioniper.velmhat <- eval.fd(daysfine1, ioniperianthfd, 1)
#ioniper.accmhat <- eval.fd(daysfine1, ioniperianthfd, 2)

odorperianthfit <- eval.fd(days2, odorperianthfd)
odorper.vel <- eval.fd(days2, odorperianthfd, 1)
odorper.acc <- eval.fd(days2, odorperianthfd, 2)
#odorperianthhat <- eval.fd(daysfine2, odorperianthfd)
#odorper.velmhat <- eval.fd(daysfine2, odorperianthfd, 1)
#odorper.accmhat <- eval.fd(daysfine2, odorperianthfd, 2)

ionitubefit <- eval.fd(days3, ionitubefd)
ionitub.vel <- eval.fd(days3, ionitubefd, 1)
ionitub.acc <- eval.fd(days3, ionitubefd, 2)
#Fixing Day sequence to start at day 5
ionitub.vel[,1] <- seq(5,29)
ionitub.acc[,1] <- seq(5,29)


#ionitubehat <- eval.fd(daysfine3, ionitubefd)
#ionitub.velmhat <- eval.fd(daysfine3, ionitubefd, 1)
#ionitub.accmhat <- eval.fd(daysfine3, ionitubefd, 2)

odortubefit <- eval.fd(days4, odortubefd)
odortub.vel <- eval.fd(days4, odortubefd, 1)
odortub.acc <- eval.fd(days4, odortubefd, 2)
#Fixing Day sequence to start at day 5
odortub.vel[,1] <- seq(5,29)
odortub.acc[,1] <- seq(5,29)

#odortubehat <- eval.fd(daysfine4, odortubefd)
#odortub.velmhat <- eval.fd(daysfine4, odortubefd, 1)
#odortub.accmhat <- eval.fd(daysfine4, odortubefd, 2)

#ionipertubefit <- eval.fd(days, ionipertubefd)
#ionipertubehat <- eval.fd(daysfine, ionipertubefd)
#ionipertub.velmhat <- eval.fd(daysfine, ionipertubefd, 1)
#ionipertub.accmhat <- eval.fd(daysfine, ionipertubefd, 2)

#odorpertubefit <- eval.fd(days, odorpertubefd)
#odorpertubehat <- eval.fd(daysfine, odorpertubefd)
#odorpertub.velmhat <- eval.fd(daysfine, odorpertubefd, 1)
#odorpertub.accmhat <- eval.fd(daysfine, odorpertubefd, 2)

####Data Exploration####

mean.ioniper <- mean(ioniperianthfd) 
mean.odorper <- mean(odorperianthfd)
mean.ionitube <- mean(ionitubefd)
mean.odortube <- mean(odortubefd)
#mean.ionipertube <- mean(ionipertubefd)
#mean.odorpertube <- mean(odorpertubefd)

#Mean velocity growth graphs for both tube and perianth
#Create means for vel for everthing

mean.ioniper.vel <- rowMeans(ioniper.vel[, 2:21])
mean.odorper.vel <- rowMeans(odorper.vel[, 2:21])
mean.ionitub.vel <- rowMeans(ionitub.vel[, 2:21])
mean.odortub.vel <- rowMeans(odortub.vel[, 2:21])

names(mean.ioniper.vel) <- days1
names(mean.odorper.vel) <- days2
names(mean.ionitub.vel) <- days3
names(mean.odortub.vel) <- days4

mean.ioniper.acc <- rowMeans(ioniper.acc[, 2:21])
mean.odorper.acc <- rowMeans(odorper.acc[, 2:21])
mean.ionitub.acc <- rowMeans(ionitub.acc[, 2:21])
mean.odortub.acc <- rowMeans(odortub.acc[, 2:21])

names(mean.ioniper.acc) <- days1
names(mean.odorper.acc) <- days2
names(mean.ionitub.acc) <- days3
names(mean.odortub.acc) <- days4

####Standard Errors for objecst####

# Remember, this is the standard error over the _collection of curves_
# not a confidence interval for estimating each curve.

sioniperd = std.fd(ioniperianthfd)
sodorperd = std.fd(odorperianthfd)
sionitubd = std.fd(ionitubefd)
sodortubd = std.fd(odortubefd)

#sioniperdvel = sd(ioniper.vel)/sqrt(length(ioniper.vel))
#mean(ioniper.vel)-2*sioniperdvel
#mean(ioniper.vel)+2*sioniperdvel
#needs work for higher order functions



####Function Scratchwork####


#Set objects for function conversion
functional_obj_conv <- function(x,y) {
  days=0:(nrow(x)-1)  
  ndays <- length(days)
  nbudm <- ncol(x)
  dayRng <- range(days)
  daysfine=seq(dayRng[1],dayRng[2],length=(2*ncol(x)))
  
  rng = c(0,(nrow(x)-1))
  knots  <- 0:(nrow(x)-1)
  norder <- 8
  nbasis <- length(knots) + norder - 2
  hgtbasis <- create.bspline.basis(range(knots), nbasis, norder, knots)
  
  Lfdobj <- 4
  lambda <- y
  growfdPar <- fdPar(hgtbasis, Lfdobj, lambda)
  
  function(growfdPar, knots) {
    
    xfd <- smooth.basis(knots, x, growfdPar)$fd
    
  } 
  
  return(list(days, ndays, knots, nbasis, lambda))
}

dim(ionipermat)








