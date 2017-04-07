# HW 2_ Ana Maria Fonseca

#Seccion1

#1. We’re going to use the following packages: cism, sp, databrew. “Load” those packages.
library(cism)
library(databrew)
library(sp)

#2. Create a map of Mozambique by running plot(moz0). Now make that map yellow, add an interesting title, and remove the border (hint, use border = FALSE).
plot(moz0,
col="yellow",
main="Mozambique",
border = FALSE)

#3. Make a plot of Manhiça by running plot(man3). Now color the map grey, make the plot have white borders, and add a title.
plot(man3,
     col="grey",
     main="Manhiça",
     border = "white")

#4. Add points to the plot of Manhiça by running the following:
  
census <- databrew::census
points(census$longitude,
       census$latitude,
       cex = 0.2)


#Section 2: Filtering, variable creation, and tabulation

#1. Create an object called females. This should be all of the people in census who are female.
female<-(census[census$sex=="female",]) 

#2. What is the average age of all females?
mean(female$age)
## 36.22

#3. Make a histogram of females’ ages. Color it blue with white borders.
hist(female$age,
     col="blue",
     border="white")

#4. Make a new variable in the females dataframe called middle_aged. If someone is between age 40 and 60, this variable should say “middle aged”, otherwise it should say “not middle aged”.
# Joe here you want census dataframe and not female??

census$middle_aged<- ifelse(census$age>=40 &
                       census$age<=60,
                     "midle aged",
                     "not midle aged")

#5. Make a variable called moto2. Use ifelse again. If a person has a moto, the moto2 variable should say “has moto”; otherwise, it should say “no moto”.
census$moto2<- ifelse(census$moto== "yes",
                      "has moto",
                      "no moto")

#6. Make a table of the middle_aged variable called tt.

tt<- table(female$middle_aged)
    
#7. Make a cross-table of both the moto2 variable and the middle_aged variable. Make sure to do moto2 before middle_aged. Call it xt.
 
xt<- table(census$moto2, census$middle_aged)

#8. Run a Chi-squared test on the xt table to see if there is a significant association between being middle aged and having a motorcycle among women. What is the p-value? Is it significant?

chisq.test(xt) 
## p-value=0.583, not significant


#9. Use prop.table to create an object named pxt, which will be proportional table of xt.
pxt<- prop.table(xt)

#10. Multiply pxt by 100 to get percentages, and assign the result to pxt (ie, you are going to “over-write” pxt) like this:
      
pxt <- pxt * 100
pxt

#11. Make a barplot of pxt, adding the arguments beside = TRUE and legend = TRUE. Also make the plot have a title, and use the colors “purple” and “darkorange”.

barplot(pxt,
        beside=TRUE,
        legend=TRUE,
        main="Moto distribution per age",
        col=c("purple", "darkorange"))


#Section 3: Packages

#Make sure you have tidyverse installed on your system. You can check by running library(tidyverse) (you might get some warnings but you should have no errors). If you have tidyverse, great! If not, you need to run install.packages('tidyverse') to make sure you have it.
library(tidyverse)

#Make sure you have data.table installed on your system. You can check by running library(data.table) (you might get some warnings but you should have no errors). If you have data.table, great! If not, you need to run install.packages('data.table') to make sure you have it.
library(data.table)

#Section 4: Weather data, In this section, we’re going to explore weather data!
  
#Load the cism and data.table packages.
library(cism)
library(data.table)

#Read about the get_weather function by running ?get_weather
?get_weather

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

#Use colnames to see the names of the columns in the data.
colnames(weather)

#Use range to get the first and last dates in our data.
range(weather$date)

#What was the hottest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
max(weather$temp_max, na.rm=TRUE)
## 44

#What was the coldest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
min(weather$temp_min,
    na.rm = TRUE)

## 7

#Make a boxplot of the average daily temperature. Make it pretty.
boxplot(weather$temp_mean,
        main="average daily temperature",
        col= "pink")

#Make a histogram of daily precipitation. Make it pretty.
hist(weather$precipitation,
     main="Daily precipitation",
     xlab="Precipitation",
     col="pink")

#Make a plot showing date on the x axis and the daily maximum temperature on the y axis. Add ylim = c(0, 50) to the plot to make sure that it goes from 0 to 50. Make the color of the points in the plot red.
plot(x=weather$date,
     y=weather$temp_max,
     main="Maximum temperature per time",
     xlab="Date",
     ylab="Temperature",
     ylin=c(0,50),
     col="red")

#After making the above plot, run points(weather$date, weather$temp_min) to add points for the daily minimum temperature.
points(weather$date,
       weather$temp_min)


#Make a variable called day_dif in the weather data. This should be the difference in the daily maximum temperature and the daily minimum temperature.
weather$day_dif<-(weather$temp_max - weather$temp_min)

#Make a histogram of the day_dif variable. Make it pretty.
hist(weather$day_dif,
     mai="Dailly temperature difference",
     xlab="Difference in temperature",
     col=rainbow(weather$day_dif),
     border="white")

#Make a variable called good_or_bad. Use ifelse and &. YOU decide what weather conditions make a bad day. The variable should have values which are either “bad day” or “good day”.
colnames(weather)
## good day= temp_mean between 18-28, humidity_mean between 40-60,precipitation==0, cloud_cover from 0 to 2 
weather$good_or_bad<-ifelse(weather$temp_mean<28 & weather$temp_mean>18 &
                            weather$humidity_mean<60 & weather$humidity_mean>40 &
                            weather$precipitation==0 & weather$cloud_cover<2 & weather$cloud_cover>=0,
                            "good",
                            "bad")

#Make a table called good_or_bad_table. This should be a table of the good_or_bad variable.
good_or_bad_table<-table(weather$good_or_bad)

#Make a barplot of the good_or_bad_table table. Give it multiple colors and make it pretty.

barplot(good_or_bad_table,
        main="type of day",
        col=c("darkblue", "darkgreen"))


#According to your definition, what percentage of days are “good” (hint, use prop.table)?
prop.table(good_or_bad_table)*100
##2.5% good days

#Make a variable called “month” like this:
  
weather$month <- format(weather$date, '%m')

#Make a cross table of month and good_or_bad. Call this cross-table xt. Make sure to put month first.
xt<-table(weather$month, weather$good_or_bad)

#Create an object called pxt. To do this, use prop.table to create a proportional table of xt. Add 2 to make the proportions by column (1 = by row, 2 = by column).

pxt <- prop.table(xt, 2)
pxt

#Multiply pxt by 100 to get percentages and over-write pxt.
pxt*100

#Make a barplot of pxt with a legend (hint, use legend = TRUE) and with the bars beside one another (hint, use beside = TRUE).
barplot(pxt,
        legend=TRUE,
        beside=TRUE)

#Which month has the most “good” days according to your criteria? Which month has the most “bad” days?
  ## good days:june, jully and agust
  ## bad days:January, february and march

#Extra credit: Explain your weather criteria (ie, number 15) and why you think your conditions for a “good day” are better than other people’s.
   ## For me a good day is a day with temperature mean between 18-28, humidity mean between 40-60, absence of precipitation and few clouds. In days like this we can just lay on the beach, take sun, go to swim and drink a 2M!!!

#Question:
   # Joe how can we play with the size of the graphs/maps, change legend places...etcc

#Great work!
  
  
