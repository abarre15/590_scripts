#####
# task 1 in R for geol 590
#####

#load packages 
library(tidyverse)

x<-seq(from =1, to =20, length.out =10)
y<-rnorm(10)
labels<-letters[10]

d<-data.frame(x, y, labels)

png("test_plot.png", height =3, width = 4, units = "inches", res = 300)
plot(x,y)
dev.off()

#save .csv
write.csv("test_data.csv")


my.variable <- 2+2
q()

my.variable/3
q()