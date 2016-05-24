## ******************************************************************** ##
## nectary_growth_fda.R
##
## Author: Henry Frye
## Date Created: 2016-05-03
##
## Purpose:
## Applying FDA to growth patterns of Pelargonium nectaries and floral structures
## ******************************************************************** ##

#Set working directory
if(Sys.info()['user']=='henryfrye') setwd("/Users/henryfrye/Dropbox/IntellectualEndeavours/UConn/Research/nectaries")

#import libraries
library(fda)
library(dplyr)
library(tidyr)
library(ggplot2)

 #Read in nectary data
ioniper <- read.csv(file = "p_ioni_perianth.csv")
odorper <- read.csv(file = "p_odor_perianth.csv")
ionitube <- read.csv(file = "p_ioni_tube.csv")
odortube <- read.csv(file = "p_odor_tube.csv")
ionipertube <- read.csv(file = "p_ioni_perianth_tube.csv")
odorpertube <- read.csv(file = "p_odor_perianth_tube.csv")


#Convert to matrices
ionipermat <- as.matrix(ioniper)
odorpermat <- as.matrix(odorper)
ionitubmat <- as.matrix(ionitube) 
odortubmat <- as.matrix(odortube)
ionipertubmat <- as.matrix(ionipertube)
odorpertubmat <- as.matrix(odorpertube)

#ionipermat calculations
days=0:(nrow(ionipermat)-1)
(ndays <- length(days))
(ncasem <- ncol(ionipermat))
(dayRng <- range(days))
daysfine=seq(dayRng[1],dayRng[2],length=44)
rng = c(0,22)
knots  <- 0:22
norder <- 8
nbasis <- length(knots) + norder - 2
hgtbasis <- create.bspline.basis(range(knots), nbasis, norder, knots)
Lfdobj <- 4
lambda <- 10^(-0.5)
growfdPar <- fdPar(hgtbasis, Lfdobj, lambda)
ioniperianthfd <- smooth.basis(knots, ionipermat, growfdPar)$fd

#odorpermat calculations
days=0:(nrow(odorpermat)-1)
(ndays <- length(days))
(ncasem <- ncol(odorpermat))
(dayRng <- range(days))
daysfine=seq(dayRng[1],dayRng[2],length=46)
rng = c(0,23)
knots  <- 0:23
norder <- 8
nbasis <- length(knots) + norder - 2
hgtbasis <- create.bspline.basis(range(knots), nbasis, norder, knots)
Lfdobj <- 4
lambda <- 10^(-0.5)
growfdPar <- fdPar(hgtbasis, Lfdobj, lambda)
odorperianthfd <- smooth.basis(knots, odorpermat, growfdPar)$fd

#ionitubmat calculations
days=0:(nrow(ionitubmat)-1)
(ndays <- length(days))
(ncasem <- ncol(ionitubmat))
(dayRng <- range(days))
daysfine=seq(dayRng[1],dayRng[2],length=36)
rng = c(0,18)
knots  <- 0:18
norder <- 8
nbasis <- length(knots) + norder - 2
hgtbasis <- create.bspline.basis(range(knots), nbasis, norder, knots)
Lfdobj <- 4
lambda <- 10^(-0.5)
growfdPar <- fdPar(hgtbasis, Lfdobj, lambda)
ionitubefd <- smooth.basis(knots, ionitubmat, growfdPar)$fd

#odortubmat calculations
days=0:(nrow(odortubmat)-1)
(ndays <- length(days))
(ncasem <- ncol(odortubmat))
(dayRng <- range(days))
daysfine=seq(dayRng[1],dayRng[2],length=36)
rng = c(0,18)
knots  <- 0:18
norder <- 8
nbasis <- length(knots) + norder - 2
hgtbasis <- create.bspline.basis(range(knots), nbasis, norder, knots)
Lfdobj <- 4
lambda <- 10^(-0.5)
growfdPar <- fdPar(hgtbasis, Lfdobj, lambda)
odortubefd <- smooth.basis(knots, odortubmat, growfdPar)$fd


#ionipertubefd <- smooth.basis(knots, ionipertubmat, growfdPar)$fd
#odorpertubefd <- smooth.basis(knots, odorpertubmat, growfdPar)$fd




#Setting fitting and derivatives
ioniperianthfit <- eval.fd(days, ioniperianthfd)
ioniperianthhat <- eval.fd(daysfine, ioniperianthfd)
ioniper.velmhat <- eval.fd(daysfine, ioniperianthfd, 1)
ioniper.accmhat <- eval.fd(daysfine, ioniperianthfd, 2)

odorperianthfit <- eval.fd(days, odorperianthfd)
odorperianthhat <- eval.fd(daysfine, odorperianthfd)
odorper.velmhat <- eval.fd(daysfine, odorperianthfd, 1)
odorper.accmhat <- eval.fd(daysfine, odorperianthfd, 2)

ionitubefit <- eval.fd(days, ionitubefd)
ionitubehat <- eval.fd(daysfine, ionitubefd)
ionitub.velmhat <- eval.fd(daysfine, ionitubefd, 1)
ionitub.accmhat <- eval.fd(daysfine, ionitubefd, 2)

odortubefit <- eval.fd(days, odortubefd)
odortubehat <- eval.fd(daysfine, odortubefd)
odortub.velmhat <- eval.fd(daysfine, odortubefd, 1)
odortub.accmhat <- eval.fd(daysfine, odortubefd, 2)

#ionipertubefit <- eval.fd(days, ionipertubefd)
#ionipertubehat <- eval.fd(daysfine, ionipertubefd)
#ionipertub.velmhat <- eval.fd(daysfine, ionipertubefd, 1)
#ionipertub.accmhat <- eval.fd(daysfine, ionipertubefd, 2)

#odorpertubefit <- eval.fd(days, odorpertubefd)
#odorpertubehat <- eval.fd(daysfine, odorpertubefd)
#odorpertub.velmhat <- eval.fd(daysfine, odorpertubefd, 1)
#odorpertub.accmhat <- eval.fd(daysfine, odorpertubefd, 2)

#Data exploration

mean.ioniper <- mean(ioniperianthfd) 
mean.odorper <- mean(odorperianthfd)
mean.ionitube <- mean(ionitubefd)
mean.odortube <- mean(odortubefd)
#mean.ionipertube <- mean(ionipertubefd)
#mean.odorpertube <- mean(odorpertubefd)


#basic plots in base R
pdf(file = '/figure/mean_growth.pdf')
plot(mean.ioniper, col= "red", ylim = c(0, 30))
lines(mean.odorper, col= "yellow")
lines(mean.ionitube, col= "purple")
lines(mean.odortube, col= "blue")
dev.off()
system('open ../figure/mean_growth.pdf')



#lets make plots of means and individual replicates with ggplot
#ggplot(ionipercoef, )





# Creating graphs (using Cory Merow's code here)
# compare flowers
pdf('ioni_perianth_compare_v1.pdf',w=6,h=8)
par(mfrow=c(3,1),mar=c(4,3,3,1))
# mean
plot(daysfine, ioniperianthhat[,1], ylim=c(0,max(ionipermat)), xlab="days",bty='n',las=1,main="Growth",typ='l')
for (i in 2:nbudm) {lines(daysfine, ioniperianthhat[,i], col=i)}
#legend('bottomright',legend=colnames(commspec),bty='n',col=1:nbudm,lty=1, cex=1)

# vel
#ind <- velmhat[,i] >= 0 & velmhat[,i] <= 20
plot(daysfine, velmhat[,i], type="l", xlab="days", ylab="", main="Growth Velocity",bty='n',ylim=c(-2,2))
for (i in 2:nbudm) {lines(daysfine,  velmhat[,i], col=i)}
abline(h=0, lty=2,col='grey50')

# accel
#ind <- accmhat[,i] >= -6 & accmhat[,i] <= 6
plot(daysfine, accmhat[,i], type="l", xlab="days", ylab="", main="Growth Acceleration",ylim=c(-0.5,0.5),bty='n')
for (i in 2:nbudm) {lines(daysfine,  accmhat[,i], col=i)}
abline(h=0, lty=2,col='grey50')

dev.off()  
system('open ioni_perianth_compare_v1.pdf')





###Function Scratchwork


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

