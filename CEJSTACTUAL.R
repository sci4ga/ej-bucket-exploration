###############
# import libraries/data
library(tidyverse) # for tidyr and dplyr functions
library(dplyr)
library(ggplot2)
newtransdemo <- read.csv("new_trans_demographic_data.csv", header = T)
newtransdata <- read.csv("new_transportation_data.csv", header = T)
EJSCREEN <- read.csv("EJSCREEN.csv", header = T)
cejst <- read.csv("cejst.csv", header=T)

###############
# left_join dot_ga to ej_ga, because the old data appears to reference EJSCREEN 
# demographics, which is most of the columns

newtransdata$ID = newtransdata$census_id
cejst$ID = cejst$Census.tract.2010.ID

withc <- as.data.frame(merge(cejst, newtransdata, by = "ID"))

withc$hw <- withc$Proximity.to.hazardous.waste.sites..percentile.

p0.25 <- 0.25*mean(withc$hw)
p0.5 <- 0.5*mean(withc$hw)
p0.75 <- 0.75*mean(withc$hw)

#refactor
withc$factor_waste <- factor(NA, levels=c("very high","high","low", "very low"))
withc$factor_waste[withc$hw > p0.75]<-"very high"
withc$factor_waste[withc$hw <= p0.75 & withc$hw > p0.5]<-"high"
withc$factor_waste[withc$hw <= p0.5 & withc$hw  > p0.25]<-"low"
withc$factor_waste[withc$hw <= p0.25]<-"very low"


#water pollution
#check conditions
#question: is there a correlation between proximity to treatment storage and disposal and geq90_pm25?
chisq.test(withc$factor_waste ,withc$geq90_pm25, correct=T)

# plotting stacked bar plot
dat1 <- data.frame(table(withc$factor_waste ,withc$geq90_pm25))
names(dat1) <- c("Waste_Water", "PM2.5", "Count")

ggplot(dat1, aes(y=Count, x=Waste_Water,fill=PM2.5))+
  geom_bar(position="stack", stat = "identity")+
  scale_fill_manual(values = c("#7B66FF","#96EFFF"))+
  labs(title = "Number of Waste Sites Having High PM2.5 Level")+
  theme_bw()


#question: is there a correlation between proximity to treatment storage and disposal and geq90_diesel?
chisq.test(withc$factor_waste,withc$geq90_diesel, correct=T)

# plotting stacked bar plot
dat2 <- data.frame(table(withc$factor_waste ,withc$geq90_diesel))
names(dat2) <- c("Waste_Water", "Diesel", "Count")

ggplot(dat2, aes(y=Count, x=Waste_Water,fill=Diesel))+
  geom_bar(position="stack", stat = "identity")+
  scale_fill_manual(values = c("#7B66FF","#96EFFF"))+
  labs(title = "Number of Waste Sites Having High Diesel Level")+
  theme_bw()

#question: is there a correlation between proximity to treatment storage and disposal and geq90_traffic?
chisq.test(withc$factor_waste,withc$geq90_traffic, correct=T)

# plotting stacked bar plot
dat3 <- data.frame(table(withc$factor_waste ,withc$geq90_traffic))
names(dat3) <- c("Waste_Water", "Traffic", "Count")

ggplot(dat3, aes(y=Count, x=Waste_Water,fill=Traffic))+
  geom_bar(position="stack", stat = "identity")+
  scale_fill_manual(values = c("#7B66FF","#96EFFF"))+
  labs(title = "Number of Waste Sites Having High Traffic Level")+
  theme_bw()


