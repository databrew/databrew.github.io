#Section 1: Maps
#1: Loading the packages:
library(cism)
library(sp)
library(databrew)

#2: Map of Mozambique
plot(moz0)

#Yellow Map of Mozambique
plot(moz0, col="Yellow", main="Mapa de Mo?ambique", border=FALSE)

#3: Map of Manhi?a
plot(man3)

#Colored Map of Manhi?a
plot(man3, col="Grey", main="Mapa do Distrito da Manhi?a - Prov?ncia de Maputo", border="white")

#4: Adding points to the Manhi?a Map
census <- databrew::census
points(census$longitude,
       census$latitude,
       cex = 0.2)

#Section 2: Filtering, variable creation and tabulation
#1: Creating an object called females with all the people from census$who are females
females<-census[census$sex=="female",]

#2: Average age between females
mean(females$age)

#3: Histogram of females ages
hist(females$age, col="blue", border="white")

#4: Creating a new variable (middle_aged)
?ifelse
census$middle_aged <- ifelse(census$age >=40 & census$age <=60,"middle aged","not middle aged")

#5: Creating another new variable (moto2)
head(census)
census$moto2 <- ifelse(census$moto=="yes", "has moto", "no moto")

#6: Table of the middle_aged variable
tt <- table(census$middle_aged)

#7: Cross table: moto2 vs middle_aged
xt<-table(census$moto2, census$middle_aged)

#8: Chi-squared test on xt
chisq.test(xt)
#It is not statistically significant.

#9: Proportional table of xt
pxt<-prop.table(xt)

#10: Percentual table of xt
pxt<-pxt*100

#10: Barplot of pxt
barplot(pxt, beside = TRUE, legend = TRUE, main = "Moto2 vs Middle Aged",col=c("purple","darkorange"))

#Section 3: Packages
#1: confirming instalation of tidyverse
library(tidyverse)

#2: confirming instalation of data.table
library(data.table)

#Section 4: Weather date
#1: Loading cism and data.table packages
library(cism)
library(data.table)

#2: Getting to know get_weather
?get_weather

#3: Getting weather data
# Get which folder you are working in right now
wd <- getwd()
print(wd)

# Get weather data
weather <- get_weather(station = 'FQMA', 
                       start_year = 2010,
                       end_year = 2017)
#4: Checking top of data
head(weather)

#5: Seeing the columns names in the data
colnames(weather)

#6: Checking the range of dates
range(weather$date)

#7: Hottest temperature in the data
max(weather$temp_max, na.rm=TRUE)

#8: Coldest temperature in the data
min(weather$temp_min, na.rm = TRUE)

#9: Boxplot of the daily average temperature
boxplot(weather$temp_mean, main="Distribution of Daily Mean Temperatures in Maputo", ylab="Temperature (Celcius)")

#10: Histogram of daily precipitation
hist(weather$precipitation, main="Histogram of Precipitation - Maputo (2010-2017)", xlab="Precipitation (mm)", ylab = "Frequency (days)", col="blue", border="white")

#11: Plot date vs daily maximum temp.
plot(x=weather$date, y=weather$temp_max, ylim=c(0,50), col="red")

#12: 
points(weather$date, weather$temp_min)

#13: Creating the day_dif variable
weather$day_dif <- weather$temp_max-weather$temp_min

#14: Histogram of the daily temperature difference
hist(weather$day_dif, col="blue", border="white", main="Diferen?a das temperaturas di?rias", xlab = "Diferen?a de temp. (Celcius)", ylab = "Frequ?ncia (dias)")

#15: Creating the good_or_bad variable
weather$good_or_bad <- ifelse(weather$temp_max<=33 & weather$temp_min>=24 & weather$humidity_max<=60 & weather$humidity_min>=20,"good day", "bad day")

#16: Making a table of the good or bad variable
good_or_bad_table <- table(weather$good_or_bad)

#17: Barplot of good_or_bad_table
barplot(good_or_bad_table, beside = TRUE, legend = TRUE, main = "Good and Bad Days in Maputo",col=c("red","green"))

#18: Percentage of good days
prop.table(good_or_bad_table)

#19: Creating the month variable
weather$month <- format(weather$date, '%m')

#20: Creating a cross table between good_or_bad & month variables
xt <- table(weather$good_or_bad, weather$month)

#21: Creating pxt
pxt <- prop.table(xt,2)

#22: Calculating the pxt percentages
pxt <- pxt*100

#23: Barplot of pxt
barplot(pxt, beside = TRUE, legend = TRUE)

#24: The best month according to my criteria is January.

#Extra: I chose those criteria because I don't like days when the weather reaches extreme temperatures (very hot or very cold). I included the humidity in my criteria because, very wet days make it very difficult to breathe, specially if the temperature is too high; and very dry days are not good, because it is unpleasent for me to be in a dry enviroment.
