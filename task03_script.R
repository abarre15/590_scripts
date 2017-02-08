########
# Task 3
########


set.seed(0) #This ensures that 'random' results will be the same for everyone

d <- rnorm(20)  
e <- rnorm(20)
f <- d + e

d <- rnorm(5) #make random array with 5 number 
comment(d)<-"this is data that drew is making us create in task 3" #add attributes
attr(d, "comment")<-"drew made me" #another way to do this 
names(d)<-c("a", "b", "c", "d", "e")

#2.2.2.2
f1 <- factor(letters)
levels(f1) <- rev(levels(f1))

# question 2.2.2.3
f2 <- rev(factor(letters))

f3 <- factor(letters, levels = rev(letters))


#second half of task 3
d <- read.csv("data/2016_10_11_plate_reader.csv") #adding skip =33 only reads in 61 observations 
str(d) # this shows we have created a data frame with one vector of factors, one number, and one integer 
#install tidy verse
#load tidy verse
library(tidyverse)

#read data using read_csv

d2 <- read_csv("data/2016_10_11_plate_reader.csv") # this creates a list instead of a vector 


#part 3 of task 3
nrow(mtcars) # returns the amount of rows
length(mtcars) #returns the number of columns 
ncol(mtcars) #tells you the amount of columns 

cyl <- mtcars$cyl #make a vector using $
cyl2 <- mtcars[ ,2 ] #using []
mtcars_recreate <- subset(mtcars, wt < 3 | wt > 4)
mtcars_mpg_wt <- subset(mtcars, select = c(mpg,  wt))
median(mtcars$mpg) #19.2 
average_cars <- subset(mtcars, mpg == median(mtcars$mpg)) #find which cars get the median gas milage 
median_cars <- mtcars[which(mtcars$mpg == median(mtcars$mpg)) , ] #the way i did it before worked, but this is a good way to find the data in a one row line


#fix the common error in the following:
#mtcars[mtcars$cyl = 4, ]
#mtcars[-1:4, ]
#[mtcars$cyl <= 5]
#mtcars[mtcars$cyl == 4 | 6, ]

mtcars[mtcars$cyl == 4, ] # needed two ==
mtcars[1:4, ] #remove the (-)
mtcars[mtcars$cyl <= 5, ] #???? not sure what is going on here 
mtcars[mtcars$cyl == 4 | cyl == 6, ] 
# question 4-why does this code return an error? how is it different from mtcars[1:20, ]
mtcars[1:20, ] #adding in the mtcars[1:20, ] creating a matrix giving it two dimensions? 
