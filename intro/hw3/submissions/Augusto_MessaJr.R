#Section 1: installation
install.packages("ggthemes")
install.packages("gsheet")

#checking if the installation worked
library(ggthemes)
library(gsheet)

#Section 2: using dplyr
#1: loading the packages
library(databrew)
library(cism)
library(data.table)
library(dplyr)

#2: Getting weather data
weather <- get_weather(station = 'FQMA', 
                       start_year = 2010,
                       end_year = 2017)
#in the above command, shouldn't the end year be 2016, as you asked on the HW3 page???

#3: Creating x
x <- weather %>% arrange(temp_max)

#4: Deleting x
?rm
rm(x)

#5: Creating x again
x <- weather %>% mutate(water= ifelse(weather$precipitation>"0", "wet day", "dry day"))

#6: Creating y
y <- x %>% group_by(water) %>% summarise(number_of_days = n())

#7: ANSWER - there were 2199 dry days & 184 wet days

#8: Creating z
z <- y %>% mutate(percentage_of_days = (number_of_days / sum(number_of_days))*100)

#9: ANSWER - 7.72136% of the day were wet.

#10: overwriting weather
weather <- weather%>% mutate(too_hot_to_sleep = ifelse(temp_min>"28", "yes","no"))

#11: Creating another x
x <- weather %>% group_by(too_hot_to_sleep) %>% summarise(number_of_days = n(), rain = mean(precipitation))

#12: The days which were not too hot to sleep have more precipitation.

#13: overwriting weather ... again
weather <- weather %>% mutate(year = as.numeric(format(date, '%Y')), month = as.numeric(format(date, '%m')), day = as.numeric(format(date, '%d')))
# I couldn't understand the as.numeric funcion, even using the help funcion (?), so maybe on the class I will be able to get what this does.
?as.numeric

#14: Creating x ... once more
x <- weather %>% group_by(year) %>% summarise(average_temperature = mean(temp_mean, na.rm=TRUE), hottest_temperature = max(temp_max, na.rm=TRUE), lowest_temperature = min(temp_min, na.rm=TRUE), number_of_days = n())

#15: plotting x for the hottest temperature
plot(x=x$year, y=x$hottest_temperature, xlab = "Year", ylab = "Temperature in C", main = "Temperaturas mais elevadas ao longo dos anos (2010 - 2017)", col = "blue", type = "h")

#16: overwriting x with x and filtering
x <- x[x$year<="2016",]

#17: plotting x for the lowest temperature
plot(x=x$year, y=x$lowest_temperature, xlab = "Year", ylab = "Temperature in C", main = "Temperaturas mais elevadas ao longo dos anos (2010 - 2016)", col = "blue", type = "h")

#18: Creating x ... all over again
x <- weather[weather$date<="2016-12-31",] %>% group_by(month,day) %>% summarise(average_temperature = mean(temp_mean))

#19: overwriting x ... again???
x <- x %>% arrange(average_temperature)

#20: ANSWER - the day with the lowest average temperature is 15th of July

#Section 3: making a pretty plot
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

#The End of Homework 3. 
#This one was tiring. Had some doubts on question 18, because I made some confusion on the dates there, but then I was abble to solve it.
#See you on April 26th. Augusto Messa Jr.
