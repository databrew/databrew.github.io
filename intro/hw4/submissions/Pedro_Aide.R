# Homework 4

#Section 1: Installation
library(knitr)
library(rmarkdown)
library(gsheet)
library(plotly)
library(ggthemes)

#Section 2


 

#Section 3 
  #1. Run the following code to get some data about cats 
  library(cism)
  library(databrew)
  library(dplyr)
  cats <- MASS::cats
  
#2. Create an object called x, which shows the average body weight for each sex. 
#Hint, you will need to use %>%, group_by and summarise.
  x <- cats %>%
    group_by(Sex) %>%
    summarise(avweight=mean(Bwt))
  #3. Which cats have a greater average body weight: males or females? 
    x 
    #Males have a greater average body weight
 #4. In cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). 
     #(Hint, you will need to use  cats <- cats %>% ... to do this.)
  cats <- cats %>%
    filter(Bwt<3.8)
#5. In cats, use mutate to create a new variable called hb. 
  #This will be the heart weight divided by the body weight. 
   #(Hint, you will need to use cats <- cats %>%  to do this.)
  cats <- cats %>%
    mutate(hb=Hwt/Bwt)
  #6. Create an object called x which shows the average hb for each sex.
  x <- cats %>%
    group_by(Sex) %>%
    summarise(avweight=mean(hb))
  #7. Which cats have a greater average hb (heart to body weight ratio): males or females?
  x
    #Females have a greater hb

#Section 4
  library(ggplot2)
  library(ggthemes)
  library(MASS)
  
  
 #1. Get some data on traffic accidents by running the following code.
  traffic <- MASS::Traffic
 #2. Type ?Traffic to get information on the dataset.
  ?Traffic
#3. What do the variables mean?
   #This data frame contains the following columns:
     #year: 1961 or 1962.
    #day of year
    #limit: was there a speed limit?
    #y: traffic accident count for that day.
#4. Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a histogram
  ggplot(data=traffic, 
         aes(x=y)) + 
         geom_histogram()
#5. Run the same code as above, but instead of a histogram, make a density chart.
ggplot(data=traffic, 
         aes(x=y)) + 
    geom_density()
  #6. Run the same code as above, but add transparency, change the fill color, add a title, add an x label, and add a y label.
  ggplot(data=traffic, 
         aes(x=y)) + 
    geom_density(color="darkgreen", 
                   fill="lightgreen", 
                   alpha=0.3) + 
    labs(title="Number of Traffic Accidents", 
         subtitle="Between 1961 & 1962", 
         xlab="Number of Accidents", 
         ylab="Frequncy") + 
    theme_fivethirtyeight()
  #7. Run the same code as above, but make the fill be different for whether or not there was a speed limit that day (ie, the  limit variable).
  ggplot(data=traffic, 
         aes(x=y, 
             fill=limit)) + 
    geom_density(alpha=0.3) + 
    scale_fill_manual(name="Speed Limit", 
                      values=c("yellow", "red")) +
    labs(title="Number of Traffic Accidents", 
         subtitle="Between 1961 & 1962", 
         xlab="Number of Accidents", 
         ylab="Frequncy") + 
    theme_fivethirtyeight()
  #8. Based on the above chart, did having a speed limit reduce the number of daily traffic accidents?
    #Yes, a little bit 
  #9. Create a new plot. This will have limit on the x axis and y on the y axis. Make it a jittered point chart (hint, use  geom_jitter).
  ggplot(data=traffic, 
         aes(x=limit, 
             y=y)) + 
    geom_jitter()
  #10. Run the same code as above, but add a boxplot to the chart. Make sure it’s semi-transparent, so you can see the points.
  ggplot(data=traffic, 
         aes(x=limit, 
             y=y)) + 
    geom_jitter() + 
    geom_boxplot(alpha=0.2)
  #11. Run the same code as above, but remove the boxplot and add a transparent violin chart.
  ggplot(data=traffic, 
         aes(x=limit, 
             y=y)) + 
    geom_jitter() + 
    geom_violin(alpha=0)
  #12. Make the chart more beautiful by adding a theme, title, x label, and y label.
  ggplot(data=traffic, 
         aes(x=limit, 
             y=y)) + 
    geom_jitter() + 
    geom_violin(fill="red", 
                alpha=0.1) + 
    labs(title= "Number of Accidents per Day", 
         subtitle= "In Areas WITH and WITHOUT speed limits", 
         xlab="Speed Limit", 
         ylab="Accidents/day") + 
    theme_fivethirtyeight()
  #13. Run the same code as above, but use facet_wrap to create separate visualizations for each year.
  ggplot(data=traffic, 
         aes(x=limit, 
             y=y)) + 
    geom_jitter() + 
    geom_violin(fill="red", 
                alpha=0.1) + 
    facet_wrap(~year, nrow=2)
    labs(title= "Number of Accidents per Day", 
         subtitle= "In Areas WITH and WITHOUT speed limits", 
         xlab="Speed Limit", 
         ylab="Accidents/day")
  #14. Create an object called daily. This will be traffic, then grouped by day and limit, 
    #and then summarised to create a variable called accidents 
      #which will be the average number of accidents (y) on that day.
  daily <- traffic %>%
    group_by(day, limit) %>%
    summarise(accidents=mean(y)) %>%
    arrange(limit, day)
  #15. Create a plot of daily with day on the x axis and accidents on the y axis. Make the color be a reflection of whether or not there was a limit. Add a layer of points.
  ggplot(data=daily, 
         aes(x=day, 
             y=accidents, 
             color=limit)) + 
    geom_point()
  #16. Run the same code as above, but add geom_smooth() to create smoothed trend lines.
  ggplot(data=daily, 
         aes(x=day, 
             y=accidents, 
             color=limit)) + 
    geom_smooth()
  #17. Make the chart beautiful.
  ggplot(data=daily, 
         aes(x=day, 
             y=accidents, 
             color=limit)) + 
    geom_smooth() + 
    scale_color_manual(name="Speed Limit", 
                       values=c("red", "blue")) + 
    labs(title="Accidents per Day",
         xlab= "Day of the year", 
         ylab="Accidents/day") + 
    theme_economist()
  #18. Assign the code from the chart to an object named g like this
  g <- ggplot(data=daily, 
              aes(x=day, 
                  y=accidents, 
                  color=limit)) + 
    geom_smooth() + 
    scale_color_manual(name="Speed Limit", 
                       values=c("red", "blue")) + 
    labs(title="Accidents per Day",
         xlab= "Day of the year", 
         ylab="Accidents/day") + 
    theme_economist()
  #19. Now run the following:
  library(plotly)
  ggplotly(g)
  #20. Having now examined the data visually, if you were the president of Sweden, would you have a speed limit or not? Why?
  #Despite being really annoying... Yes, I would. 
  