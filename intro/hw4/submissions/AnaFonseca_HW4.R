# HW 4_ Ana Maria Fonseca

# instalation of some pakgs
library(knitr)
library(rmarkdown)
library(gsheet)

# Instal plotly is the onlly that is still not installed
install.packages("plotly")
library(plotly)

#I was not able to instal latex for creating pdfs in R, too heavy for my internet.

#SECCION 2: Get inspired

#1. Watch this video.

#2. Write in a comment in your code the main message of the video.

## We live in an era that is possible to have access and store titanic amounts of data. Like the author mentioned: “Data is the new soil and that soil is fertile”. With that such fertile soil is extremely important the way that the information is extracted out of the data and organized. The information must be organized in a visual way to easily see the patterns and connections that really matter. Info-design can solve info-problems and provide elegant solutions to knowledge compression and quick solutions to several kind of questions. Visualization is a combination of the  “language of the eyes and the mind”. Finally, data visualization need to be done with caution because can change perspectives.

#3. Find and write a link to a chart in an academic publication which you think is a good data visualization. Why do you think it’s good?

#http://worldhappiness.report/wp-content/uploads/sites/2/2017/03/HR17.pdf
#Figure 2.1. These are bar-graphs that show the Population-Weighted Distributions of Happiness, 2014-2016. I think these are good graphs because is easy to interpret and extract information to ask questions.
#The average happiness in the world is around 5/10. Is possible to see that people tend to consider themselves more happy in more developed countries like America, Europe and also Asia.
#Here in Sub-Saharan Africa just a few people consider themselves more than 5/10 happy and the average is around 4/10. So, you are right Joe, to be 4/10 happy here in Mozambique!! But don’t worry in Western Europe you will be much happier!! The mean is 7/10!!!! Have a great return back to Europe!!
  
#4. Find and write a link to a chart in an academic publication which you think is a bad data visualization. Why do you think it’s bad?

#http://www.madeherenow.com/news/post/2017/01/27/britain-moves-up-the-world-manufacturing-league-table

#Figure 2. looks to me that it is an extremely difficult to read graph. This is like a combinations of a lot of pie charts…. So a “nightmare chart”.
#Because when one country pattern (all years) dramatically change (e.g. China) the others also change. So, looking to the graph look like all the countries have a very different measures per year and in reality countries like Canada, Taiwan or Switzerland do not change a lot per year. Additionally is impossible to know percentages or numbers…

#other example:

#http://sitn.hms.harvard.edu/flash/2016/gender-lines-science-transgender-identity/
#Figure 1. This is an interesting visualization of information. However looks to me quite confusing. I am not understanding what exactly mean the size of the bubbles. I assume that small bubbles are individuals that are not one or other category… are something in the middle…well is not a easy to read chart!!



#SECCION 3: Quick review of dplyr

#1. Run the following code to get some data about cats.
library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats

#This data has three variables:
   #Sex: the sex of the cat.
   #Bwt: the body weight of the cat.
   #Hwt: the heart weight of the cat.

#2.Create an object called x, which shows the average body weight for each sex. Hint, you’ll need to use %>%, group_by and summarise.

x<-cats %>%
  group_by(Sex) %>%
  summarise(average_Bwt=mean(Bwt))

#3.Which cats have a greater average body weight: males or females?
   #male

#4. In cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). (Hint, you’ll need to use cats <- cats %>% ... to do this.)
cats<-cats %>%
  filter(Bwt < 3.8)

#5. In cats, use mutate to create a new variable called hb. This will be the heart weight divided by the body weight. (Hint, you’ll need to use cats <- cats %>% ... to do this.)
cats<-cats %>%
  mutate(hb=Hwt/Bwt)

#6. Create an object called x which shows the average hb for each sex.

x<- cats %>%
  group_by(Sex) %>%
  summarise(avg_hb=mean(hb))

#7. Which cats have a greater average hb (heart to body weight ratio): males or females?
     # female

#Section 4: Data visualization
library(ggplot2)
library(ggthemes)
library(MASS)

#Get some data on traffic accidents by running the following code.
traffic <- MASS::Traffic

#Type ?Traffic to get information on the dataset.

?Traffic

#What do the variables mean?
   #year = 1961 or 1962.
   #day of year.
   #limite = was there a speed limit?
   #y = traffic accident count for that day.

#Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a histogram

ggplot(data=traffic,
       aes (x=y)) +
  geom_histogram (color="dark blue", fill = "light blue", alpha=0.5) +
  labs (title= "Accidents distribution",
        subtitle = "Sweden database",
        x= "Accidents",
        y = "count") +
  theme_dark()


#Run the same code as above, but instead of a histogram, make a density chart.

ggplot(data=traffic,
       aes (x=y)) +
  geom_density (color="dark blue", fill = "light blue", alpha=0.5) +
  labs (title= "Accidents distribution",
        subtitle = "Sweden database",
        x= "Accidents",
        y = "count") +
  theme_dark()


#Run the same code as above, but add transparency, change the fill color, add a title, add an x label, and add a y label.

ggplot(data=traffic,
       aes (x=y)) +
  geom_density (color="dark green", fill = "light green", alpha=0.3) +
  labs (title= "Accidents distribution",
        subtitle = "Sweden database",
        x= "Accidents",
        y = "count") +
  theme_cism()

#Run the same code as above, but make the fill be different for whether or not there was a speed limit that day (ie, the limit variable).

ggplot(data=traffic,
       aes (x=y, fill= limit)) +
  geom_density (color = "dark green", alpha=0.3) +
  labs (title= "Accidents distribution",
        subtitle = "Sweden database",
        x= "Accidents",
        y = "count") +
  theme_cism() 

#Based on the above chart, did having a speed limit reduce the number of daily traffic accidents?
   #yes

#Create a new plot. This will have limit on the x axis and y on the y axis. Make it a jittered point chart (hint, use geom_jitter).

ggplot (data=traffic,
       aes (x=limit,
            y=y)) +
  geom_jitter (color="dark green", fill = "light green", alpha=0.5) +
  labs (title= "Accidents distribution by speed limit",
        subtitle = "Sweden database",
        x= "Speed Limit",
        y = "nº accidents") +
  theme_cism()

#Run the same code as above, but add a boxplot to the chart. Make sure it’s semi-transparent, so you can see the points.

ggplot (data=traffic,
        aes (x=limit,
             y=y)) +
  geom_jitter (color="dark green", fill = "light green", alpha=0.5) +
  geom_boxplot (color="dark green", fill = "light green", alpha=0.2) +
  labs (title= "Accidents distribution by speed limit",
        subtitle = "Sweden database",
        x= "Speed Limit",
        y = "nº accidents") +
  theme_cism()

#Run the same code as above, but remove the boxplot and add a transparent violin chart.

ggplot (data=traffic,
        aes (x=limit,
             y=y)) +
  geom_jitter (color="dark green", fill = "light green", alpha=0.5) +
  geom_violin (color="dark green", fill = "light green", alpha=0) +
  labs (title= "Accidents distribution by speed limit",
        subtitle = "Sweden database",
        x= "Speed Limit",
        y = "nº accidents") +
  theme_cism()

#Make the chart more beautiful by adding a theme, title, x label, and y label.

ggplot (data=traffic,
        aes (x=limit,
             y=y)) +
  geom_jitter (color="light blue", fill = "light blue", alpha=1) +
  geom_violin (color="light blue", fill = "light blue", alpha=0.1) +
  labs (title= "Accidents distribution by speed limit",
        subtitle = "Sweden database",
        x= "Speed Limit",
        y = "nº accidents") +
  theme_dark()

#Run the same code as above, but use facet_wrap to create separate visualizations for each year.

ggplot (data=traffic,
        aes (x=limit,
             y=y)) +
  geom_jitter (color="light blue", fill = "light blue", alpha=1) +
  geom_violin (color="light blue", fill = "light blue", alpha=0.1) +
  labs (title= "Accidents distribution by speed limit",
        subtitle = "Sweden database",
        x= "Speed Limit",
        y = "nº accidents") +
  theme_dark() +
  facet_wrap(~year)

#Create an object called daily. This will be traffic, then grouped by day and limit, and then summarised to create a variable called accidents which will be the average number of accidents (y) on that day.

daily<- traffic %>%
  group_by (day, limit) %>%
  summarize(accidents=mean(y))

#Create a plot of daily with day on the x axis and accidents on the y axis. Make the color be a reflection of whether or not there was a limit. Add a layer of points.

ggplot (data=daily,
        aes (x=day,
             y=accidents,
             color=limit)) +
  geom_point (fill = "light blue", alpha=1) +
  labs (title= "Accidents distribution",
        subtitle = "Sweden database",
        x= "day",
        y = "accidents") +
  theme_dark() 


#Run the same code as above, but add geom_smooth() to create smoothed trend lines.
#Make the chart beautiful.

ggplot (data=daily,
        aes (x=day,
             y=accidents,
             color=limit)) +
  geom_point () +
  geom_smooth()+
  labs (title= "Accidents distribution",
        subtitle = "Sweden database",
        x= "day",
        y = "accidents") +
  theme_base() 

#Assign the code from the chart to an object named g like this

g <- ggplot (data=daily,
             aes (x=day,
                  y=accidents,
                  color=limit)) +
  geom_point () +
  geom_smooth()+
  labs (title= "Accidents distribution",
        subtitle = "Sweden database",
        x= "day",
        y = "accidents") +
  theme_base() 

#Now run the following:
library(plotly)
ggplotly(g)

#Having now examined the data visually, if you were the president of Sweden, would you have a speed limit or not? Why?

# yes, the speed limit reduces the number of accidents with any doubt in Sweden!!! 





