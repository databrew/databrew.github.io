# Homework 1 
# Due 27th of March 2017
# Beatriz Galatas

#Section 1: Maps 
  #1. We’re going to use the following packages: cism, sp, databrew. “Load” those packages.
  library(cism)
  library(sp)
  library(databrew)
  #2. Create a map of Mozambique by running plot(moz0). 
    #Now make that map yellow, add an interesting title, and remove the border (hint, use border = FALSE).
  plot(moz0, 
       main="We all know what this is", 
       col="yellow", 
       border=FALSE)
  #3. Make a plot of Manhiça by running plot(man3). 
    #Now color the map grey, make the plot have white borders, and add a title.
  plot(man3, 
       main="Manhiça District", 
       col="grey", 
       border= "white")
  #4. Add points to the plot of Manhiça by running the following:
  census <- databrew::census
  plot(man3, 
       main="Manhiça District", 
       col="grey", 
       border= "white")
  points(census$longitude,
         census$latitude,
         cex = 0.2)
  
#Section 2: Filtering, variable creation, and tabulation
  
  #1. Create an object called females. This should be all of the people in census who are female.
  females <- census[census$sex=="female",]
  #2. What is the average age of all females? --> 36.21885
  mean(females$age)
  #3. Make a histogram of females’ ages. Color it blue with white borders.
  hist(females$age, 
       col="blue", 
       border="white")
  #4. Make a new variable in the females dataframe called middle_aged. 
    #If someone is between age 40 and 60, this variable should say “middle aged”, otherwise it should say “not middle aged”.
  females$middle_aged <-
    ifelse(females$age>=40 & females$age<=60,           
           'middle aged',
           'not middle aged')
  #5. Make a variable called moto2. Use ifelse again. 
    #If a person has a moto, the moto2 variable should say “has moto”; otherwise, it should say “no moto”.
  females$moto2 <-
    ifelse(females$moto=="yes",           
           'has moto',
           'no moto')
  table(females$moto, females$moto2)
  #6. Make a table of the middle_aged variable called tt.
  tt <- table(females$middle_aged)
  tt
  #7. Make a cross-table of both the moto2 variable and the middle_aged variable. 
    #Make sure to do moto2 before  middle_aged. Call it xt.
  xt <- table(females$moto2, females$middle_aged, dnn=c("moto", "middle aged"))
  xt
  #8. Run a Chi-squared test on the xt table to see if there is a significant association between being middle aged and having a motorcycle among women.
    #What is the p-value? Is it significant? --> 0.7607, not significant 
  chisq.test(xt)
  #9. Use prop.table to create an object named pxt, which will be proportional table of xt.
  pxt <- prop.table(xt)
  #10. Multiply pxt by 100 to get percentages, and assign the result to pxt (ie, you are going to “over-write” pxt) like this:
  pxt <- pxt*100
  pxt
  #10. Make a barplot of pxt, adding the arguments beside = TRUE and legend = TRUE. 
    #Also make the plot have a title, and use the colors “purple” and “darkorange”.
  barplot(pxt, 
          beside=TRUE, 
          legend=TRUE, 
          main="Motorbike ownership in different age groups", 
          col=c("purple","darkorange"))
  
#Section 3: Packages 
  
  #1. Make sure you have tidyverse installed on your system. 
    #You can check by running library(tidyverse) (you might get some warnings but you should have no errors). 
    #If you have tidyverse, great! If not, you need to run  install.packages('tidyverse') to make sure you have it.
  library(tidyverse)
  #2. Make sure you have data.table installed on your system. 
    #You can check by running library(data.table) (you might get some warnings but you should have no errors). If you have data.table, great! 
    #If not, you need to run  install.packages('data.table') to make sure you have it.
  library(data.table)

#Section 4: Weather data 
  #1. Load the cism and data.table packages.
  library(data.table)
  library(cism)
  #2. Read about the get_weather function by running ?get_weather
  ?get_weather
  #3. WITH A GOOD INTERNET CONNECTION, run the following code to get the last 7 years of Maputo weather data:
    # Get which folder you are working in right now
    wd <- getwd()
    print(wd)
    # Get weather data
    weather <- get_weather(station = 'FQMA', 
                           start_year = 2010,
                           end_year = 2017)
  #4. Use head to look at the top of the data.
  head(weather)
  #5. Use colnames to see the names of the columns in the data.
  colnames(weather)
  #6. Use range to get the first and last dates in our data.
  range(weather$date)
  #7. What was the hottest temperature in the data? --> 44
    #(Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
  max(weather$temp_max, na.rm = TRUE)
  #8. What was the coldest temperature in the data? --> 7
    #(Hint: if you get NA as the answer, then you need to add na.rm = TRUE to the inside of the parentheses.)
  min(weather$temp_min, na.rm=TRUE)
  #9. Make a boxplot of the average daily temperature. Make it pretty.
  boxplot(weather$temp_mean, 
          col="yellow", 
          border="grey", 
          main="Mean Temperature Distribution")
  #10.Make a histogram of daily precipitation. Make it pretty.
  hist(weather$precipitation, 
       col="lightblue", 
       border="darkblue", 
       xlab="Precipitation", 
       main="Daily Precipitation (2010-2017)")
  #11. Make a plot showing date on the axis and the daily maximum temperature on the y axis. 
    #Add ylim = c(0, 50) to the plot to make sure that it goes from 0 to 50. Make the color of the points in the plot red.
  plot(x=weather$date, 
       y=weather$temp_max, 
       ylim=c(0, 50), 
       col="red", 
       xlab="Date", 
       ylab="Maximum Temperature")
  #12. After making the above plot, run points(weather$date, weather$temp_min) to add points for the daily minimum temperature.
  plot(x=weather$date, 
       y=weather$temp_max, 
       ylim=c(0, 50), 
       col="red", 
       xlab="Date", 
       ylab="Maximum Temperature")
  points(weather$date, weather$temp_min) 
  #13. Make a variable called day_dif in the weather data. 
    #This should be the difference in the daily maximum temperature and the daily minimum temperature.
  weather$day_dif <- weather$temp_max-weather$temp_min
  #14. Make a histogram of the day_dif variable. Make it pretty.
  hist(weather$day_dif, 
       col="orange", 
       border="darkblue", 
       xlab="Daily Temp Difference", 
       main="Daily temperature Difference")
  #15. Make a variable called good_or_bad. Use ifelse and &. 
    #YOU decide what weather conditions make a bad day. 
    #The variable should have values which are either “bad day” or “good day”.
  weather$good_or_bad <- 
    ifelse(weather$temp_min<20 & weather$cloud_cover>3, 
           "bad day", 
           "good day")
  #16. Make a table called good_or_bad_table. This should be a table of the good_or_bad variable.
  good_or_bad_table <- table(weather$good_or_bad)
  #17. Make a barplot of the good_or_bad_table table. 
    #Give it multiple colors and make it pretty.
  barplot(good_or_bad_table, 
          beside=TRUE, 
          legend=TRUE, 
          main="Day Category", 
          col=c("darkblue","yellow"))
  #18. According to your definition, what percentage of days are “good” (hint, use prop.table)? --> 17.76805%
  prop.table(good_or_bad_table)
  #19. Make a variable called “month” like this:
  weather$month <- format(weather$date, '%m')
  #20. Make a cross table of month and good_or_bad. 
    #Call this cross-table xt. Make sure to put month first.
  xt <- table(weather$month, weather$good_or_bad)
  #21. Create an object called pxt. To do this, use prop.table to create a proportional table of xt. 
    #Add 2 to make the proportions by column (1 = by row, 2 = by column).
  pxt <- prop.table(xt, 2)
  #22. Multiply pxt by 100 to get percentages and over-write pxt.
  pxt <- pxt*100
  #23. Make a barplot of pxt with a legend (hint, use legend = TRUE) and with the bars beside one another (hint, use  beside = TRUE).
  barplot(pxt, 
          beside=TRUE, 
          legend=TRUE, 
          main="Day Category", 
          col="green")
  #24. Which month has the most “good” days according to your criteria? --> January
    #Which month has the most “bad” days? --> September 
  pxt
  #Extra credit: Explain your weather criteria (ie, number 15) and why you think your conditions for a “good day” are better than other people’s.
  #My definition identifies cold, cloudy days as the "bas days". These days make people feel sad... 
    
    