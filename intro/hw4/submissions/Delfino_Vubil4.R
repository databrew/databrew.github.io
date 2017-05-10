#install and run packages
library(knitr)
library(rmarkdown)
library(gsheet)
# install.packages('mailR')
# install.packages("plotly")
library(mailR)
library(plotly)

##The key message of the videio is: The importance of good data visualization for better interpretation

#link of good data visualization
#http://journals.plos.org/plosmedicine/article?id=10.1371/journal.pmed.0030353

#Link of bad data visualization
#https://www.ncbi.nlm.nih.gov/pmc/articles/PMC1196455/

#Run the following codes to get some data
library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats

#Create an object called x, which shows the average body weight for each sex. Hint, you'll need to use %>%, group_by and  summarise.
x<-cats%>%group_by(Sex)%>%summarise(average_Bwt= mean(Bwt))

#Which cats have a greater average body weight: males or females?
#R: Males

#In cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). (Hint, you'll need to use  cats <- cats %>% ... to do this.)
cats <- cats %>%filter(cats$Bwt<3.8)

#In cats, use mutate to create a new variable called hb. This will be the heart weight divided by the body weight. (Hint, you'll need to use cats <- cats %>% ... to do this.)
cats<-cats%>%mutate(hb=Hwt/Bwt)

#Create an object called x which shows the average hb for each sex
x<-cats%>%group_by(Sex)%>%summarise(average_hb=mean(hb))

#Which cats have a greater average hb (heart to body weight ratio): males or females?
# R: Females

#Data visualization
library(ggplot2)
library(ggthemes)
library(MASS)

#Get some data on traffic accidents by running the following code
traffic <- MASS::Traffic
??Traffic

#Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a histogram
ggplot(data=Traffic, aes(x=y))+geom_histogram(alpha=0.2)

#Run the same code as above, but instead of a histogram, make a density chart
                                
ggplot(data=Traffic, aes(x=y))+geom_density(alpha=0.2)

#Run the same code as above, but add transparency, change the fill color, add a title, add an x label, and add a y label
ggplot(data=Traffic, aes(x=y))+geom_density(fill='yellow', alpha=0.2)+labs(title='accidents chart')

#Run the same code as above, but make the fill be different for whether or not there was a speed limit that day (ie, the  limit variable).
ggplot(data=Traffic, aes(x=y,fill=limit))+geom_density(alpha=0.2)+labs(titile='speed chart')

#Based on the above chart, did having a speed limit reduce the number of daily traffic accidents?

#Create a new plot. This will have limit on the x axis and y on the y axis. Make it a jittered point chart (hint, use  geom_jitter).
ggplot(data=Traffic, aes(x=limit, y=y))+geom_jitter(alpha=0.3)

#Run the same code as above, but add a boxplot to the chart. Make sure it's semi-transparent, so you can see the points
ggplot(data=Traffic, aes(x=limit, y=y))+geom_boxplot(alpha=0.3)+geom_jitter()
#Run the same code as above, but remove the boxplot and add a transparent violin chart.
ggplot(data=Traffic, aes(x=limit, y=y))+geom_violin(alpha=0.3) +geom_jitter()

#Make the chart more beautiful by adding a theme, title, x label, and y label.
ggplot(data=Traffic, aes(x=limit, y=y))+geom_violin(alpha=0.3)+theme_classic()

#Run the same code as above, but not use facet_wrap to create separate visualizations for each year.
ggplot(data=Traffic, aes(x=limit, y=y))+geom_violin(alpha=0.3)+theme_classic()+facet_wrap(~year)

#Create an object called daily. This will be traffic, then grouped by day and limit, and then summarised to create a variable called accidents which will be the average number of accidents (y) on that day.
daily<-Traffic%>%group_by(day, limit)%>%summarise(accidents=mean(y))

#Create a plot of daily with day on the x axis and accidents on the y axis. Make the color be a reflection of whether or not there was a limit. Add a layer of points.
ggplot(data=daily, aes(x=day, y=accidents, col=limit))+geom_point()

#Run the same code as above, but add geom_smooth() to create smoothed trend lines.
ggplot(data=daily, aes(x=day, y=accidents, col=limit))+geom_smooth()+geom_point()

#Make the chart beautiful.
ggplot(data=daily, aes(x=day, y=accidents, col=limit))+geom_smooth()+geom_point()+theme_economist()

g <- ggplot(data=daily, aes(x=day, y=accidents, col=limit))+geom_smooth()+geom_point()+theme_economist()
g

library(plotly)
ggplotly(g)
