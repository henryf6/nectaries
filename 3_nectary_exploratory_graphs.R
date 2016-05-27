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

par(mfrow=c(3,1), family="Palatino")
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

plot(mean.ioniper.vel, type="l", lwd=2, col= "red", ylim = c(-1, 5),
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

plot(mean.ioniper.acc, type="l", lwd=2, col= "red", ylim = c(-2, 3),
     ylab = "Growth Acceleration", xlab = "Days",
     main="Mean Growth Acceleration Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length ")
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

####Mean Growth graphs by species####
par(mfrow=c(3,1), family="Palatino")
pdf("../figures/mean_growth_ioni.pdf", width = 10, height = 7)
plot(mean.ioniper, lwd=2, col= "red", ylim = c(-.5, 30),
     ylab = "Growth (mm)", xlab = "Days",
     main="Mean Growth Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length "
)

lines(mean.ionitube, lwd=2, col= "purple")

grid()
legend("topleft", legend = c("ioni tube", "ioni perianth"), 
       lty = 1, lwd = 2, col = c("purple", "red"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple", "red"), inset= 0.1)
plot(mean.ioniper.vel, type="l", lwd=2, col= "red", ylim = c(-.5, 5),
     ylab = " Change in Growth (mm) per Day", xlab = "Days",
     main="Mean Growth Velocity Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length "
)
lines(mean.ionitub.vel, lwd=2, col= "purple")
grid()
legend("topleft", legend = c("ioni tube", "ioni perianth"), 
       lty = 1, lwd = 2, col = c("purple", "red"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple", "red"), inset= 0.1)
plot(mean.ioniper.acc, type="l", lwd=2, col= "red", ylim = c(-.5, 3),
     ylab = "Growth Acceleration", xlab = "Days",
     main="Mean Growth Acceleration Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length ")
lines(mean.ionitub.acc, lwd=2, col= "purple")
grid()
legend("topleft", legend = c("ioni tube", "ioni perianth"), 
       lty = 1, lwd = 2, col = c("purple", "red"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple", "red"), inset= 0.1)
dev.off()
system('open ../figures/mean_growth_ioni.pdf')

#odor

par(mfrow=c(3,1), family="Palatino")
pdf("../figures/mean_growth_odor.pdf", width = 10, height = 7)
plot(mean.odorper, lwd=2, col= "black", ylim = c(-.5, 30),
     ylab = "Growth (mm)", xlab = "Days",
     main="Mean Growth Curves for P. odoratissimum of perianth and tube length "
)
lines(mean.odortube, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("odor tube", "odor perianth"), 
       lty = 1, lwd = 2, col = c("blue","black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("blue", "black"), inset= 0.1)

plot(mean.odorper.vel, type="l", lwd=2, col= "black", ylim = c(-.5, 5),
     ylab = " Change in Growth (mm) per Day", xlab = "Days",
     main="Mean Growth Velocity Curves for P. odoratissimum of perianth and tube length ")
lines(mean.odortub.vel, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("odor tube", "odor perianth"), 
       lty = 1, lwd = 2, col = c("blue", "black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("blue", "black"), inset= 0.1)
plot(mean.odorper.acc, type="l", lwd=2, col= "black", ylim = c(-.5, 3),
     ylab = "Growth Acceleration", xlab = "Days",
     main="Mean Growth Acceleration Curves P. odoratissimum of perianth and tube length ")
lines(mean.odortub.acc, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("odor tube", "odor perianth"), 
       lty = 1, lwd = 2, col = c("blue", "black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("blue", "black"), inset= 0.1)
dev.off()
system('open ../figures/mean_growth_odor.pdf')


####Mean Growth graphs by struture####
#perianth
par(mfrow=c(3,1), family="Palatino")
pdf("../figures/mean_growth_perianth.pdf", width = 10, height = 7)
plot(mean.ioniper, lwd=2, col= "red", ylim = c(-.5, 30),
     ylab = "Growth (mm)", xlab = "Days",
     main="Mean Growth Curves for Perianth"
)
lines(mean.odorper, lwd=2, col= "black")
grid()
legend("topleft", legend = c("ioni perianth", "odor perianth"), 
       lty = 1, lwd = 2, col = c("red", "black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("red", "black"), inset= 0.1)
plot(mean.ioniper.vel, type="l", lwd=2, col= "red", ylim = c(-.5, 5),
     ylab = "Change in Growth (mm) per Day", xlab = "Days",
     main="Mean Growth Velocity Curves for Perianth"
)
lines(mean.odorper.vel, lwd=2, col= "black")
grid()
legend("topleft", legend = c("ioni perianth", "odor perianth"), 
       lty = 1, lwd = 2, col = c("red", "black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("red", "black"), inset= 0.1)
plot(mean.ioniper.acc, type="l", lwd=2, col= "red", ylim = c(-.5, 3),
     ylab = "Growth Acceleration", xlab = "Days",
     main="Mean Growth Acceleration Curves Perianth")
lines(mean.odorper.acc, lwd=2, col= "black")
grid()
legend("topleft", legend = c("ioni perianth", "odor perianth"), 
       lty = 1, lwd = 2, col = c("red", "black"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("red", "black"), inset= 0.1)
dev.off()
system('open ../figures/mean_growth_perianth.pdf')

#tube


par(mfrow=c(3,1), family="Palatino")
pdf("../figures/mean_growth_tube.pdf", width = 10, height = 7)
plot(mean.ionitube, lwd=2, col= "purple", ylim = c(-.5, 30),
     ylab = "Growth (mm)", xlab = "Days",
     main="Mean Growth Curves for Tube Length")
lines(mean.odortube, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("ioni tube", "odor tube"), 
       lty = 1, lwd = 2, col = c("purple", "blue"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple", "blue"), inset= 0.1)
plot(mean.ionitub.vel, type="l", lwd=2, col= "purple", ylim = c(-.5, 5),
     ylab = " Change in Growth (mm) per Day", xlab = "Days",
     main="Mean Growth Velocity Curves for Tube Length "
)
lines(mean.odortub.vel, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("ioni tube", "odor tube"), 
       lty = 1, lwd = 2, col = c("purple", "blue"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple", "blue"), inset= 0.1)

plot(mean.ionitub.acc, type="l", lwd=2, col= "purple", ylim = c(-.5, 3),
     ylab = "Growth Acceleration", xlab = "Days",
     main="Mean Growth Acceleration Curves for P. ionidiflorum and  P. odoratissimum of perianth and tube length ")
lines(mean.odortub.acc, lwd=2, col= "blue")
grid()
legend("topleft", legend = c("ioni tube", "odor tube"), 
       lty = 1, lwd = 2, col = c("purple", "blue"), ncol = 2,
       bty = "n", cex = 0.8,
       text.col = c("purple", "blue"), inset= 0.1)
dev.off()
system('open ../figures/mean_growth_tube.pdf')


####P. ioni Perianth all graphs####
pdf('../figures/ioni_perianth_compare_v1.pdf',w=6,h=8)
par(mfrow=c(3,1),mar=c(4,3,3,1))
# mean
plot(days1, ioniperianthfit[,2], ylim=c(0,max(ionipermat)), 
     xlab="Days", ylab="Growth (mm)", bty='n',las=1,main="P. ionidiflorum Perianth Growth",
     typ='l', xlim=c(0,23))
for (i in 2:ncasem1) {lines(days1, ioniperianthfit[,i], col=i)}
lines(mean.ioniper, lwd = 3, lty= 6, col= 'black')
legend('topleft', legend= "mean", lwd = 3, lty= 6, ncol=2, col= 'black')
#legend('bottomright',legend=colnames(commspec),bty='n',col=1:nbudm,lty=1, cex=1)

# vel
#ind <- velmhat[,i] >= 0 & velmhat[,i] <= 20
plot(days1, ioniper.vel[,i], ylim=c(-.5,5), xlim=c(0,23), type="l", xlab="Days", ylab="Growth Velocity",
     main="P. ionidiflorum Perianth Growth Velocity",bty='n')
for (i in 2:ncasem1) {lines(days1,  ioniper.vel[,i], col=i)}
lines(mean.ioniper.vel, lwd = 3, lty= 6, col= 'black')
#abline(h=0, lty=2,col='grey50')

# accel
#ind <- accmhat[,i] >= -6 & accmhat[,i] <= 6
plot(days1, ioniper.acc[,i], ylim=c(-.5,3), xlim=c(0,23), type="l", xlab="Days", ylab="Growth Acceleration",
     main="P. ionidiflorum Growth Perianth Acceleration", bty='n')
for (i in 2:ncasem1) {lines(days1,  ioniper.acc[,i], col=i)}
lines(mean.ioniper.acc, lwd = 3, lty= 6, col= 'black')
#abline(h=0, lty=2,col='grey50')

dev.off()  

system('open ../figures/ioni_perianth_compare_v1.pdf')

####P. ioni Tube all graphs####
pdf('../figures/ioni_tube_compare_v1.pdf',w=6,h=8)
par(mfrow=c(3,1),mar=c(4,3,3,1))
# mean
plot(days3, ionitubefit[,2], ylim=c(0,max(ionitubmat)), 
     xlab="Days",bty='n',las=1,main="P. ionidiflorum Tube Growth",
     typ='l', xlim=c(0,20))
for (i in 2:ncasem3) {lines(days3, ionitubefit[,i], col=i)}
lines(mean.ionitube, lwd = 3, lty= 6, col= 'black')
legend('topleft', legend= "mean", lwd = 3, lty= 6, ncol=2, col= 'black')
#legend('bottomright',legend=colnames(commspec),bty='n',col=1:nbudm,lty=1, cex=1)

# vel
#ind <- velmhat[,i] >= 0 & velmhat[,i] <= 20
plot(days3, ionitub.vel[,i], ylim=c(-.5,5), xlim=c(0,20), type="l", xlab="Days", ylab="Growth Velocity",
     main="P. ionidiflorum Tube Growth Velocity",bty='n')
for (i in 2:ncasem3) {lines(days3,  ionitub.vel[,i], col=i)}
lines(mean.ionitub.vel, lwd = 3, lty= 6, col= 'black')
#abline(h=0, lty=2,col='grey50')

# accel
#ind <- accmhat[,i] >= -6 & accmhat[,i] <= 6
plot(days3, ionitub.acc[,i], ylim=c(-.5,3), xlim=c(0,20), type="l", xlab="Days", ylab="Growth Acceleration",
     main="P. ionidiflorum Tube Growth Acceleration", bty='n')
for (i in 2:ncasem3) {lines(days3,  ionitub.acc[,i], col=i)}
lines(mean.ionitub.acc, lwd = 3, lty= 6, col= 'black')
#abline(h=0, lty=2,col='grey50')

dev.off()  

system('open ../figures/ioni_tube_compare_v1.pdf')

####P. odor perianth all graphs####
pdf('../figures/odor_perianth_compare_v1.pdf',w=6,h=8)
par(mfrow=c(3,1),mar=c(4,3,3,1))
# mean
plot(days2, odorperianthfit[,2], ylim=c(0,max(odorpermat)), 
     xlab="Days",bty='n',las=1,main="P. odoratissimum Perianth Growth",
     typ='l', xlim=c(0,20))
for (i in 2:ncasem2) {lines(days2, odorperianthfit[,i], col=i)}
lines(mean.odorper, lwd = 3, lty= 6, col= 'black')
legend('topleft', legend= "mean", lwd = 3, lty= 6, ncol=2, col= 'black')
#legend('bottomright',legend=colnames(commspec),bty='n',col=1:nbudm,lty=1, cex=1)

# vel
#ind <- velmhat[,i] >= 0 & velmhat[,i] <= 20
plot(days2, odorper.vel[,i], ylim=c(-.5,5), xlim=c(0,20), type="l", xlab="Days", ylab="Growth Velocity",
     main="P. odoratissimum Perianth Growth Velocity",bty='n')
for (i in 2:ncasem2) {lines(days2,  odorper.vel[,i], col=i)}
lines(mean.odorper.vel, lwd = 3, lty= 6, col= 'black')
#abline(h=0, lty=2,col='grey50')

# accel
#ind <- accmhat[,i] >= -6 & accmhat[,i] <= 6
plot(days2, odorper.acc[,i], ylim=c(-.5,3), xlim=c(0,20), type="l", xlab="Days", ylab="Growth Acceleration",
     main="P. odoratissimum Perianth Growth Acceleration", bty='n')
for (i in 2:ncasem2) {lines(days2,  odorper.acc[,i], col=i)}
lines(mean.odorper.acc, lwd = 3, lty= 6, col= 'black')
#abline(h=0, lty=2,col='grey50')

dev.off()  

system('open ../figures/odor_perianth_compare_v1.pdf')




####P. odor tube all graphs####
pdf('../figures/odor_tube_compare_v1.pdf',w=6,h=8)
par(mfrow=c(3,1),mar=c(4,3,3,1))
# mean
plot(days4, odortubefit[,2], ylim=c(0,max(odorpermat)), 
     xlab="Days",bty='n',las=1,main="P. odoratissimum Tube Growth",
     typ='l', xlim=c(0,20))
for (i in 2:ncasem4) {lines(days4, odortubefit[,i], col=i)}
lines(mean.odorper, lwd = 3, lty= 6, col= 'black')
legend('topleft', legend= "mean", lwd = 3, lty= 6, ncol=2, col= 'black')
#legend('bottomright',legend=colnames(commspec),bty='n',col=1:nbudm,lty=1, cex=1)

# vel
#ind <- velmhat[,i] >= 0 & velmhat[,i] <= 20
plot(days4, odortub.vel[,i], ylim=c(-.5,5), xlim=c(0,20), type="l", xlab="Days", ylab="Growth Velocity",
     main="P. odoratissimum Perianth Growth Velocity",bty='n')
for (i in 2:ncasem4) {lines(days4,  odortub.vel[,i], col=i)}
lines(mean.odortub.vel, lwd = 3, lty= 6, col= 'black')
#abline(h=0, lty=2,col='grey50')

# accel
#ind <- accmhat[,i] >= -6 & accmhat[,i] <= 6
plot(days4, odortub.acc[,i], ylim=c(-.5,3), xlim=c(0,20), type="l", xlab="Days", ylab="Growth Acceleration",
     main="P. odoratissimum Perianth Growth Acceleration", bty='n')
for (i in 2:ncasem4) {lines(days4,  odortub.acc[,i], col=i)}
lines(mean.odortub.acc, lwd = 3, lty= 6, col= 'black')
#abline(h=0, lty=2,col='grey50')

dev.off()  

system('open ../figures/odor_tube_compare_v1.pdf')



####Phase plots for kicks####
pdf( '../figures/mean_phase_plot.pdf')
plot(x= c(-2, 5), y= c(-3, 3), type="n", cex=1,
     xlab= "Growth Velocity", ylab= "Growth Acceleration")
lines(x= c(0,0), y= c(-3,3), lty=2)
lines(x= c(-2,5), y= c(0,0), lty=2)
lines(mean.ioniper.vel, mean.ioniper.acc, col="red")
lines(mean.odorper.vel, mean.odorper.acc, col=" black")
lines(mean.ionitub.vel, mean.ionitub.acc, col=" purple")
lines(mean.odortub.vel, mean.odortub.acc, col="blue")

legend("topleft", legend = c("ioni tube", "odor tube", "ioni perianth", "odor perianth"), 
       lty = 1, lwd = 2, col = c("purple", "blue", "red", "black"), ncol = 2,
       bty = "n", cex = 0.5,
       text.col = c("purple", "blue", "red", "black"), inset= 0.01)
dev.off()  

system('open ../figures/mean_phase_plot.pdf')
