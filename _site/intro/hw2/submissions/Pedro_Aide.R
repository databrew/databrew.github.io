# Homework 2

#Section 1: Maps

#1. Loading packages

library(cism)
library(sp)
library(databrew)

#2. Creating a map of Mozambique

plot(moz0, col = 'yellow', main = "Mozambique Yellow", border = FALSE)

# 3.Map of Manhiça with white borders

plot(man3, col = 'grey', main = "The district of Manhica", border = "white")

#4.	Adding points to the plot of Manhiça
census <- databrew::census
points(census$longitude,
       census$latitude,
       cex = 0.2)

#Section 2

#1.	Create an object called females. This should be all of the people in census who are female

female <- census[census$sex == 'female' , ]

#2.	What is the average age of all females?
mean(female$age)
# Average age of all females: 36.2 years

#3.	Make a histogram of females' ages. Color it blue with white borders.
hist(female$age, col = 'blue', border ='white', main = 'Distribution of female ages', xlab ='Age (in years)')

#4.	Making a new variable in the females dataframe called middle_aged. If someone is between age 40 and 60, 

census$middle_aged <- ifelse(census$age > 40 & census$age < 60, "middle aged","not middle aged")

## 5. Making a variable called moto2. Use ifelse again. If a person has a moto, the moto2 variable should say "has moto"; otherwise, it should say "no moto".
census$moto2 <- ifelse(census$moto == "yes", 'has moto', 'no moto')

## 6. Making a table of the middle_aged variable called tt.
tt <- table(census$middle_aged)

## 7. Making a cross-table of both the moto2 variable and the middle_aged variable. Make sure to do moto2 before middle_aged. Call it xt.
xt <- table(census$moto2, census$middle_aged)

## 8. Runing a Chi-squared test on the xt table to see if there is a significant association between being middle aged and having a motorcycle among women. What is the p-value? Is it significant?
chisq.test(xt)

## 9. Using prop.table to create an object named pxt, which will be proportional table of xt.
pxt <- prop.table(xt)

## 10. Multiply pxt by 100 to get percentages, and assign the result to pxt (ie, you are going to "over-write" pxt) like this:
pxt <- pxt * 100
pxt

## 11. Make a barplot of pxt, adding the arguments beside = TRUE and legend = TRUE. Also make the plot have a title, and use the colors "purple" and "darkorange".
barplot(pxt, beside = TRUE, legend = TRUE, main = "Barplot graph", col = c(5, 10))


# Section 3: Packages: All packages installed
# 1.	library(tidyverse).
# 2.	library(data.table)


# Section 4: Weather data
#  1.	Loading the cism and data.table packages.
library(data.table) 
library(cism)
#library(tidyverse) 

# 2.	Reading about the get_weather function
?get_weather

# 3.Getting the last 7 years of Maputo weather data

# Get which folder you are working in right now
wd <- getwd()
print(wd)
# Get weather data
weather <- get_weather(station = 'FQMA', 
                       start_year = 2010,
                       end_year = 2017, 
                       save = TRUE, load_saved = TRUE)  

# 4.	Looking at the top of the data.
head(weather)

# 5.	Using colnames to see the names of the columns in the data
colnames(weather)

# 6.	Using range to get the first and last dates in our data
range(weather$date, na.rm = FALSE)
# 2010-01-01 to 2017-04-04)

# 7.	Getting the hottest temperature in the data
max(weather$temp_max, na.rm = TRUE)
# Max weather: 44 degre

# 8.	Getting the coldest temperature in the data
min(weather$temp_min, na.rm = TRUE)
# Min temp: 7 degrees

# 9.	Make a boxplot of the average daily temperature
boxplot(weather$temp_mean, col = 'cyan', border ='red',
        main = 'Boxplot of the average daily temperature between 2010 and 2017 in Maputo City',
        ylab ='Mean temperature')

# 10.	Make a histogram of daily precipitation.... ESTOU COM DUVIDAS DESTE GRAFICO...
hist(weather$precipitation, col = 'dark green', border ='black',
            main = 'Daily precipitation in Maputo City from 2010 to 2017',
            ylab ='Precipitation', xlab = 'Time (in days)')

# 11.	Make a plot showing max temperature

plot(weather$date, weather$temp_max, ylim = c(0, 50), col = 'red',
     main = 'Daily maximum temperature in Maputo', ylab = 'Maximum temperature', xlab = 'Time (in years)')

#12.	After making the above plot, run points(weather$date, weather$temp_min) to add points for the
points(weather$date, weather$temp_min, col = "blue")


# 13. Make a variable called day_dif in the weather data. This should be the difference in the daily maximum temperature and the daily minimum temperature.
weather$day_dif <- (weather$day_dif = weather$temp_max - weather$temp_min)

# 14. Make a histogram of the day_dif variable. Make it pretty.
hist(weather$day_dif, main = "Diference betweew max and min temperature", col = "cyan")

# 15. Making a variable called good_or_bad. Use ifelse and &. YOU decide what weather conditions make a bad day. The variable should have values which are either "bad day" or "good day".
weather$good_or_bad <- ifelse(weather$temp_min > 15, 'good day', 'bad day')

# 16. Make a table called good_or_bad_table. This should be a table of the good_or_bad variapoints(weather$date, weather$temp_min, col = 'blue') 
good_or_bad_table <- table(weather$good_or_bad)

# 17. Making a barplot of the good_or_bad_table table. Give it multiple colors and make it pretty.
barplot(good_or_bad_table, beside = TRUE, legend = TRUE, main = "Weather barplot", col = c(6, 11) )

# 18. According to your definition, what percentage of days are "good" (hint, use prop.table)?
prop.table(good_or_bad_table)
# 80.5% of the days are good

# 19.Making a variable called "month" like this:
weather$month <- format(weather$date,'%m')

# 20. Making a cross table of month and good_or_bad. Call this cross-table xt. Make sure to put month first.
xt <- table(weather$month, weather$good_or_bad)

# 21.Create an object called pxt. To do this, use prop.table to create a proportional table of xt. Add 2 to make the proportions by column (1 = by row, 2 = by column).
pxt <- prop.table(xt, 2)

# 22. Multiply pxt by 100 to get percentages and over-write pxt.
pxt <- pxt * 100

# 23.Make a barplot of pxt with a legend (hint, use legend = TRUE) and with the bars beside one another (hint, use beside = TRUE).
barplot(pxt,beside = TRUE, legend = TRUE, main = "Dayly temperatures", col = c(5, 3))

# 24. Which month has the most "good" days according to your criteria? Which month has the most "bad" days?

points(weather$date, weather$temp_min)
# Good days:March, Bad days: July

