install.packages('ggthemes')
install.packages('gsheet')
library(ggthemes)
library(gsheet)

##Section number2
library(databrew)
library(cism)
library(data.table)

##2.Get weather data for Maputo from 2010 to 2016 by running the following:

# Get weather d

weather <- get_weather(station = 'FQMA', 
                       start_year = 2010,
                       end_year = 2017)

##3. Create an object called x. This will be weather, but "arranged" by the temp_max variable. 
#Hint, you'll need to use both  %>% and arrange
library(dplyr)
x <-weather%>% arrange(temp_max)

##4. Delete x by using the rm comman
rm(x)


##5. Create a new object called x. This will be weather, but it will have a new variable named water. 
#Use mutate to create this variable. If precipitation is greater than 0, then water should say "wet day"; 
#otherwise it should say "dry day". (Hint, you'll need to use ifelse)
x <-weather %>% mutate(water=ifelse(precipitation>0,'wet day','dry day'))

##6. Create an object called y. This will be x, then grouped by water, then summarise by creating a new variable called  number_of_days
##which contains the number of days that were wet vs. dry. (Hint, you'll need to use n())
y <-x%>%group_by(water)%>%summarise(nr_of_days=n())

##7. Take a look at y. How many days were wet vs. dry?
## There are 187 wet days and 2228 dray days


##8. Create an object called z. This will be y, but then mutate a new variable called percentage_of_days. 
#This will be the  number_of_days divided by the sum(number_of_days) multiplied by 100
z <- y%>%mutate(percent_of_days=(nr_of_days/(sum(nr_of_days)))*100)


##9. What percentage of days were wet in the dataset?
# Was 7.7 %


##10. Now, you're going to overwrite weather with itself (weather <- weather), but then mutate a new variable called  too_hot_to_sleep. 
##This will be "yes" if the temp_min is greater than 28, and otherwise it will be "no". I'll help you on this one:
weather <- weather %>% mutate(too_hot_to_sleep = ifelse(temp_min > 28,"yes","no"))


##11. Create an object called x. This will be weather, grouped by our new variable (if it was too hot to sleep or not), 
#and then  summarised to create a new variable called number_of_days which should be a simple count of whether it was too hot to sleep or not. 
#In the same summarise function, also create a variable called rain, which should be the average  precipitation.
x <-weather%>%group_by(too_hot_to_sleep)%>%summarise(number_of_days=n(),rain = mean(precipitation))

##12. Look at x. Which has more precipitation - days which were too hot to sleep or not
# The day with more precipitation was the same days with that was not too_hot_to_sleep, 2,398.


##13. Overwrite weather with weather again, but this time 
#using mutate to create three variables: year, month and day. I'll help you on this one again.

weather <- weather %>%mutate(year = as.numeric(format(date, '%Y')),
month = as.numeric(format(date, '%m')),day = as.numeric(format(date, '%d')))

##14. Create an object called x. This will be weather, grouped by year, 
#and then summarised to get the following variables:
    #avgerage_temperature: the mean of temp_mean
    #hottest_temperature: the maximum of temp_max
    #lowest_temperature: the minimum of temp_min
    #number_of_days: the number of days
x <- weather %>% group_by(year) %>% summarise(avrg_temp = mean(temp_mean, na.rm = TRUE), 
                                              hottest_temp = max(temp_max, na.rm = TRUE), 
                                              lowest_temp = min(temp_min, na.rm = TRUE), 
                                              nr_of_days = n())



##15. Make a plot showing the year on the x axis and the hottest temperature on the y axis
plot(x=x$year, y=x$hottest_temp, type="l")

##16. Overwrite x with itself, but use filter to keep only observations for which the year is less than 2016.
x <- x %>% filter(year < 2016)


##17. Make a plot showing the year on the x axis and the lowest temperature on the y axis, using the filtered data (x).
plot(x=x$year, y=x$lowest_temp, type="l")


##18. Create an object called x. This will be weather, then filtered to remove any days in 2017, then grouped by month and  day, 
#and then summarised to create a variable called average_temperature with the average temperature on that day
x <- weather %>% filter(year < 2017) %>% group_by(month, day) %>% summarise(avrge_temp = mean(temp_mean, na.rm = TRUE))


##19. Overwite x with itself, but use arrange to order by average_temperature
x <- x %>% arrange(avrge_temp)


##20.Look at x. Which day of the year has the lowest average temperature?
##The day that has de lowest average temp is 15 of Julay


##21. Don't worry, all you have to do is copy and paste here. If you can run the below code (and it produces a pretty plot), this means that (a) you successfully did the homework, 
#and (b) you have all the packages you need for next class.

library(ggplot2)
library(ggthemes)
ggplot(data = x,
       aes(x = factor(month),
           y = avrge_temp)) +
  geom_jitter(alpha = 0.6) +
  geom_violin(fill = 'darkorange',
              alpha = 0.6) +
  labs(x = 'Month',
       y = 'Average temperature',
       title = 'Mozambican weather',
       subtitle = 'It is so lovely') +
  theme_economist()





