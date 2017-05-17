
# SECTION 1: INSTALATION

# Installation of miscellaneous packages

library(knitr)
library(rmarkdown)
library(gsheet)
install.packages("plotly") # isto nao tem no TPC, 'e por isso que negava o comando seguinte
library(plotly)

# Installation of latex for creating pdfs in R. You need a good internet connection.
# If you have windows, go to http://ftp.sun.ac.za/ftp/CTAN/systems/win32/miktex/setup/basic-miktex-2.9.6326-x64.exe and download/install.
# It refuses, so I got a copy of the installation file: basic-miktex-2.9.6236-x64.exe, from Delfino.
# Few other files had to be installed from the internet as requested by the exe file...until it produced a pdf file.


# Section 3: Quick review of dplyr

# 1. Run the following code to get some data about cats.
library(cism)
library(databrew)
library(dplyr)

cats <- MASS::cats

# 1.Create an object called x, which shows the average body weight for each sex. Hint, you'll need to use %>%, group_by and  summarise.

x <- cats  %>% group_by(Sex) %>% summarise(avg_wgt = mean(Bwt))


# Which cats have a greater average body weight: males or females?
    # Response: males

# In cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). (Hint, you'll need to use  cats <- cats %>% ... to do this.)

cats <- cats[cats$Bwt<3.8, ]
# cats <- cats %>% filter(Bwt>3.8) # este comando esta errado. Investigar porque?

# In cats, use mutate to create a new variable called hb. This will be the heart weight divided by the body weight. (Hint, you'll need to use cats <- cats %>% ... to do this.)

cats <- cats %>% mutate(hb = Hwt/Bwt)


# Create an object called x which shows the average hb for each sex.

x <- cats %>% group_by(Sex) %>% summarise(mean(hb))

# Which cats have a greater average hb (heart to body weight ratio): males or females?
# Response: FEMALES


# Section 4: Data visualization
# We're going to be make charts using ggplot2 package. So, go ahead and run:
  
library(ggplot2)
library(ggthemes)
library(MASS)

# Get some data on traffic accidents by running the following code.
traffic <- MASS::Traffic  # traffic is one of MASS datafiles. This contains data from the "Effect of Swedish Speed Limits on Accidents" study.

# 4.Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a histogram

ggplot(data=traffic, aes(x=y))

ggplot(data=traffic, aes(x=y)) + geom_histogram()

# 5.Run the same code as above, but instead of a histogram, make a density chart.

ggplot(data=traffic, aes(x=y)) + geom_density()


# 6.Run the same code as above, but add transparency, change the fill color, add a title, add an x label, and add a y label.

ggplot(data =Traffic, aes(x=y)) + geom_density(fill='blue', alpha=0.5)+
  labs(title='Traffic accidents in Sweden, 1962', x='Number of traffic accidents', y='Density of traffic accidents')

# 7.Run the same code as above, but make the fill be different for whether or not there was a speed limit that day (ie, the  limit variable).

ggplot(data =Traffic, aes(x=y, fill=limit)) + geom_density(alpha=0.5)+ 
  scale_fill_manual(name='limit', values=c('pink', 'blue'))+ labs(title='Traffic accidents in Sweden, 1962', x='number of traffic accidents', y='density of traffic accidents')

# 8.Based on the above chart, did having a speed limit reduce the number of daily traffic accidents?
    # Response = YES


# 9.Create a new plot. This will have limit on the x axis and y on the y axis. Make it a jittered point chart (hint, use  geom_jitter).

ggplot(data =Traffic, aes(x='limit', y= 'y')) + geom_jitter()

# 10.Run the same code as above, but add a boxplot to the chart. Make sure it's semi-transparent, so you can see the points.

ggplot(data=Traffic, aes(x=limit, y=y)) +
  geom_jitter() + geom_boxplot(alpha=0.5)

# 11.Run the same code as above, but remove the boxplot and add a transparent violin chart.

ggplot(data=Traffic, aes(x=limit, y=y)) +
  geom_jitter() + geom_violin (alpha=0.5)

# 12.Make the chart more beautiful by adding a theme, title, x label, and y label.

ggplot(data=Traffic, aes(x=limit, y=y)) +
  geom_jitter() + geom_violin (alpha=0.5) + theme_economist()+
  labs(title='Speed limit and traffic accidents in Sweden, 1962', x='was there speed limit in that day?', y='number of traffic accidents for that day')

# 13.Run the same code as above, but use facet_wrap to create separate visualizations for each year.


ggplot(data=Traffic, aes(x=limit, y=y)) +
  geom_jitter() + geom_violin (alpha=0.5) + theme_economist()+
  labs(title='Speed limit and traffic accidents in Sweden, 1962', x='was there speed limit in that day?', y='number of traffic accidents for that day')+ facet_wrap(~year)


# 14.Create an object called daily. This will be traffic, then grouped by day and limit, and then 
# summarised to create a variable called accidents which will be the average number of accidents (y) on that day.

daily <- Traffic 

daily <- daily %>% group_by(day, limit) %>% summarise(accidents=mean(y))


# 15.Create a plot of daily with day on the x axis and accidents on the y axis. 
# Make the color be a reflection of whether or not there was a limit. Add a layer of points.

ggplot(data=daily, aes(x=day, y=accidents, color=limit)) +
  geom_point()

# 16.Run the same code as above, but add geom_smooth() to create smoothed trend lines.

ggplot(data=daily, aes(x=day, y=accidents, color=limit)) +
  geom_point() + geom_smooth()

ggplot(data=daily, aes(x=day, y=accidents, color=limit)) +
   geom_smooth()  # why they look differente, see scale, maybe...


# 17.Make the chart beautiful.

ggplot(data=daily, aes(x=day, y=accidents, color=limit))+
  geom_point()+geom_smooth()+ theme_economist()+
  labs(title='Speed limit and traffic accidents in Sweden, 1962', x='day of the year', y='number of traffic accidents for that day')

# 18.Assign the code from the chart to an object named g like this:

    # g <- your_code_for_making_the_plot

g <- ggplot(data=daily, aes(x=day, y=accidents, color=limit))+
  geom_point()+geom_smooth()+ theme_economist()+
  labs(title='Speed limit and traffic accidents in Sweden, 1962', x='day of the year', y='number of traffic accidents for that day')

# 19.Now run the following:

library(plotly)
ggplotly(g) # this "g" is the one that we have created above...like a small do-file evoqued by ggpltly

# 20.Having now examined the data visually, if you were the president of Sweden, would you have a speed limit or not? Why?

    # RESPONSE: YES, because days with speed limits tend to have fewer accidents than those with no speed limits.





