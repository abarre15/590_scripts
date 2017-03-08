#task 7 

library(dplyr)
library(nycflights13)
library(ggplot2)
library(babynames)
library(tidyverse)

#in order to look at the data use head(weather)
 wind.speed <- weather %>%
   select(wind_speed, origin, wind_dir) 
#find outliers
wind.speed.bp <- wind.speed %>%
   ggplot(aes(x = origin, y = wind_speed))+
  geom_boxplot()+
  geom_point(position=position_jitter(width=0.3))
print(wind.speed.bp)

#filter outliers
wind.filter<- wind.speed %>%
  filter(wind_speed <1000)

#graph again 
wind.speed.noout <- wind.filter %>%
  ggplot(aes(x = origin, y = wind_speed))+
  geom_boxplot()+
  geom_point(position=position_jitter(width=0.3))
print(wind.speed.noout)

#plot median wind speed by direction 
wind.speed.median<-wind.filter %>%
            group_by(wind_dir, origin) %>%
  summarise(windspeed = median(wind_speed, na.rm = TRUE))
 
#graph medians
wsm_plot <- wind.speed.median %>%
  ggplot(aes( x = wind_dir, y = windspeed))+
  geom_point()+
  facet_wrap(~origin)
print(wsm_plot)


 #Using nycflights13::flights and nycflights13::airlines:
 #Make a table with two columns: airline name (not carrier code) and median distance flown from JFK airport. The table should be arranged in order of decreasing mean flight distance. Hint: use a _join function to join flights and airlines.

 merged_flights <- flights %>%
    full_join( flights, airlines, by = "carrier") 
 
 joint_flights <- full_join(flights, airlines, by = "carrier")

  two_column_table <- joint_flights %>%
   select( carrier, distance) %>%
   print
#make wide data frame showing how many flights leave newwark by carrier 
wide_data <- nycflights13::flights %>%
  filter(origin == "EWR")%>%
  group_by(carrier, month) %>%
  summarize(value =n())

#spread the data 
wider_data <- wide_data %>%
  spread(month, value)
  
 

##### 
#baby names 
#####

top_names_2014 <- babynames %>%
  filter(year == 2014) %>%
  group_by(sex) %>%
  top_n(10, n) %>%
  select(name, sex)
  
top_babynames <- top_names_2014%>%
  full_join(babynames, by = c("name","sex"), na.rn = TRUE)

#graph the baby names 
baby_names_plots <- top_babynames %>%
  ggplot(aes(x = year, y = prop))+
  geom_point()+
  facet_wrap(~name)
print(baby_names_plots)

top_girls_names <- babynames %>%
  filter( sex == "F", year == "1896"| year == 1942 |year == "2014")%>%
  group_by(year) %>%
  mutate(name_rank = dense_rank(desc(n)))%>%
  filter((name_rank < 30) &(name_rank > 25))
head(top_girls_names)

#write code using tidyr 
diamonds_wrangled <- diamonds %>%
  filter(cut == "Good") %>%
  group_by(color)

