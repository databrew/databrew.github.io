# Homework 4. Laia Cirera

#Due: Monday, May 8, 2017 at 23:59


# SECTION 1: INSTALLATION

#As usual, we need to install some things before next class. THIS WILL TAKE A LONG TIME. Do not wait until the last minute.
                                                                                  
#Installation of miscellaneous packages

library(knitr)
library(rmarkdown)
library(gsheet)
install.packages("plotly")
library(plotly)

# Installation of latex for creating pdfs in R

#Installation of prerequesites for R Markdown

# SECTION 2: GET INSPIRED

# would love to, but have no time!

# SECTION 3: QUICK REVIEW OF DPLYR

library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats

# 2.2 Create an object called x, which shows the average body weight for each sex. Hint, you'll need to use %>%, group_by and  summarise.

head(cats)
 
x <- cats %>% group_by(Sex) %>% summarise(mean(Bwt))

# 2.3 Which cats have a greater average body weight: males or females?
# MALES

# In cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). (Hint, you'll need to use  cats <- cats %>% ... to do this.)

cats <- cats[cats$Bwt<3.8, ]

# In cats, use mutate to create a new variable called hb. This will be the heart weight divided by the body weight. (Hint, you'll need to use cats <- cats %>% ... to do this.)

cats <- cats %>% mutate(hd=Hwt/Bwt)

# Create an object called x which shows the average hb for each sex.

x <- cats %>% group_by(Sex) %>% summarise(mean(hd))

# Which cats have a greater average hb (heart to body weight ratio): males or females?

# FEMALES

# SECTION 4: DATA VISUALIZATION

library(ggplot2)
library(ggthemes)
library(MASS)
traffic <- MASS::Traffic

# 4.2 Type ?Traffic to get information on the dataset.

?Traffic

head(Traffic)

# 4.3 What do the variables mean?

#  Year (year), day of the year(day), whether there was speed limit in effect for that day (limit) and the number of traffic accidents for that day (y)

# 4.4 Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a histogram

ggplot(data=Traffic, aes(x=y)) + geom_histogram()

# 4.5 Run the same code as above, but instead of a histogram, make a density chart.

ggplot(data=Traffic, aes(x=y)) + geom_density()

# 4.6 Run the same code as above, but add transparency, change the fill color, add a title, add an x label, and add a y label.

ggplot(data =Traffic, aes(x=y)) + geom_density(fill='blue', alpha=0.5)+
  labs(x='number of traffic accidents', y='density of traffic accidents')

# 4.7 Run the same code as above, but make the fill be different for whether or not there was a speed limit that day (ie, the  limit variable).

ggplot(data =Traffic, aes(x=y, fill=limit)) + geom_density(alpha=0.5)+ 
  scale_fill_manual(name='limit', values=c('pink', 'blue'))+ labs(x='number of traffic accidents', y='density of traffic accidents')

# 4.8 Based on the above chart, did having a speed limit reduce the number of daily traffic accidents?

# YES

# 4.9 Create a new plot. This will have limit on the x axis and y on the y axis. Make it a jittered point chart (hint, use  geom_jitter).

ggplot(data=Traffic, aes(x=limit, y=y)) +
  geom_jitter()

# 4.10 Run the same code as above, but add a boxplot to the chart. Make sure it's semi-transparent, so you can see the points.

ggplot(data=Traffic, aes(x=limit, y=y)) +
  geom_jitter() + geom_boxplot(alpha=0.5)

# 4.11 Run the same code as above, but remove the boxplot and add a transparent violin chart.

ggplot(data=Traffic, aes(x=limit, y=y)) +
  geom_jitter() + geom_violin (alpha=0)

# 4.12 Make the chart more beautiful by adding a theme, title, x label, and y label.

ggplot(data=Traffic, aes(x=limit, y=y)) +
  geom_jitter() + geom_violin (alpha=0) + theme_economist()+
  labs(title='Traffic accidents distribution depending on speed limit', x='was there speed limit in that day?', y='number of traffic accidents for that day')

# 4.13 Run the same code as above, but use facet_wrap to create separate visualizations for each year.

ggplot(data=Traffic, aes(x=limit, y=y)) +
  geom_jitter() + geom_violin (alpha=0) + theme_economist()+
  labs(title='Traffic accidents distribution depending on speed limit', x='was there speed limit in that day?', y='number of traffic accidents for that day')+ facet_wrap(~year)

# 4.14 Create an object called daily. This will be traffic, then grouped by day and limit, and then summarised to create a variable called accidents which will be the average number of accidents (y) on that day.

daily <- Traffic 

daily <- daily %>% group_by(day, limit) %>% summarise(accidents=mean(y))

  
# 4.15 Create a plot of daily with day on the x axis and accidents on the y axis. Make the color be a reflection of whether or not there was a limit. Add a layer of points.

ggplot(data=daily, aes(x=day, y=accidents, color=limit)) +
  geom_point()

# 4.16 Run the same code as above, but add geom_smooth() to create smoothed trend lines.
ggplot(data=daily, aes(x=day, y=accidents, color=limit))+
  geom_point()+geom_smooth()
  

# 4.17 Make the chart beautiful.

ggplot(data=daily, aes(x=day, y=accidents, color=limit))+
  geom_point()+geom_smooth()+ theme_economist()+
  labs(title='Number of traffic accidents by day and by speed limit', x='day of the year', y='number of traffic accidents for that day')

# 4.18 Assign the code from the chart to an object named g like this

g <- ggplot(data=daily, aes(x=day, y=accidents, color=limit))+
  geom_point()+geom_smooth()+ theme_economist()+
  labs(title='Number of traffic accidents by day and by speed limit', x='day of the year', y='number of traffic accidents for that day')


# 4.19 Now run the following:

library(plotly)
ggplotly(g)

# 4.20 Having now examined the data visually, if you were the president of Sweden, would you have a speed limit or not? Why?

# If we compare the mean number of accidents for each day (for the 2 years), we see that  we see that the trend in the number of accidents is always higher for those days with no speed limit. In consequence, it seems that the traffic policy doesn't have any impact on the number of accidents. So the president should probably apply another policy. 


