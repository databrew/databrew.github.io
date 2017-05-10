#Section 1: Installation

#As usual, we need to install some things before next class. THIS WILL TAKE A LONG TIME. Do not wait until the last minute.
#Installation of miscellaneous packages

#Run the following cod. If you get any errors (ie, you don't have the package), install that package.

library(knitr)
library(rmarkdown)
library(gsheet)
library(plotly)

#Installation of latex for creating pdfs in R

#############Section 2: Get inspired#########################33
#1.Write in a comment in your code the main message of the video.

#There are several ways to represent data or give some information about the results of 
#a study. However, depending on the type of your data you can choose the best way that 
#will be easy to transmit, interpret and understand in less time. 

#2. Find and write a link to a chart in an academic publication which you think is a good data visualization. Why do you think it's good?

#3Find and write a link to a chart in an academic publication which you think is a bad data visualization. Why do you think it's good?

##########################Section 3: Quick review of dplyr########################

#Run the following code to get some data about cats.

library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats

#1. Create an object called x, which shows the average body weight for each sex. 
#Hint, you'll need to use %>%, group_by and summarise.
x<-cats%>%group_by(Sex)%>%summarise(mean(Bwt))

#2.Which cats have a greater average body weight: males or females?
x

#3.In cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). 
#(Hint, you'll need to use cats <- cats %>% ... to do this.)

cats <- cats %>% filter(Bwt<3.8)

#4. In cats, use mutate to create a new variable called hb. 
#This will be the heart weight divided by the body weight. 
#(Hint, you'll need to use cats <- cats %>% ... to do this.)
cats <- cats %>% mutate (hb=Hwt/Bwt)

#5. Create an object called x which shows the average hb for each sex.
x<-cats%>%group_by(Sex)%>%summarise(mean(hb))

#6.Which cats have a greater average hb (heart to body weight ratio): males or females?
x



######################################Section 4: Data visualization#########################

#We're going to be make charts using ggplot2 package. So, go ahead and run:
  
library(ggplot2)
library(ggthemes)
library(MASS)

1#.Get some data on traffic accidents by running the following code.
traffic <- MASS::Traffic

#2. Type ?Traffic to get information on the dataset.
?Traffic

#3. What do the variables mean?

#4.Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a histogram
ggplot(data = traffic, aes(x=y))+ geom_histogram()

#5.Run the same code as above, but instead of a histogram, make a density chart.
ggplot(data = traffic, aes(x=y))+ geom_density()

#6.Run the same code as above, but add transparency, change the fill color, add a title, add an x label, and add a y label.
ggplot(data = traffic, aes(x=y))+ 
  geom_density(fill='red',alpha=0.5)+
  labs(title='Traffic accident count for that day')+
  ylab("Density") +
 xlab("number accident")

#7. Run the same code as above, but make the fill be different for whether 
#or not there was a speed limit that day (ie, the limit variable).
ggplot(data = traffic, aes(x=y))+ geom_density(fill='red',alpha=0.5)+labs(title='number of accident')+ylab("Density") +
  xlab("number accident") + facet_wrap(~limit)

#8. Based on the above chart, did having a speed limit reduce the number of daily traffic accidents?
#no

#9. Create a new plot. This will have limit on the x axis and y on the y axis.
#Make it a jittered point chart (hint, use geom_jitter).
ggplot(data = traffic, aes(x=limit, y=y))+ geom_jitter()

#10. Run the same code as above, but add a boxplot to the chart. Make sure it's semi-transparent, 
#so you can see the points.
ggplot(data = traffic, aes(x=limit, y=y))+ geom_jitter()+ geom_boxplot(alpha=0.5)

#11. Run the same code as above, but remove the boxplot and add a transparent violin chart.
ggplot(data = traffic, aes(x=limit, y=y))+ geom_jitter()+ geom_violin(alpha=0.5)

#12. Make the chart more beautiful by adding a theme, title, x label, and y label.
ggplot(data = traffic, aes(x=limit, y=y))+ 
  geom_jitter()+ 
  geom_violin(alpha=0.5)+ 
  theme_economist()+
  labs(title='number of accidents', x="limit of speed", y="traffic accident count for that day")

#13. Run the same code as above, but use facet_wrap to create separate visualizations for each year.
ggplot(data = traffic, aes(x=limit, y=y))+ 
  geom_jitter()+ 
  geom_violin(alpha=0.5)+ 
  theme_economist()+
  labs(title='number of accidents', x="limit of speed", y="traffic accident count for that day")+
  facet_wrap(~year)

#14.Create an object called daily. This will be traffic, then grouped by day and limit, 
#and then summarised to create a variable called accidents which will be the average number of accidents (y) on that day.
daily<-traffic%>%group_by(day, limit)%>%summarise(accidents=mean(y))
#15.Create a plot of daily with day on the x axis and accidents on the y axis. 
#Make the color be a reflection of whether or not there was a limit. Add a layer of points.
ggplot(data = daily, aes (x=day, y=accidents, col=limit))+ geom_point()+ geom_line()

#16.Run the same code as above, but add geom_smooth() to create smoothed trend lines.
ggplot(data = daily, aes (x=day, y=accidents, col=limit))+ geom_point()+geom_smooth()
  

#17.ake the chart beautiful.
ggplot(data = daily, aes (x=day, y=accidents, col=limit))+ 
  geom_point()+geom_smooth(fill='pink',alpha=0.3)+ 
  labs(title='Number of accidents', y="Accidentes density", x='Day')
  

#18.Assign the code from the chart to an object named g like this

g <-ggplot(data = daily, aes (x=day, y=accidents, col=limit))+ 
  geom_point()+geom_smooth(fill='pink',alpha=0.3)+ 
  labs(title='Number of accidents', y="Accidentes density", x='Day')


#19.Now run the following:
  
  library(plotly)
ggplotly(g)

#20.Having now examined the data visually, if you were the president of Sweden, would you have a speed limit or not
yes. 

