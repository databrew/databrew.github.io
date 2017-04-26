#SECTION1: Installation
install.packages('ggthemes')
install.packages('gsheet')

#run the packages
library(ggthemes)
library(gsheet)

#SECTION2: Using dplyr

#1. Run code to use the databrew , cism and data.table packages.
library(databrew)
library(cism)
library(data.table)

#2. Get weather data for Maputo from 2010 to 2016 by running the following:
weather <- get_weather(station = 'FQMA',
                       start_year = 2010,
                       end_year = 2017)

#3. Create an object called x . This will be weather , but "arranged" by the temp_max variable.
library(dplyr)
x<-weather%>%
  arrange(temp_max)
  
#Delete x by using the rm command.
rm(x)

#5. Create a new object called x. This will be weather , but it will have a new variable named water . Use mutate to create this variable. If precipitation is greater than 0, then water should say "wet day"; otherwise it should say "dry day".
x<-weather%>%
  mutate(water= ifelse(weather$precipitation>0, "wet day","dry day"))

#6. Create an object called y . This will be x , then grouped by water , then summarise by creating a new variable called number_of_days which contains the number of days that were wet vs. dry
y<-x%>%
  group_by(water)%>%
  summarise(number_of_days= n())

#7. Take a look at y. How many days were wet vs. dry?
#days wet=187; days dry=2228

#8. Create an object called z . This will be y , but then mutate a new variable called percentage_of_days . This will be the number_of_days divided by the sum(number_of_days) multiplied by 100.
z<-y%>%
  mutate(percentage_of_days= number_of_days/sum(number_of_days)*100)

#9. What percentage of days were wet in the dataset?
#dry days=92.256729; wet days=7.74

#10. Now, you're going to overwrite weather with itself ( weather <- weather ), but then mutate a new variable called too_hot_to_sleep . This will be "yes" if the temp_min is greater than 28, and otherwise it will be "no".
weather <-
  weather %>%
  mutate(too_hot_to_sleep = ifelse(temp_min > 28,
                                   "yes",
                                   "no"))   

#11.Create an object called x . This will be weather , grouped by our new variable (if it was too hot to sleep or not), and then summarise d to create a new variable called number_of_days which should be a simple count of whether it was too hot to sleep or not. In the same summarise function, also create a variable called rain , which should be the average precipitation .
x<-weather%>%
  group_by(too_hot_to_sleep)%>%
  summarise(number_of_days=n(),
            rain= mean(precipitation))
#12. Look at x . Which has more precipitation - days which were too hot to sleep or not?
#days which are not too hot to sleep

#13. Overwrite weather with weather again, but this time using mutate to create three variables: year , month and day .
weather <-
  weather %>%
  mutate(year = as.numeric(format(date, '%Y')),
         month = as.numeric(format(date, '%m')),
         day = as.numeric(format(date, '%d')))
#14. Create an object called x . This will be weather , grouped by year , and then summarise d to get the following variables
x<- weather%>%
  group_by(year)%>%
  summarise(avgerage_temperature= mean(temp_mean, na.rm = TRUE),
            hottest_temperature= max(temp_max, na.rm = TRUE),
            lowest_temperature= min(temp_min, na.rm = TRUE),
            number_of_days= n())
#15. Make a plot showing the year on the x axis and the hottest temperature on the y axis.
plot(x=weather$year, y=weather$temp_max)

#16. Overwrite x with itself, but use filter to keep only observations for which the year is less than 2016
x<-x %>%
  filter(year<2016)

#17. Make a plot showing the year on the x axis and the lowest temperature on the y axis, using the filtered data X.
plot(x=x$year, y=x$lowest_temperature)

#18. Create an object called x . This will be weather,then filtered to remove any days in 2017, then grouped by month and day, and summarised to create a variable called average_temperature with the average temperature on that day.
x<-weather%>%
  filter(year<2017)%>%
  group_by(month, day)%>%
  summarise(average_temperature= mean(temp_mean))

#19. Overwite x with itself, but use arrange to order by average_temperature .
x<-x%>%
  arrange(average_temperature)

#20. Look at x . Which day of the year has the lowest average temperature?
#day 15

#SECTION 3. Making a pretty plot

#21. Don't worry, all you have to do is copy and paste here. If you can run the below code (and it produces a pretty plot), this means that (a) you successfully did the homework, and (b) you have all the packages you need for next class.
library(ggplot2)
library(ggthemes)
ggplot(data = x,
       aes(x = factor(month),
           y = average_temperature)) +
  geom_jitter(alpha = 0.6) +
  geom_violin(fill = 'darkorange',
              alpha = 0.6) +
  labs(x = 'Month',
       y = 'Average temperature',
       title = 'Mozambican weather',
       subtitle = 'It is so lovely') +
  theme_economist()
