Section 1: Maps
#We're going to use the following packages: cism, sp, databrew. "Load" those packages.
library(cism)
library(sp)
library(databrew)

#Create a map of Mozambique by running plot(moz0). Now make that map yellow, add an interesting title, and remove the border (hint, use border = FALSE).
plot(moz0)
plot(moz0, col = "yellow", main = "Mapa de Moz", border = FALSE)


#Make a plot of Manhiça by running Now color the map grey, make the plot have white borders, and add a title.
plot(man3, col = "grey", border = "white", main = "Distrito da Manhiça")

#Add points to the plot of Manhiça by running the following:
  
  census <- databrew::census
points(census$longitude,
       census$latitude,
       cex = 0.2)
#Section 2: Filtering, variable creation, and tabulation
#Create an object called females. This should be all of the people in census who are female.
females <- census[census$sex == 'female', ]
#What is the average age of all females?
mean(females$age)

#Make a histogram of females' ages. Color it blue with white borders.

hist(females$age, border = "white", col = "blue")
#Make a new variable in the females dataframe called middle_aged. If someone is between age 40 and 60, this variable should say "middle aged", otherwise it should say "not middle aged".
middle_aged<-(females)


#Hint, your code will start like this:
census$middle_aged <- ifelse(census$age > 40 & census$age < 60, "middle aged","not middle aged")


    
   # Another hint, you will need to use the & symbol.
    census$moto2 <- ifelse(census$moto == "yes", 'has moto', 'no moto')
    
   # Make a variable called moto2. Use ifelse again. If a person has a moto, the moto2 variable should say "has moto"; otherwise, it should say "no moto".
    
 tt <- table(census$middle_aged)
    #Make a table of the middle_aged variable called tt.
 
 tt <- table(census$middle_aged)
    #Make a cross-table of both the moto2 variable and the middle_aged variable. Make sure to do moto2 before  middle_aged. Call it xt.
 xt <- table(census$moto2, census$middle_aged)
   # Run a Chi-squared test on the xt table to see if there is a significant association between being middle aged and having a motorcycle among women. What is the p-value? Is it significant?
    chisq.test(xt)
    #Use prop.table to create an object named pxt, which will be proportional table of xt.
    pxt <- prop.table(xt)
   # Multiply pxt by 100 to get percentages, and assign the result to pxt (ie, you are going to "over-write" pxt) like this:
    pxt <- pxt * 100
    pxt
    
      
      #Section 3: Packages
      
     # Make sure you have tidyverse installed on your system. You can check by running library(tidyverse) (you might get some warnings but you should have no errors). If you have tidyverse, great! If not, you need to run  install.packages('tidyverse') to make sure you have it.
      library()
      library(data.table)
      
      
     # Make sure you have data.table installed on your system. You can check by running library(data.table) (you might get some warnings but you should have no errors). If you have data.table, great! If not, you need to run  install.packages('data.table') to make sure you have it.
    
    library(data.table)
    library(tidyverse)
      #Section 4: Weather data
      #In this section, we're going to explore weather data!
    install.packages('tidyverse')
    library(tidyverse)
        
        #Load the cism and data.table packages.
      
     # Read about the get_weather function by running ?get_weather
   # Make sure you have data.table installed on your system. You can check by running library(data.table) (you might get some warnings but you should have no errors). If you have data.table, great! If not, you need to run  install.packages('data.table') to make sure you have it.
    install.packages('data.table')
    library(data.table)
    #Section 4: Weather data
      library(cism)
      library(data.table)
              ?get_weather
      
     # WITH A GOOD INTERNET CONNECTION, run the following code to get the last 7 years of Maputo weather data:
        
      #  WITH A GOOD INTERNET CONNECTION, run the following code to get the last 7 years of Maputo weather data:
        # Get which folder you are working in right now
     wd <- getwd()
      print(wd)
      # Get weather data
      weather <- get_weather(station = 'FQMA', 
                             start_year = 2010,
                             end_year = 2017)
      load("D:/r/weather_FQMA_2010_2017.RData")
      Is()
      #Use colnames to see the names of the columns in the data.
      colnames(weather)
      
     # Use range to get the first and last dates in our data.
      range(weather$date)
      
     # What was the hottest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
      max(weather$temp_max, na.rm = TRUE)
      max(weather$tem_max, na.rm = TRUE)
     # What was the coldest temperature in the data? (Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
      min(weather$temp_max, na.rm = TRUE)
      
     # Make a boxplot of the average daily temperature. Make it pretty.
      boxplot (weather$temp_mean, main = "Grafico de temperatura Media", col = "green")
      
     # Make a histogram of daily precipitation. Make it pretty.
      hist(weather$precipitation, main = "Histograma de preciptacao", col="blue")
      
      #Make a plot showing date on the axis and the daily maximum temperature on the y axis. Add ylim = c(0, 50) to the plot to make sure that it goes from 0 to 50. Make the color of the points in the plot red.
      plot(x=weather$date, y=weather$temp_max, ylim = c(0, 50), col = "red")
     # After making the above plot, run points(weather$date, weather$temp_min) to add points for the daily minimum temperature.
      points(weather$date, weather$temp_min)
      #Make a variable called day_dif in the weather data. This should be the difference in the daily maximum temperature and the daily minimum temperature.
      weather$day_dif <- (weather$day_dif = weather$temp_max - weather$temp_min)
     # Make a histogram of the day_dif variable. Make it pretty.
      hist(weather$day_dif, main = "Diferenca entre a temp. min e max", col = "red")
      
      #Make a variable called good_or_bad. Use ifelse and &. YOU decide what weather conditions make a bad day. The variable should have values which are either "bad day" or "good day".
      weather$good_or_bad <- ifelse(weather$temp_min > 18, 'good day', 'bad day')
      #Make a table called good_or_bad_table. This should be a table of the good_or_bad variable.
      good_or_bad_table <- table(weather$good_or_bad)
      #Make a barplot of the good_or_bad_table table. Give it multiple colors and make it pretty.
      barplot(good_or_bad_table, beside = TRUE, legend = TRUE, main = "Grafico das temperaturas", col = c(4, 3) )
      #According to your definition, what percentage of days are "good" (hint, use prop.table)?
      prop.table(good_or_bad_table)
      
     # Make a variable called "month" like this:
      
      weather$month <- format(weather$date, '%m')
     # Make a cross table of month and good_or_bad. Call this cross-table xt. Make sure to put month first.
      xt <- table(weather$month, weather$good_or_bad)
     # Create an object called pxt. To do this, use prop.table to create a proportional table of xt. Add 2 to make the proportions by column (1 = by row, 2 = by column).
      pxt <- prop.table(xt, 2)
      
      pxt <- prop.table(xt, 2)
     # Multiply pxt by 100 to get percentages and over-write pxt.
      pxt <- pxt * 100
     # Make a barplot of pxt with a legend (hint, use legend = TRUE) and with the bars beside one another (hint, use  beside = TRUE).
      barplot(pxt,beside = TRUE, legend = TRUE, main = "Grafico de temperaturas diarias", col = c(4, 3))
     # Which month has the most "good" days according to your criteria? Which month has the most "bad" days?
      xt
     # Extra credit: Explain your weather criteria (ie, number 15) and why you think your conditions for a "good day" are better than other people's.
      
      
      fimmmmmm
      
      
      