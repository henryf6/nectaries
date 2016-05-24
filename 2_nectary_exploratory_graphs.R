## ******************************************************************** ##
## 2_nectary_exploratory_graphs.R
##
## Author: Henry Frye
## Date Created: 2016-05-03
##
## Purpose:
## Create exploratory graphs from nectary growth functional objects
## ******************************************************************** ##

#set working directories
if(Sys.info()['user']=='henryfrye') setwd("/Users/henryfrye/Dropbox/IntellectualEndeavours/UConn/Research/nectaries/scripts")

#libraries
library(ggplot2)

#Graphs created with base R:
####Mean growth graphs for both tube and perianth####

par(mfrow=c(3,1))
pdf("../figures/mean_growth.pdf", width = 10, height = 7)
plot(mean.ioniper, lwd=2, col= "red", ylim = c(-.5, 30), 
     ylab = "Growth (mm)", xlab = "Days",
     main="Mean Growth Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length "
     )
lines(mean.odorper, lwd=2, col= "black")
lines(mean.ionitube, lwd=2, col= "purple")
lines(mean.odortube, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("ioni tube", "odor tube", "ioni perianth", "odor perianth"), 
       lty = 1, lwd = 2, col = c("purple", "blue", "red", "black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple", "blue", "red", "black"), inset= 0.1)

####Mean velocity graphs for both tube and perianth####

plot(mean.ioniper.vel, type="l", lwd=2, col= "red", ylim = c(-.5, 5), xaxs= "i",
     ylab = " Change in Growth (mm) per Day", xlab = "Days",
     main="Mean Growth Velocity Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length "
)
lines(mean.odorper.vel, lwd=2, col= "black")
lines(mean.ionitub.vel, lwd=2, col= "purple")
lines(mean.odortub.vel, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("ioni tube", "odor tube", "ioni perianth", "odor perianth"), 
       lty = 1, lwd = 2, col = c("purple", "blue", "red", "black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple", "blue", "red", "black"), inset= 0.1)


####Mean acceleration graphs for both tube and perianth####

plot(mean.ioniper.acc, type="l", lwd=2, col= "red", ylim = c(-.5, 3), xaxs= "i",
     ylab = " Change in Growth (mm) per Day", xlab = "Days",
     main="Mean Growth Velocity Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length "
)
lines(mean.odorper.acc, lwd=2, col= "black")
lines(mean.ionitub.acc, lwd=2, col= "purple")
lines(mean.odortub.acc, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("ioni tube", "odor tube", "ioni perianth", "odor perianth"), 
       lty = 1, lwd = 2, col = c("purple", "blue", "red", "black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple", "blue", "red", "black"), inset= 0.1)
dev.off()
system('open ../figures/mean_growth.pdf')


####P. ioni Growth Separate Curves####
pdf("../figures/p_ioni_growth_velocity.pdf", width = 10, height = 7)
plot(mean.ioniper.vel, type="l", lwd=2, col= "red", ylim = c(0, 5), xaxs= "i",
     ylab = " Change in Growth (mm) per Day", xlab = "Days",
     main="Mean Growth Velocity Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length "
)
lines(mean.ionitub.vel, lwd=2, col= "purple")
grid()
legend("topleft", legend = c("ioni tube", "ioni perianth"), 
       lty = 1, lwd = 2, col = c("purple", "red"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple","red"), inset= 0.1)
dev.off()
system('open ../figures/p_ioni_growth_velocity.pdf')

####P. odor Growth Separate Curves####
pdf("../figures/p_odor_growth_velocity.pdf", width = 10, height = 7)
plot(mean.odorper.vel, type="l", lwd=2, col= "black", ylim = c(0, 5), xaxs= "i",
     ylab = " Change in Growth (mm) per Day", xlab = "Days",
     main="Mean Growth Velocity Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length "
)
lines(mean.odortub.vel, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("odor tube", "odor perianth"), 
       lty = 1, lwd = 2, col = c("blue", "black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("blue", "black"), inset= 0.1)
dev.off()
system('open ../figures/p_odor_growth_velocity.pdf')

