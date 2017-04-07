#load packages
library(cism)
library(databrew)
library(sp)

#Create a map of Mozambique
plot(moz0)
#Now make that map yellow, add an interesting title, and remove the border
plot(moz0, col="yellow", main="Mozambique", border=FALSE)

#Make a plot of Manhica
plot(man3)

#Now color the map grey, make the plot have white borders, and add a title.
plot(man3, col='grey',border='white', main='Manhica')

#Add points to the plot of Manhiça by running the following
census <- databrew::census
points(census$longitude,
       census$latitude,
       cex = 0.2)

#Create an object called females. This should be all of the people in census who are female
female<-census[census$sex=='female',]

#What is the average age of all females?
mean(female$age)

#Make a histogram of females' ages. Color it blue with white borders.
hist(female$age)
hist(female$age, col='blue', border='white')

#Make a new variable in the females dataframe called middle_aged. If someone is between age 40 and 60, this variable should say "middle aged", otherwise it should say "not middle aged".
female$middle_aged<-ifelse(female$age >=40 & female$age <= 60, 'middle aged person', 'not middle aged person')

#Make a variable called moto2. Use ifelse again. If a person has a moto, the moto2 variable should say "has moto"; otherwise, it should say "no moto".
female$moto2<-ifelse(female$moto=='yes','has moto','no moto')

#Make a table of the middle_aged variable called tt.
tt<-table(female$middle_aged)

#Make a cross-table of both the moto2 variable and the middle_aged variable. Make sure to do moto2 before  middle_aged. Call it xt.
xt<-table(female$moto2, female$middle_aged)

#Run a Chi-squared test on the xt table to see if there is a significant association between being middle aged and having a motorcycle among women. What is the p-value? Is it significant?
chisq.test(xt)

#Use prop.table to create an object named pxt, which will be proportional table of xt.
pxt<-prop.table(xt)

#Multiply pxt by 100 to get percentages, and assign the result to pxt (ie, you are going to "over-write" pxt) like this:
pxt <- pxt * 100
pxt

#Make a barplot of pxt, adding the arguments beside = TRUE and legend = TRUE. Also make the plot have a title, and use the colors "purple" and "darkorange".
barplot(pxt)
barplot(pxt,beside=TRUE, legend=TRUE)
barplot(pxt,beside=TRUE, legend=TRUE, main='age', col=c('purple', "red"))
barplot(pxt,beside=TRUE, legend=TRUE, main='age', col=c('darkorange','yellow'))

#Make sure you have tidyverse installed on your system. You can check by running library(tidyverse) (you might get some warnings but you should have no errors). If you have tidyverse, great! If not, you need to run  install.packages('tidyverse') to make sure you have it.
library(tidyverse)

#Make sure you have data.table installed on your system. You can check by running library(data.table) (you might get some warnings but you should have no errors). If you have data.table, great! If not, you need to run  install.packages('data.table') to make sure you have it.
library(data.table)

#Load the cism and data.table packages.
library(cism)
library(data.table)

# Get which folder you are working in right now
wd <- getwd()
print(wd)

# Get weather data
weather <- get_weather(station = 'FQMA', 
                       start_year = 2010,
                       end_year = 2017)

#Use head to look at the top of the data
head(weather)

#Use colnames to see the names of the columns in the data
colnames(wd)

#Use range to get the first and last dates in our data.
range(weather$date)

#What was the hottest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
max(weather$temp_max, na.rm = TRUE)

#What was the coldest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.
min(weather$temp_min, na.rm=TRUE)

#Make a boxplot of the average daily temperature. Make it pretty
barplot(weather$temp_mean)
barplot(weather$temp_mean, main='Average daily mean termperature')

#Make a histogram of daily precipitation. Make it pretty
hist(weather$precipitation)

#Make a plot showing date on the axis and the daily maximum temperature on the y axis. Add ylim = c(0, 50) to the plot to make sure that it goes from 0 to 50. Make the color of the points in the plot red
plot(weather$date , weather$temp_max, xlab='date',ylab='daily maximum temperture', ylim=c(0, 50))

#After making the above plot, run points(weather$date, weather$temp_min) to add points for the daily minimum temperature.
points(weather$date, weather$temp_min, col='yellow')

#Make a variable called day_dif in the weather data. This should be the difference in the daily maximum temperature and the daily minimum temperature.
weather$day_dif <- weather$temp_max-weather$temp_min

#Make a histogram of the day_dif variable. Make it pretty
hist(weather$day_dif)
hist(weather$day_dif, col='red')
#Make a variable called good_or_bad. Use ifelse and &. YOU decide what weather conditions make a bad day. The variable should have values which are either "bad day" or "good day".
weather$good_or_bad<-ifelse(weather$temp_min>20 & 
                              weather$temp_max<30 & 
                              weather$precipitation== 0, 'good', 'bad')
                              
#Make a table called good_or_bad_table. This should be a table of the good_or_bad variable
table(weather$good_or_bad)

#Make a barplot of the good_or_bad_table table. Give it multiple colors and make it pretty
barplot(table(weather$good_or_bad))
barplot(table(weather$good_or_bad), main="Weather condition", col=c("yellow","red"))

#According to your definition, what percentage of days are "good" (hint, use prop.table)?
prop.table(table(weather$good_or_bad))

#Make a variable called "month" like this:
weather$month <- format(weather$date, '%m')

#Make a cross table of month and good_or_bad. Call this cross-table xt. Make sure to put month first.
xt<-table(weather$month,weather$good_or_bad)

#Create an object called pxt. To do this, use prop.table to create a proportional table of xt. Add 2 to make the proportions by column (1 = by row, 2 = by column).
pxt<-prop.table(xt, 1)

#Multiply pxt by 100 to get percentages and over-write pxt.
pxt<-prop.table(xt, 1) * 100

#Make a barplot of pxt with a legend (hint, use legend = TRUE) and with the bars beside one another (hint, use  beside = TRUE).
barplot(pxt, legend=TRUE, beside=TRUE)

#Which month has the most "good" days according to your criteria? Which month has the most "bad" days? Extra credit: Explain your weather criteria (ie, number 15) and why you think your conditions for a "good day" are better than other people's.
#Warm weather is much better because I can go out. But if it is very hot it is also not good.Precipitation is embarrassing when it is too much. 