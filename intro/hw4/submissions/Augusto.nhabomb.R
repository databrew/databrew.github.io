
library(knitr)
library(rmarkdown)
library(gsheet)


install.packages('mailR')
install.packages('plotly')
library(plotly)

#Run the following code to get some data about cats.
library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats
#Create an object called x, which shows the average body weight for each sex. Hint, you???ll need to use %>%, group_by and summarise.
x<-cats%>%group_by(Sex)%>%summarise(average_Bwt= mean(Bwt))
#Which cats have a greater average body weight: males or females?
plot(x)
#in cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). (Hint, you???ll need to use cats <- cats %>% ... to do this.)
cats<- cats%>%filter(Bwt>="3.8")
#In cats, use mutate to create a new variable called hb. This will be the heart weight divided by the body weight. (Hint, you???ll need to use cats <- cats %>% ... to do this.)
cats<-cats%>%group_by(Hwt)%>%mutate(hb=Hwt/Bwt)
#Create an object called x which shows the average hb for each sex.
x<-cats%>%group_by(Sex)%>%summarise(average_hb=mean(hb))
#Which cats have a greater average hb (heart to body weight ratio): males or females?
cats

#Section 4: Data visualization

library(ggplot2)
library(ggthemes)
library(MASS)


#Get some data on traffic accidents by running the following code.

traffic <- MASS::Traffic
?Traffic
#What do the variables mean?
#year-1961 or 1962.

#day- of year.

#limit -was there a speed limit?

#y - traffic accident count for that day.


#Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a histogram
ggplot()
ggplot(traffic, aes(x=y)) + geom_histogram()

#Run the same code as above, but instead of a histogram, make a density chart.
ggplot(traffic, aes(x=y)) + geom_bar()
#Run the same code as above, but add transparency, change the fill color, add a title, add an x label, and add a y label.

ggplot(traffic, aes(x=y)) + geom_bar(fill='green', alpha=0.5)+labs(title='traffic accident count for that day', x=' days', y='accidents') 

#Run the same code as above, but make the fill be different for whether or not there was a speed limit that day (ie, the limit variable).
ggplot(traffic, aes(x=y)) + geom_bar(fill='green', alpha=0.5)+labs(title='traffic accident count for that day', x=' days', y='accidents') xxxxxxxxxxxxxxx
#Based on the above chart, did having a speed limit reduce the number of daily traffic accidents?

#Create a new plot. This will have limit on the x axis and y on the y axis. Make it a jittered point chart (hint, use geom_jitter)

ggplot(data=traffic, aes(x=limit, y=y))+geom_jitter() 
#Run the same code as above, but add a boxplot to the chart. Make sure it???s semi-transparent, so you can see the points.

ggplot(data=traffic, aes(x=limit, y=y))+geom_jitter()+geom_boxplot (alpha=0.1)

#Run the same code as above, but remove the boxplot and add a transparent violin chart.
ggplot(data=traffic, aes(x=limit, y=y))+geom_jitter()+geom_violin (alpha=0.1)
#Make the chart more beautiful by adding a theme, title, x label, and y label.
ggplot(data=traffic, aes(x=limit, y=y))+geom_jitter()+geom_violin (alpha=0.1)+ labs(title='accidents per speed')+ theme_base()
#Run the same code as above, but use facet_wrap to create separate visualizations for each year

ggplot(data=traffic, aes(x=limit, y=y))+geom_jitter()+geom_violin (alpha=0.1)+ labs(title='accidents per speed')+ theme_base()+facet_wrap(~year)

#Create an object called daily. This will be traffic, then grouped by day and limit, and then summarised to create a variable called accidents which will be the average number of accidents (y) on that day

daily<-traffic%>%group_by(y, limit)%>%summarise(average_accidents=mean(y))

#Create a plot of daily with day on the x axis and accidents on the y axis. Make the color be a reflection of whether or not there was a limit. Add a layer of points.
ggplot(data = daily, aes(x= y , y=average_accidents))+geom_histogram()xxxxxxxxx
#Run the same code as above, but add geom_smooth() to create smoothed trend lines.
ggplot(data = daily, aes(x= y , y=average_accidents))+geom_smooth()xxxxxxxx
#Make the chart beautiful.

#Assign the code from the chart to an object named g like this
g <- your_code_for_making_the_plot
#Now run the following:
  library(plotly)
ggplotly(g)
#Having now examined the data visually, if you were the president of Sweden, would you have a speed limit or not? Why?