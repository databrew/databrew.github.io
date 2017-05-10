library(knitr)
library(rmarkdown)
library(gsheet)
library(plotly)
        
install.packages("plotly")
library(plotly)

# Section 2
# 1. how to use visual images to simplify data presentation (turn it useful and beautiful).

#2. Find and write a link to a chart in an academic publication which you think is a good data visualization. Why do you think it's good?
http://www.who.int/bulletin/volumes/86/5/07-048769/en/
# It's possible to see the incidence of pneumonia cases, by countries, per year. 

#3.Find and write a link to a chart in an academic publication which you think is a bad data visualization. Why do you think it's good? 
  http://www.health.state.mn.us/divs/idepc/newsletters/dcn/sum04/images/figure3.gif
#It's not possible to clearly diferenciate the variation of other serotypes between the years.

#section 3

library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats

#Create an object called x, which shows the average body weight for each sex. Hint, you'll need to use %>%, group_by and  summarise.
x <- cats %>%
  group_by(Sex)%>%
  summarise(average_body_weight = mean(Bwt))
  
#Which cats have a greater average body weight: males or females?
View(x)#males

#In cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). (Hint, you'll need to use  cats <- cats %>% ... to do this.)
cats <- cats %>%
  filter(cats$Bwt <= 3.8)
cats

#In cats, use mutate to create a new variable called hb. This will be the heart weight divided by the body weight. (Hint, you'll need to use cats <- cats %>% ... to do this.)
cats <- cats %>%
  mutate(hb = Hwt/Bwt)
cats

#Create an object called x which shows the average hb for each sex.
x <- cats %>%
  group_by(Sex) %>%
summarise(average_hb = mean(hb))

#Which cats have a greater average hb (heart to body weight ratio): males or females?
x #females

#section 4
library(ggplot2)
library(ggthemes)
library(MASS)
traffic <- MASS::Traffic

#Type ?Traffic to get information on the dataset.
?Traffic

#What do the variables mean?
#year 1961 or 1962
#day of year.
#limit was there a speed limit?
#y traffic accident count for that day.

#Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a histogram.
ggplot(data = traffic, aes(x = y)) + geom_histogram( alpha = 0.7, size = 1) 



#Run the same code as above, but instead of a histogram, make a density chart.
ggplot(data = traffic, aes(x = y)) + geom_density( alpha = 0.7, size = 1)


#Run the same code as above, but add transparency, change the fill color, add a title, add an x label, and add a y label.
ggplot(data = traffic, aes(x = y)) + geom_density(color = "purple", fill = "pink",  alpha = 0.5, size = 1) + labs(title = 'Primeiro geom',
                                                                                                               subtitle = 'densidade dos acidentes?',
                                                                                                               x = ' numero de acidentes',
                                                                                                               y = ' densidade')

#Run the same code as above, but make the fill be different for whether or not there was a speed limit that day (ie, the  limit variable).

ggplot(data = traffic, aes(x = y, color = limit)) + geom_density(alpha = 0.5, size = 1) + labs(title = 'Primeiro geom',
                                                                                                                  subtitle = 'densidade dos acidentes?',
                                                                                                                  x = ' numero de acidentes',
                                                                                                                  y = ' densidade')

#Based on the above chart, did having a speed limit reduce the number of daily traffic accidents?
#It's not clear, I would have to calculate the ares of each of the graphics. From the first look I could say that, having a speed limit rather increases the number of accidents. 

#Create a new plot. This will have limit on the x axis and y on the y axis. Make it a jittered point chart (hint, use  geom_jitter).
ggplot(data = traffic, aes(x = limit, y = y)) + geom_jitter(color  = "blue")


#un the same code as above, but add a boxplot to the chart. Make sure it's semi-transparent, so you can see the points.
ggplot(data = traffic, aes(x = limit, y = y)) + geom_jitter(color  = "blue") + geom_boxplot(color  = NA, fill = "pink", alpha = 0.5)

#Run the same code as above, but remove the boxplot and add a transparent violin chart.
ggplot(data = traffic, aes(x = limit, y = y)) + geom_jitter(color  = "blue") + geom_violin(color  = NA, fill = "pink", alpha = 0.5)

#Make the chart more beautiful by adding a theme, title, x label, and y label.
ggplot(data = traffic, aes(x = limit, y = y)) + 
  geom_jitter(color  = "blue") + geom_violin(color  = NA, fill = "pink", alpha = 0.5)+ 
  labs(title = 'Acidentes entre 1961 -1962',  subtitle = 'Com e sem limite de velocidade', x = ' Limite de velocidade',y = ' Numero de acidentes') + theme_dark()

#Run the same code as above, but use facet_wrap to create separate visualizations for each year.
ggplot(data = traffic, aes(x = limit, y = y)) + 
  geom_jitter(color  = "blue") + geom_violin(color  = NA, fill = "pink", alpha = 0.5)+ 
  labs(title = 'Acidentes entre 1961 -1962',  subtitle = 'Com e sem limite de velocidade', x = ' Limite de velocidade',y = ' Numero de acidentes') + 
  facet_wrap(~year)+ 
  theme_dark() 

#Create an object called daily. This will be traffic, then grouped by day and limit, and then summarised to create a variable called accidents which will be the average number of accidents (y) on that day.
daily <- 
  traffic %>% 
  group_by(day, limit) %>%
  summarise(accidents = mean(y))

#Create a plot of daily with day on the x axis and accidents on the y axis. Make the color be a reflection of whether or not there was a limit. Add a layer of points.
ggplot(data = daily, aes( x = day, y = accidents, color = limit) )+ geom_point(alpha = 0.6) 

#Run the same code as above, but add geom_smooth() to create smoothed trend lines.
ggplot(data = daily, aes( x = day, y = accidents, color = limit) )+ geom_point(alpha = 0.6)+ geom_smooth()

#Make the chart beautiful.
ggplot(data = daily, aes( x = day, y = accidents, color = limit) )+ geom_point(alpha = 0.6) + geom_smooth() + theme_classic()

#Assign the code from the chart to an object named g like this

g <- ggplot(data = daily, aes( x = day, y = accidents, color = limit) )+ geom_point(alpha = 0.6) + geom_smooth() + theme_classic()


#Now run the following:
library(plotly)
ggplotly(g)

#Having now examined the data visually, if you were the president of Sweden, would you have a speed limit or not? Why? # yes, I would. there had more accidents in the days that had no speed limit.
