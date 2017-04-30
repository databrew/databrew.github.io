#Section 1: Installation
#Checking the packages
library(knitr)
library(rmarkdown)
library(gsheet)

#Installing the packages
library(devtools)

install_github("ropensci/plotly")

library(plotly)


#Section 2: Getting inspired: COME BACK TO IT AT THE END OF HW4

#Section3: Reviewing dplyr
#1: Loading tha packages and getting data about cats
library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats

#Creating x
x <- cats %>%
  group_by(Sex) %>%
  summarise(avg_bwt = mean(Bwt))

#3: Males have a greater body weight.

#4: Filtering cats
cats <- cats %>%
  filter(Bwt <= 3.8)

#5: Creating hb
cats <- cats %>%
  mutate(hb = Hwt/Bwt)

#6: Creating x to show the average hb for each sex
x <- cats %>%
  group_by(Sex)%>%
  summarise(avg_hb = mean(hb))

#7: Females have the greater heart to body weight ratio

#Section 4: Data visualization
library(ggplot2)
library(ggthemes)
library(MASS)

#1: Loading data on traffic accidents
traffic <- MASS:: Traffic

#2: Getting info on the Traffic data
?Traffic

#3: The year variable indicates in which year did a specific condition (speed limit vs no speed limit) was being tested on that day.
# The day indicates in what specific day in both years was there a speed limit or not
#The limit variable simply indicates when there was and there was not a speed limit
#The Y variable indicates the number of accidents that occured on each and every day, without any relation with the speed limit

#4: making a histogram of y
ggplot(data= traffic,
       aes(x = y))+
  geom_histogram()

#5: Making a density chart of y
ggplot(data= traffic,
       aes(x = y))+
  geom_density()

#6: Adding transparency, changing the fill color, adding labs to the same plot
ggplot(data= traffic,
       aes(x = y))+
  geom_density(fill="blue", 
               col= "gold",
               alpha=0.6)+
  labs(title="Accidents in Sweden",
       x = "Days",
       y = "")

#7: Same plot, but the fill is different for whether or not there was a speed limit that day
ggplot(data= traffic,
       aes(x = y, fill= limit))+
  geom_density(alpha=0.5)+
  labs(title="Accidents in Sweden",
       x = "Days",
       y = "Density?")+
  theme_economist()

#8: Yes it reduced, but it looks like there a tendency to an increase in the number of accidents in a specific time of the year.

#9: Create a new plot. This will have limit on the x axis and y on the y axis. Make it a jittered point chart (hint, use geom_jitter).
ggplot(data=traffic,
       aes(x=limit,
           y= y))+
  geom_jitter()

#10: Adding a boxplot
ggplot(data=traffic,
       aes(x=limit,
           y= y))+
  geom_boxplot(col="black",
               fill="blue",
               alpha=0.5)+
  geom_jitter(col="red",
              alpha = 0.6)

#11: Removing the boxplot and adding a violin chart
ggplot(data=traffic,
       aes(x=limit,
           y= y))+
  geom_violin(col="black",
               fill="blue",
              alpha=0.4)+
  geom_jitter(col="red",
              alpha = 0.6)


#12: Making the plot pretier
ggplot(data=traffic,
       aes(x=limit,
           y= y))+
  geom_violin(col="black",
              fill="blue",
              alpha=0.4)+
  geom_jitter(col="red",
              alpha = 0.6)+
  labs(title="Distribution of accidents with and without Speed Limits",
       subtitle= "Does having a speed limit change the number of daily accidents?",
       x="Speed Limit",
       y="Daily accidents (count)")+
  theme_economist()

#13: Running again with facet_wrap
ggplot(data=traffic,
       aes(x=limit,
           y= y))+
  geom_violin(col="black",
              fill="blue",
              alpha=0.4)+
  geom_jitter(col="red",
              alpha = 0.6)+
  labs(title="Distribution of accidents with and without Speed Limits",
       subtitle= "Does having a speed limit change the number of daily accidents?",
       x="Speed Limit",
       y="Daily accidents (count)")+
  theme_economist()+
  facet_wrap(~year)

#14: Creating daily
library(dplyr)
daily <- traffic %>%
  group_by(day, limit) %>%
  summarise(accidents = mean(y))

#15: Plotting daily with color reflecting whether or not there was a limit &  a layer of points.
ggplot(data=daily,
       aes(x=day,
           y=accidents, 
           color=limit))+
  geom_point()

#16: Adding a smooth line to show the trend 
ggplot(data=daily,
       aes(x=day,
           y=accidents, 
           color=limit))+
  geom_point()+
  geom_smooth()

#17: Making the chart beatiful
ggplot(data=daily,
       aes(x=day,
           y=accidents, 
           color=limit))+
  geom_point()+
  geom_smooth()+
  labs(title="Daily accidents with and without Speed Limits",
       subtitle="Do Speed Limits change the number o daily accidents?",
       x= "Day",
       y= "Number of accidents")+
  theme_gdocs()

#18: Assigning my code to g
g <- ggplot(data=daily,
            aes(x=day,
                y=accidents, 
                color=limit))+
  geom_point()+
  geom_smooth()+
  labs(title="Daily accidents with and without Speed Limits",
       subtitle="Do Speed Limits change the number o daily accidents?",
       x= "Day",
       y= "Number of accidents")+
  theme_gdocs()
#19: Running plotly
library(plotly)
ggplotly(g)

#20: If I were the president of Sweden I would definetely make sure there were speed limits, because, clearly there is a reduction in the number of daily accidents if there are speed limits in place.
