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
# I want to see if things flatten out by day 19 for datasets longer tha day 19
par(mfrow=c(2,1))
plot(x= ioniper$Day1, y= ioniper$Bud.1, type = "l", xlim= c(0, 23), xaxs = "i")
plot(x= ioniper$Day1, y= ioniper$Bud.2, type = "l", xlim= c(0, 23), xaxs = "i")


#this is concerning given things have not flattened out, is there data missing?

