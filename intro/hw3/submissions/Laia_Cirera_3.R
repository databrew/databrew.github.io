#Homework 3. Tuesday, April 25, 2017. Laia Cirera

#SECTION 1: INSTALLATION

install.packages('ggthemes')
install.packages('gsheet')

library(ggthemes)
library(gsheet)

# SECTION 2: USING DPLYR

#Run code to use the databrew, cism and data.table packages.

library(dplyr)
library(databrew)
library(data.table)
library(cism)

# Get weather data
weather <- get_weather(station = 'FQMA', 
                       start_year = 2010,
                       end_year = 2017)

#Create an object called x. This will be weather, but "arranged" by the temp_max variable. Hint, you'll need to use both  %>% and arrange.

x <- weather %>% arrange(temp_max)

#Delete x by using the rm command.

rm(x)

#Create a new object called x. This will be weather, but it will have a new variable named water. Use mutate to create this variable. If precipitation is greater than 0, then water should say "wet day"; otherwise it should say "dry day". (Hint, you'll need to use ifelse)

x <- weather %>% mutate(water=precipitation)

x$water <- ifelse(x$precipitation >0, 'wet day', 'dry day')


#Create an object called y. This will be x, then grouped by water, then summarise by creating a new variable called  number_of_days which contains the number of days that were wet vs. dry. (Hint, you'll need to use n())

y <- x %>% group_by(water) %>% summarise(number_of_days=n())

#Take a look at y. How many days were wet vs. dry?

#dry day: 2228
#wet day: 187

#Create an object called z. This will be y, but then mutate a new variable called percentage_of_days. This will be the  number_of_days divided by the sum(number_of_days) multiplied by 100.

z <- y %>% mutate(percentage_of_days= number_of_days/sum(number_of_days)*100)

#What percentage of days were wet in the dataset?

# 7,74%

#Now, you're going to overwrite weather with itself (weather <- weather), but then mutate a new variable called  too_hot_to_sleep. This will be "yes" if the temp_min is greater than 28, and otherwise it will be "no". I'll help you on this one:

weather <-  weather %>% mutate(too_hot_to_sleep = ifelse(temp_min > 28,
                                   "yes",
                                   "no"))

# Create an object called x. This will be weather, grouped by our new variable (if it was too hot to sleep or not), and then  summarised to create a new variable called number_of_days which should be a simple count of whether it was too hot to sleep or not. In the same summarise function, also create a variable called rain, which should be the average  precipitation.

rm(x)

x <- weather %>% group_by(too_hot_to_sleep) %>% summarise(number_of_days=n(),
                                                          rain = mean(precipitation)) 

# Look at x. Which has more precipitation - days which were too hot to sleep or not?

# Days which were not too hot to sleep

# Overwrite weather with weather again, but this time using mutate to create three variables: year, month and day. I'll help you on this one again.

weather <- weather %>% mutate(year = as.numeric(format(date, '%Y')), month = as.numeric(format(date, '%m')), day = as.numeric(format(date, '%d')))

# Create an object called x. This will be weather, grouped by year, and then summarised to get the following variables:
#average_temperature: the mean of temp_mean
#hottest_temperature: the maximum of temp_max
#lowest_temperature: the minimum of temp_min
#number_of_days: the number of days

#Whenever you use the mean, max or min functions, include na.rm = TRUE to make sure that the NA observations are removed.

x <- weather %>% group_by(year) %>% summarise(average_temperature=mean(temp_mean, na.rm=TRUE),hottest_temperature=max(temp_max, na.rm=TRUE), lowest_temperature=min(temp_min, na.rm=TRUE), number_of_days=n())

#Make a plot showing the year on the x axis and the hottest temperature on the y axis.

plot(x=x$year, y=x$hottest_temperature)

#Overwrite x with itself, but use filter to keep only observations for which the year is less than 2016.

x <- x[x$year<2016, ]

#Make a plot showing the year on the x axis and the lowest temperature on the y axis, using the filtered data (x).

plot(x=x$year, y=x$lowest_temperature)


#Create an object called x. This will be weather, then filtered to remove any days in 2017, then grouped by month and  day, and then summarised to create a variable called average_temperature with the average temperature on that day.

x <- weather[weather$year<2017, ] %>% group_by(month, day) %>% summarise(average_temperature=mean(temp_mean, na.rm=TRUE))

#Overwite x with itself, but use arrange to order by average_temperature.

x <- x %>% arrange(average_temperature)

#Look at x. Which day of the year has the lowest average temperature?

# 15th july

# SECTION 3: MAKING A PRETTY PLOT

#Don't worry, all you have to do is copy and paste here. If you can run the below code (and it produces a pretty plot), this means that (a) you successfully did the homework, and (b) you have all the packages you need for next class.

library(ggplot2)
library(ggthemes)
ggplot(data = x, aes(x = factor(month), y = average_temperature)) + geom_jitter(alpha = 0.6) + geom_violin(fill = 'darkorange', alpha = 0.6) + labs(x = 'Month', y = 'Average temperature', title = 'Mozambican weather', subtitle = 'It is so lovely') + theme_economist()

