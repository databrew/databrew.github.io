##1. Section 1_Installing packages

install.packages('ggthemes')
install.packages('gsheet')

library(ggthemes)
library(gsheet)

library(databrew)
library(cism)
library(data.table)

# Get weather data
weather <- get_weather(station = 'FQMA',
                       start_year = 2010,
                       end_year = 2017,
                       save = TRUE, load_saved = TRUE)

# 2. Using dplyr

library(dplyr)

#3 creating a x object...
x <-
  weather %>%
  arrange(temp_max)

#4. removing object x
rm(x)

#5. Create a new object called x. This will be weather , but it will have a new variable named water .
# Use mutate to create this variable.
#If precipitation is greater than 0, then water should say "wet day"; otherwise it should say "dry day".
#(Hint, you'll need to use ifelse )


x <-
  weather %>%
  mutate(water = ifelse(weather$precipitation > 0, 'wet day', 'dry day'))

# 6. Create an object called y . This will be x , then grouped by water , then summarise by creating a new variable
# called number_of_days which contains the number of days that were wet vs. dry. (Hint, you'll need to use n() )

y <- x %>%
  group_by(water) %>%
  summarise(number_of_days=n())

# 7. Take a look at y. How many days were wet vs. dry?
# Wet days:187;  dry days: 2228

#8. Create an object called z . This will be y , but then mutate a new variable called percentage_of_days .
# This will be the number_of_days divided by the sum(number_of_days) multiplied by 100.

z <- y %>%
  mutate(percentage_of_days = number_of_days / sum(number_of_days)*100)

# 9. What percentage of days were wet in the dataset?
# Percentge of wet days: 7.74%


# 10. Now, you're going to overwrite weather with itself ( weather <- weather ), but then mutate a new variable
# called too_hot_to_sleep . This will be "yes" if the temp_min is greater than 28, and otherwise it will be "no".

weather <-
  weather %>%
  mutate(too_hot_to_sleep = ifelse(temp_min > 28,
                                   "yes",
                                   "no"))

# 11. Create an object called x . This will be weather , grouped by our new variable (if it was too hot to sleep or not),
# and then summarise d to create a new variable called number_of_days which should be a simple count of whether it
# was too hot to sleep or not. In the same summarise function, also create a variable called rain ,
# which should be the average precipitation

x <- weather %>%
  group_by(too_hot_to_sleep) %>%
  summarise (number_of_days=n(),
            rain = mean(precipitation))

# 12. Look at x . Which has more precipitation - days which were too hot to sleep or not?
# More precipitation occured in days which were not too hot to sleep

# 13. Overwrite weather with weather again, but this time using mutate to create three variables: year , month and day

weather <-
  weather %>%
  mutate(year = as.numeric(format(date, '%Y')),
         month = as.numeric(format(date, '%m')),
         day = as.numeric(format(date, '%d')))

# 14. Create an object called x . This will be weather , grouped by year , and then summarise d to get the following variables:
 # avgerage_temperature : the mean of temp_mean
 # hottest_temperature : the maximum of temp_max
 #lowest_temperature : the minimum of temp_min
 #number_of_days : the number of days
# NOTE: Whenever you use the mean , max or min functions, include na.rm = TRUE to make sure that the NA observations are removed.

x <- weather %>%
  group_by(year) %>%
  summarise(avgerage_temperature = mean(temp_mean, na.rm = TRUE),
           hottest_temperature = max(temp_max, na.rm = TRUE),
           lowest_temperature = min(temp_min, na.rm = TRUE),
           number_of_days = n())

# 15. Make a plot showing the year on the x axis and the hottest temperature on the y axis.
plot(x$year, x$hottest_temperature, col= 'red', xlab = 'Year', ylab = 'Max temperature (in celcius degrees)', main = 'Hottest temperatures over the years')

# 16. Overwrite x with itself, but use but use filter to keep only observations which the year is less than 2016

x <-
  x %>%
  filter (year < 2016)

# 17. Make a plot showing the year on the x axis and the lowest temperature on the y axis, using the filtered ata (x)
 plot(x$year, x$lowest_temperature, col = 'dark green', xlab = 'Year', ylab = 'Min temperature', main ='Lowest temperatures over the years')

# 18. Create an object called x . This will be weather , then filtere to remove any days in 2017, then grouped by month and day,
 # and then summarised to create a variable called average_temperature with the average temperature on that day.

 x <- weather %>%
   filter (year < 2017) %>%
   group_by(month, day) %>%
   summarise(average_temperature = mean(temp_mean))

# 19. Overwite x with itself, but use arrange to order by average_temperature

x <-
  x %>%
  arrange(average_temperature)

# 20. Look at x . Which day of the year has the lowest average temperature?
# Lowest avg temperature: 15 July

## Section 3: Making a pretty plot

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

## Thanks Joe... this is awesome!
