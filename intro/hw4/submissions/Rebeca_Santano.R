#Section 1

library(knitr)
library(rmarkdown)
library(gsheet)
library(plotly)

#Section 2

#Good example. Fig 2.
#It is a good example because it contains a lot of information that you can get with a quick look.
#The colors are easy to distinguish and it calls your attention. It does not look boring.

#Bad example.Fig 1.http://journals.plos.org/plosntds/article?id=10.1371/journal.pntd.0003861
#It is a bad example because the use of colors in a gradient makes it very difficult to tell them appart.

#Section 3

#1
library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats
#2
x <- cats %>%
  group_by(Sex) %>%
  summarise(average_bwt= mean(Bwt))
#3 = males
#4
cats <- cats %>%
  filter(Bwt < 3.8)
#5
cats <- cats %>%
  mutate (hb= Hwt/Bwt)
#6
x <- cats %>%
  group_by(Sex) %>%
  summarise(average_hb= mean(hb))
#7 = females

#Section 4
library(ggplot2)
library(ggthemes)
library(MASS)

#1
traffic <- MASS::Traffic
#2
?Traffic
#3 year= 1961 or 1962. 
# day= of the year.
#limit= was there a speed limit? 
#y= traffic accident count for that day.
#4
ggplot(data = Traffic, aes(x= y))+
  geom_histogram()
#5
ggplot(data = Traffic, aes(x= y))+
  geom_density()
#6
ggplot(data = Traffic, aes(x= y))+
  geom_density(fill= "pink", alpha= 0.5, color= "magenta") + 
  labs(title="Which is the most common number of accidents per day?", 
                         x= "Number of traffic accidents in one day",
                         y= "Density of days")
#7
ggplot(data = Traffic, aes(x= y))+
  geom_density(fill= "pink", alpha= 0.5, color= "magenta") + 
  labs(title="Which is the most common number of daily accidents?", 
       x= "Number of daily traffic accidents",
       y= "Density of days") + 
  facet_wrap(~limit)
#8 Yes, the speed limit reduced the number of daily accidents.
#9
ggplot(data = Traffic, aes(x= limit, y= y)) +
  geom_jitter()
#10
ggplot(data = Traffic, aes(x= limit, y= y)) +
  geom_jitter()+
  geom_boxplot(alpha= 0.5)
#11 and 12
ggplot(data = Traffic, aes(x= limit, y= y)) +
  geom_jitter()+
  geom_violin(alpha= 0.5)+
  labs(title= "Does having a speed limit influence the number of daily accidents?",
       x= "Speed limit", y= "Number of dayly accidents") +
  theme_fivethirtyeight()
#13
ggplot(data = Traffic, aes(x= limit, y= y)) +
  geom_jitter()+
  geom_violin(alpha= 0.5)+
  labs(title= "Does having a speed limit influence the number of daily accidents?",
       x= "Speed limit", y= "Number of dayly accidents") +
  theme_fivethirtyeight()+
  facet_wrap(~year)
#14
daily <- traffic %>%
  group_by(day,limit) %>%
  summarise(accidents= mean(y))
#15
ggplot(data = daily, aes(x= day, y= accidents, color= limit))+
  geom_point()
#16 and 17
ggplot(data = daily, aes(x= day, y= accidents, color= limit))+
  geom_point()+
  geom_smooth()+
  theme_economist()+
  labs(x= "Day of the year", y="Number of accidents")
#18
g <- ggplot(data = daily, aes(x= day, y= accidents, color= limit))+
  geom_point()+
  geom_smooth()+
  theme_economist()+
  labs(x= "Day of the year", y="Number of accidents")
#19
library(plotly)
ggplotly(g)
#20 Yes, I would. The trend lines show that there the number of accidents 
# are higher if there is no speed limit. 
