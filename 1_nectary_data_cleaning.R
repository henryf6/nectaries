## ******************************************************************** ##
## 1_nectary_data_cleaning.R
##
## Author: Henry Frye
## Date Created: 2016-05-03
##
## Purpose:
## Truncate data to even day lengths, take a look at everything in ggplot
## before fda
## ******************************************************************** ##

if(Sys.info()['user']=='henryfrye') setwd("/Users/henryfrye/Dropbox/IntellectualEndeavours/UConn/Research/nectaries/data_raw")

#import libraries
library(fda)
library(dplyr)
library(tidyr)
library(ggplot2)

#Read in nectary data
ioniper <- read.csv(file = "../data_raw/p_ioni_perianth.csv")
odorper <- read.csv(file = "../data_raw/p_odor_perianth.csv")
ionitube <- read.csv(file = "../data_raw/p_ioni_tube.csv")
odortube <- read.csv(file = "../data_raw/p_odor_tube.csv")
ionipertube <- read.csv(file = "../data_raw/p_ioni_perianth_tube.csv")
odorpertube <- read.csv(file = "../data_raw/p_odor_perianth_tube.csv")

#clean data up and set row names as the days for growth
ioniper <-  ioniper %>% add_rownames(var = "Day1" )%>%
  select(-Day)
odorper <-  odorper %>% add_rownames(var = "Day1" )%>%
  select(-Day)
ionitube <- ionitube %>% add_rownames(var = "Day1" )%>%
  select(-Day)
odortube <- odortube %>% add_rownames(var = "Day1" )%>%
  select(-Day)
ionipertube <- ionipertube %>% add_rownames(var = "Day1" )%>%
  select(-Day)
odorpertube <- odorpertube %>% add_rownames(var= "Day1" )%>%
  select(-Day)

# just taking a look
glimpse(ioniper)
glimpse(odorper)
glimpse(ionitube)
glimpse(odortube)
glimpse(ionipertube)
glimpse(odorpertube)

#just taking a look at things before truncating
# I want to see if things flatten out by day 19 for datasets longer than day 19

plot(x= ioniper$Day1, y= ioniper$Bud.1, type = "l", xlim= c(0, 23), ylim= c(0,30), xaxs = "i",
     xlab = "Days", ylab = "Growth (mm)", main = "P. Ionidiflorum Perianth Growth")
lines(ioniper$Bud.1)
lines(ioniper$Bud.2)
lines(ioniper$Bud.3)
lines(ioniper$Bud.4)
lines(ioniper$Bud.5)
lines(ioniper$Bud.10)
lines(ioniper$Bud.15)
lines(ioniper$Bud.20)

#this is concerning given things have not flattened out, is there data missing?

