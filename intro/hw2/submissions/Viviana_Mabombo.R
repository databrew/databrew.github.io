#We're going to use the following packages: cism, sp, databrew. "Load" those packages
library(cism)
library(sp)
library(databrew)

#Create a map of Mozambique by running plot(moz0). Now make that map yellow, add an interesting title, and remove the border (hint, use border = FALSE).
plot(moz0, main = "Mapa de Mocambique", col = "yellow")
plot(moz0, main = "Mapa de Mocambique", border = "FALSE")
plot(moz0, main = "Mapa de Mocambique", border = FALSE, col = "yellow")

#Make a plot of Manhiça by running plot(man3). Now color the map grey, make the plot have white borders, and add a title.
plot(man2, main = "Mapa de Manhica", col = "grey", border = "white")

#Add points to the plot of Manhiça by running the following:
census <- databrew::census
points(census$longitude,
       census$latitude,
       cex = 0.2)

#Create an object called females. This should be all of the people in census who are female.
females <- census[census$sex== "female", ]
females

#What is the average age of all females?
mean(females$age)

#Make a histogram of females' ages. Color it blue with white borders.
hist(females$age, main = "Media de idade das mulheres", col = "blue",border = "white")

#Make a new variable in the females dataframe called middle_aged. If someone is between age 40 and 60, this variable should say "middle aged", otherwise it should say "not middle aged".
females$middle_aged <- ifelse(females$age >= "40" & females$age <= "60", 'middle aged', 'not middle aged')
females$middle_aged

#Make a variable called moto2. Use ifelse again. If a person has a moto, the moto2 variable should say "has moto"; otherwise, it should say "no moto".
census$moto2 <- ifelse(census$moto== 'yes', 'has moto', 'has no moto')


#Make a table of the middle_aged variable called tt.
tt<- table(census$middle_aged)
tt

#Make a cross-table of both the moto2 variable and the middle_aged variable. Make sure to do moto2 before  middle_aged. Call it xt.
xt_table<- table(census$moto2, census$middle_aged)
xt_table


#Run a Chi-squared test on the xt table to see if there is a significant association between being middle aged and having a motorcycle among women. What is the p-value? Is it significant?
chisq.test(females$moto, females$middle_aged)

#Use prop.table to create an object named pxt, which will be proportional table of xt.
pxt<- prop.table(xt_table)
pxt

#Multiply pxt by 100 to get percentages, and assign the result to pxt (ie, you are going to "over-write" pxt) like this:
pxt <- pxt * 100
pxt

#Make a barplot of pxt, adding the arguments beside = TRUE and legend = TRUE. Also make the plot have a title, and use the colors "purple" and "darkorange".
barplot(pxt, beside =  TRUE,legend = TRUE, main = "Grafico de barras", col = c('purple','darkorange'))

#Make sure you have tidyverse installed on your system. You can check by running library(tidyverse) (you might get some warnings but you should have no errors). If you have tidyverse, great! If not, you need to run  install.packages('tidyverse') to make sure you have it.
library(tidyverse)

#Make sure you have data.table installed on your system. You can check by running library(data.table) (you might get some warnings but you should have no errors). If you have data.table, great! If not, you need to run  install.packages('data.table') to make sure you have it.
library(data.table)

#Load the cism and data.table packages.
library(cism)
library(data.table)

#Read about the get_weather function by running ?get_weather

#WITH A GOOD INTERNET CONNECTION, run the following code to get the last 7 years of Maputo weather data:

# Get which folder you are working in right now
wd <- getwd()
print(wd)
# Get weather data
weather <- get_weather(station = 'FQMA', 
                       start_year = 2010,
                       end_year = 2017)
#Use head to look at the top of the data.
head(weather)

#Use colnames to see the names of the columns in the data
colnames(weather)

#Use range to get the first and last dates in our data.
range(min(weather$date), max(weather$date))

#What was the hottest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
max(weather$temp_max, na.rm = TRUE)

#What was the coldest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
min(weather$temp_mean, na.rm = TRUE)

#Make a boxplot of the average daily temperature. Make it pretty.
boxplot(weather$temp_mean)

#Make a histogram of daily precipitation. Make it pretty.
hist(weather$precipitation, xlab = "Dias", ylab = "Frequencia", main = "Precipitacao diaria", col = "gray", border = "black" )

#Make a plot showing date on the axis and the daily maximum temperature on the y axis. Add ylim = c(0, 50) to the plot to make sure that it goes from 0 to 50. Make the color of the points in the plot red.
plot(weather$temp_max)
plot(weather$date, weather$temp_max, ylim = c(0, 50), col = 'red', main = "Temperatura maxima diaria")

#After making the above plot, run points(weather$date, weather$temp_min) to add points for the daily minimum temperature.
plot(weather$date, weather$temp_min, col = "blue", main = "Temperatura minima diaria")

#Make a variable called day_dif in the weather data. This should be the difference in the daily maximum temperature and the daily minimum temperature.
day_dif <- table(weather$temp_max - weather$temp_min)
day_dif

#Make a histogram of the day_dif variable. Make it pretty.
hist(day_dif, main = "histograma", col = "pink")

#Make a variable called good_or_bad. Use ifelse and &. YOU decide what weather conditions make a bad day. The variable should have values which are either "bad day" or "good day".
good_or_bad <- ifelse(weather$temp_min <=  20 & weather$precipitation >= 5, "bad day", "good day")
good_or_bad

#Make a table called good_or_bad_table. This should be a table of the good_or_bad variable
good_or_bad_table <- table(good_or_bad)
good_or_bad_table

#Make a barplot of the good_or_bad_table table. Give it multiple colors and make it pretty.
barplot(good_or_bad_table, beside =  TRUE,legend = TRUE, col = c ('gray','blue'), main = "Grafico de Barras", xlab = "bons e maus dias", ylab = "numero de dias")

#According to your definition, what percentage of days are "good" (hint, use prop.table)
prop.table(good_or_bad_table)

#Make a variable called "month" like this:
weather$month <- format(weather$date, '%m')
weather$month

#Make a cross table of month and good_or_bad. Call this cross-table xt. Make sure to put month first.
cross_table<- table(weather$month, good_or_bad)
cross_table

#Create an object called pxt. To do this, use prop.table to create a proportional table of xt. Add 2 to make the proportions by column (1 = by row, 2 = by column).
xt<- prop.table(cross_table)
pxt <- prop.table(xt, 2)

#Multiply pxt by 100 to get percentages and over-write pxt
pxt <- pxt * 100
pxt

#Make a barplot of pxt with a legend (hint, use legend = TRUE) and with the bars beside one another (hint, use  beside = TRUE).
barplot(pxt, beside = TRUE, legend = TRUE, main= "GRAFICO DE BARRAS", xlab = "Mes do ano", ylab = "Percentagem")

#Which month has the most "good" days according to your criteria? Which month has the most "bad"

max(weather$month, cross_table== "good day")
max(weather$month, cross_table == "bad day")

which.max(pxt == 'good day')
which.max(cross_table == "bad day")

which.max(weather$month == "good day")
which.max(weather$month == "bad day")

max(weather$month, cross_table== "good day")
max(weather$month, cross_table == "bad day")
