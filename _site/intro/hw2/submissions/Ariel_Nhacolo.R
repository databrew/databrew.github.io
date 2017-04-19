
# HOMEOWRK 2

#=============================================================================================================
# SECTION I: MAPS
#=============================================================================================================

# We need the following packages: cism, sp, databrew. To "Load" them, we use the command library(name of package)
# Estes packages ja instalamos no comeco do curso. Nao 'e isso Joe?

# 1.CREATE A MAP OF MOZAMBIQUE

library(cism)
library(sp)
library(databrew)

plot(moz0)

# 2. Now make that map yellow, add an interesting title, and remove the border (hint, use border = FALSE).

plot(moz0, col="yellow")

plot(moz0, col="yellow", border= FALSE)

plot(moz0, col='yellow', border= FALSE, main = "Mapa da Republica de Mocambique")

plot(moz0, col='yellow', main = "Mapa da Republica de Mocambique") # repeating with border


# 3. Make a plot of Manhiça by running plot(man3). Now color the map grey, make the plot have white borders, and add a title

plot(man3, col='grey', border= "white", main = "Mapa do distrito de Manhica")


# 4. Add points to the plot of Manhiça by running the following:

census <- databrew::census # what these "::" stand for??
points(census$longitude, census$latitude, cex = 0.2) # by default the point color is black? but if add  col="blue" they change to blue.
points(census$longitude, census$latitude, col="blue", cex = 0.2) # What cex is? not found with ?cex !!


#=================================================================================================================
# SECTION II: FILTERING, VARIABLE CREATION, AND TABULATION
#=================================================================================================================

#	1. Create an object called females. This should be all of the people in census who are female


females <- census[census$sex == 'female', ] ## I still cannot understand the diff between and object and database or table


# 2.	What is the average age of all females?

mean(females$age) # = 36.21885 years

# 3.	Make a histogram of females' ages. Color it blue with white borders.

hist(females$age, col = "blue", border = "white")

# 4.	Make a new variable in the females dataframe called middle_aged. 
# If someone is between age 40 and 60, this variable should say "middle aged", otherwise it should say "not middle aged".
# Hint, your code will start like this: census$middle_aged <- ifelse(
# Another hint, you will need to use the & symbol.
  
census$middle_aged <- ifelse(census$age > 40 & census$age < 60, "middle aged","not middle aged") # interesting here


# 5.	Make a variable called moto2. Use ifelse again. If a person has a moto, the moto2 variable should say "has moto"; otherwise, it should say "no moto".

census$moto2 <- ifelse(census$moto=='yes',"has moto","no moto") # after opening the databse, how do we higlight a row, for example to check de original vs new varible
# Is it possible to hid some variables? For example I want to see variable moto very close to moto2 to check the output of my command.

# 6.	Make a table of the middle_aged variable called tt.

tt <- table(census$middle_aged) # how do we visualize this table?

# 7.	Make a cross-table of both the moto2 variable and the middle_aged variable. Make sure to do moto2 before middle_aged. Call it xt.

xt <- table(census$moto2, census$middle_aged) # Again I can see these objects in the Global Environment widow, but cannot see the content

# 8.	Run a Chi-squared test on the xt table to see if there is a significant association between being middle aged and having a motorcycle
# among women. What is the p-value? Is it significant?

chisq.test(xt)
# Results: X-squared = 0.3016, df = 1, p-value = 0.5829
# There is no statistical significant association between the two characteistics bcs the p-value is over the maimum limit of 0.05.


# 9.	Use prop.table to create an object named pxt, which will be proportional table of xt.

pxt <- prop.table(xt) # Content of the output? 

# 10.	Multiply pxt by 100 to get percentages, and assign the result to pxt (ie, you are going to "over-write" pxt) like this:

pxt <- pxt * 100

# 10.	Make a barplot of pxt, adding the arguments beside = TRUE and legend = TRUE. 
# Also make the plot have a title, and use the colors "purple" and "darkorange".

barplot(pxt, beside = TRUE, legend = TRUE, main = "Motorcycle among middle-aged women", col = c("purple", "darkorange"))
 # Legend in the wrong place

#=====================================================================================================
# SECTION III: PACKAGES
#=====================================================================================================

# 1. Make sure you have tidyverse installed on your system. You can check by running library(tidyverse) (you might get some warnings but you should have no errors). If you have tidyverse, great! If not, you need to run install.packages('tidyverse') to make sure you have it.

library(tidyverse)

# 2.	Make sure you have data.table installed on your system. You can check by running library(data.table) (you might get some warnings but you should have no errors). If you have data.table, great! If not, you need to run install.packages('data.table') to make sure you have it.

library(data.table) 


#=====================================================================================================
# SECTION IV: WHEATHER DATA
#=====================================================================================================

# In this section, we're going to explore weather data!
# 1.	Load the cism and data.table packages.

library(cism)
library(data.table)

# 2.	Read about the get_weather function by running ?get_weather

?get_weather # How do we know the name of the station of a specific place? for example for Beira?

# 3.	WITH A GOOD INTERNET CONNECTION, run the following code to get the last 7 years of Maputo weather data:
  
# Get which folder you are working in right now
wd <- getwd()  # "C:/Users/anhacolo/Documents". ? But I thought I was in D:\MANHICA\Data_analysis\R_CURSO, where I put all the R stuffs.
print(wd) # what does it mean?


# Get weather data. The source of the wheather data is www.wunderground.com

weather <- get_weather(station = 'FQMA', start_year = 2010, end_year = 2017)

 save 'D:/MANHICA/Data_analysis/R_CURSO/weather' como faco para gravar ??????????????????????????????????????????????

# 4.	Use head to look at the top of the data.

head(weather)

# 5.	Use colnames to see the names of the columns in the data.

colnames(weather) # is not there a better command like describe in Stata, which shows the types of variables (strings, double, etc.)

# 6.	Use range to get the first and last dates in our data.

range(weather$date)

# 7.	What was the hottest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
                                                  
 max(weather$temp_max, na.rm = TRUE) # ?na.rm  says not found in the packges and libraries !!!

# Response = 44
 
# 8.	What was the coldest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)

 min(weather$temp_max, na.rm = TRUE)
 
 # Response = 14

# 9.	Make a boxplot of the average daily temperature. Make it pretty.
 
 boxplot(weather$temp_mean, main = "Average daily temperature in Maputo, 2010-2017", col = "red")
 
# 10.	Make a histogram of daily precipitation. Make it pretty.
 
 hist(weather$precipitation, main = "Daily Precipitation in Maputo, 2010-2017") # not a reasonable picture
 
# 11.	Make a plot showing date on the axis and the daily maximum temperature on the y axis.
 # Add ylim = c(0, 50) to the plot to make sure that it goes from 0 to 50. Make the color of the points in the plot red.

 plot(x=weather$date, y=weather$temp_max, ylim = c(0, 50), col = "red") # How do we change the x-axis grauation do single years?
 
 
# 12.	After making the above plot, run points(weather$date, weather$temp_min) to add points for the daily minimum temperature.
 
 points(weather$date, weather$temp_min) # I thought points refers to GPS only. Now it becomes more important to plot by year, and not 2-years scale
 
 
# 13.	Make a variable called day_dif in the weather data. This should be the difference in the daily maximum temperature and the daily minimum temperature.

 weather$day_dif <- (weather$temp_max - weather$temp_min)
 
# 14.	Make a histogram of the day_dif variable. Make it pretty.
 
 hist(weather$day_dif, main = "Daily differences between the maximum and minimum temperature in Maputo, 2010-2017", col = "orange")
 
# 15.	Make a variable called good_or_bad. Use ifelse and &. YOU decide what weather conditions make a bad day. The variable should have values which are either "bad day" or "good day".
 
 # Response: I defined "bad day" as the one that have temperature above the average of the daily maximums!, not the existing "temp_mean" variable
 
 weather$avg_temp <- mean(weather$temp_max, na.rm = TRUE) # a new variable with the average of the daily maximums!

 weather$good_or_bad <- ifelse(weather$temp_max >  weather$avg_temp, "bad day","good day")
 
 
# 16.	Make a table called good_or_bad_table. This should be a table of the good_or_bad variable.
 
 good_or_bad_table <- table(weather$good_or_bad)
 
# 17.	Make a barplot of the good_or_bad_table table. Give it multiple colors and make it pretty.
 
 barplot(good_or_bad_table, beside = TRUE, legend = TRUE, main = "Frequencias de dias com temp.acima da media das maximas diarias, Maputo, 2010-2017bad and good days, em funcao de temperaturas", col = c("red", "blue") )
 

 # 18.	According to your definition, what percentage of days are "good" (hint, use prop.table)?
 
 prop.table(good_or_bad_table) # Response: Proportion of bad days = 0.4661572; and of good days = 0.5338428 
 
 
# 19.	Make a variable called "month" like this:
 
   weather$month <- format(weather$date, '%m')
  # weather$year <- format(weather$date, '%yy)  ## Joe, I was trying to create Year, but I could not..
  # weather$day <- format(weather$date, '%dd)

# 20.	Make a cross table of month and good_or_bad. Call this cross-table xt. Make sure to put month first.
   
   xt <- table(weather$month, weather$good_or_bad) # it replaces the existing xt without complaining !?
   
# 21.	Create an object called pxt. To do this, use prop.table to create a proportional table of xt. Add 2 to make the proportions by column (1 = by row, 2 = by column).
   
   pxt <- prop.table(xt, 2)
   
# 22.	Multiply pxt by 100 to get percentages and over-write pxt.
   
   pxt <- pxt * 100
   
# 23.	Make a barplot of pxt with a legend (hint, use legend = TRUE) and with the bars beside one another (hint, use beside = TRUE).
   
   barplot(pxt, beside = TRUE, legend = TRUE, main = "Grafico de temperaturas por mes", col = c("red", "yellow")) # can't see the plot !?
   
   
# 24.	Which month has the most "good" days according to your criteria? Which month has the most "bad" days?
  
   