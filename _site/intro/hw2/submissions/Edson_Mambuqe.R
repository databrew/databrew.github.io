#Section 1: Maps
# Load" those packages.
library(cism)
library(sp)

#2.Create a map of Mozambique by running plot(moz0). Now make that map yellow, add an interesting title, and remove the border (hint, use border = FALSE).
plot(moz0, main = 'Mapa do Manhica', border = FALSE)

# 3.1 Make a plot of Manhiça by running plot(man3). 
plot(moz3, fill = "blue")
#3.2 Now color the map grey, make the plot have white borders, and add a title.

plot(moz3, col = 'grey', main = 'Mapa distrital de moz', border = FALSE)
#Add points to the plot of Manhiça by running the following:
census <- databrew::census
points(census$longitude,
       census$latitude,
       cex = 0.2) 

#Section 2: Filtering, variable creation, and tabulation
#1.Create an object called females. This should be all of the people in census who are female.
females <-census[census$sex=="female"]
#What is the average age of all females?
mean(females$age)
#Make a histogram of females' ages. Color it blue with white borders.
hist(females$age, border = 'blue')
#Make a new variable in the females dataframe called middle_aged. If someone is between age 40 and 60, this variable should say "middle aged", otherwise it should say "not middle aged".
census$middle_aged <- ifelse(census$age <40 & census$age >=60, 'middle age', 'not middle age')
#Make a variable called moto2. Use ifelse again. If a person has a moto, the moto2 variable should say "has moto"; otherwise, it should say "no moto".
census$moto2 <- ifelse(census$moto == "yes", "has moto", "no moto")
#Make a table of the middle_aged variable called tt.
tt<-table(census$middle_aged)
#Make a cross-table of both the moto2 variable and the middle_aged variable. Make sure to do moto2 before middle_aged. Call it xt
xtt<- table(census$moto2, census$middle_aged)
xtt
#Run a Chi-squared test on the xt table to see if there is a significant association between being middle aged and having a motorcycle among women. What is the p-value? Is it significant?
chisq.test(xtt)
#Use prop.table to create an object named pxt, which will be proportional table of xt.
prop.table(xtt)
#Multiply pxt by 100 to get percentages, and assign the result to pxt (ie, you are going to "over-write" pxt) like this:
pxtt <- prop.table(xtt)
pxtt <- pxtt*100
pxtt
#Make a barplot of pxt, adding the arguments beside = TRUE and legend = TRUE. Also make the plot have a title, and use the colors "purple" and "darkorange"
barplot(pxtt)
barplot(pxtt, beside = TRUE)
barplot(pxtt, beside = TRUE, legend = TRUE)
#Section 3: Packages
#1.Make sure you have tidyverse installed on your system. You can check by running library(tidyverse) (you might get some warnings but you should have no errors). If you have tidyverse, great! If not, you need to run install.packages('tidyverse') to make sure you have it.
library(tidyverse)
library(data.table)
library(cism)
library(data.table)
wd <- getwd()
print(wd)
weather <- get_weather(station = 'FQMA', 
                      start_year = 2010,
                      end_year = 2017)
#4 Use head to look at the top of the data.
head(weather)

range(weather$date)

max(weather$temp_max, na.rm = TRUE)

min(weather$temp_min, na.rm = TRUE)

mean(weather$temp_mean, na.rm = TRUE)
boxplot(weather$temp_mean)
hist(weather$temp_mean)


boxplot(weather$temp_mean, ylim = c(0, 50), col = 'red')
boxplot(weather$temp_mean, ylim = c(0, 50), col = 'red')

weather$day_dif <-(weather$day_dif=weather$temp_max-weather$temp_min)

#make histogram of the day_dif variable. Make pretty
hist(weather$day_dif, col = "Blue", main = 'Day dif pretty')

#make variable called good_or_bad. Use ifelse and & you decide what weather conditions make bad day. the variabel should have values wich are eithe "bad day" or "good day"
weather$good_or_bad <- ifelse(weather$temp_max >26, "good day", "bad day")

#make a table called good_or_bat_table. this shoul be table of the good_or_bad variable.
good_or_bad_table <- table(weather$good_or_bad)
#Make a barplot of goog_or_bad_table. Give it a multiple color and make it pretty
barplot(good_or_bad_table, beside = TRUE, main = 'Bom e Mau tempo', col = c(5,6,2))
#Accoding to your defition, what percentage of "good". (hint, use prop_table)
prop.table(good_or_bad_table)
pdbt<-prop.table(good_or_bad_table)
pdbt<-pdbt*100
pdbt

#make a variable called moth like this:
weather$month <-format(weather$date,'%m')
#make cross table of month and good_or_bad. Call this cross-table Xt. Make sure put month first
XT<-table(weather$month, weather$good_or_bad)
XT
#Create an object called pxt. To do this, use prop.table to create a proportional table of xt. Add 2 to make the proportions by column (1 = by row, 2 = by column).
pxt <- prop.table(XT, 2)
#Multiply pxt by 100 to get percentages and over-write pxt.
pxt <- pxt*100
pxt
#Make a barplot of pxt with a legend (hint, use legend = TRUE) and with the bars beside one another (hint, use beside = TRUE).
barplot(pxt, legend = TRUE, beside = TRUE, main = 'temperaturas diarias')
#Which month has the most "good" days according to your criteria? Which month has the most "bad" days?
XT
#Extra credit: Explain your weather criteria (ie, number 15) and why you think your conditions for a "good day" are better than other people's.
#because its good to go to beach.
#Regards teacher!!