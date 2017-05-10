

######### HOMEWORK 4############

# Laura de la Fuente
# 05.05.2017

################################




############  Section 1: Installation

### Installation of miscellaneous packages

library(knitr)
library(rmarkdown)
library(gsheet)
library(plotly)

### Installation of latex for creating pdfs in R. Done!

### Installation of prerequesites for R Markdown. Done!




############# Section 2: Get inspired

# Pending!



############# Section 3: Quick review of dplyr

library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats
  
show(cats)


# 2. Create an object called x, which shows the average body weight for each sex. Hint, you'll need 
# to use %>%, group_by and  summarise.

x <- cats %>%
  group_by(Sex) %>%
  summarise(x = mean(Bwt))
show(x)

# 3. Which cats have a greater average body weight: males or females?
  # Male have a greater average body weight


# 4. In cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). 
# (Hint, you'll need to use  cats <- cats %>% ... to do this.)
cats <- cats %>%
  filter(Bwt<3.8)

# 5. In cats, use mutate to create a new variable called hb. This will be the heart weight 
# divided by the body weight. (Hint, you'll need to use cats <- cats %>% ... to do this.)
cats <- cats %>%
  mutate(hb = Hwt/Bwt)

# 6. Create an object called x which shows the average hb for each sex.
x <- cats %>%
  group_by(Sex) %>%
  summarise(x = mean(hb))

# 7. Which cats have a greater average hb (heart to body weight ratio): males or females?
## Females



############### Section 4: Data visualization


library(ggplot2)
library(ggthemes)
library(MASS)


# 1. Get some data on traffic accidents by running the following code.
traffic <- MASS::Traffic

# 2. Type ?Traffic to get information on the dataset.
?Traffic
head(traffic)

# 3. What do the variables mean?

# year --> 1961 or 1962
# day --> of year
# limit --> was there a speed limit?
# y --> traffic accident count for that day.

# 4. Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a 
# histogram
ggplot(data = traffic,
       aes(x = y)) +
  geom_histogram()

# 5. Run the same code as above, but instead of a histogram, make a density chart.
ggplot(data = traffic,
       aes(x = y)) +
  geom_density() 


# 6. Run the same code as above, but add transparency, change the fill color, add a title, add 
# an x label, and add a y label.
ggplot(data = traffic,
       aes(x = y)) +
  geom_density(fill = 'brown',
               color = NA, 
               alpha = 0.6) +
  theme_fivethirtyeight() +
  labs(title = 'Traffic accident',
       subtitle = 'Count for that day',
       xlab = 'Number of traffic accidents') 

# 7. Run the same code as above, but make the fill be different for whether or not there was a 
# speed limit that day (ie, the  limit variable).

ggplot(data = traffic,
       aes(x = y)) +
  geom_density(fill = 'brown',
               color = NA, 
               alpha = 0.6) +
  theme_fivethirtyeight() +
  labs(title = 'Traffic accident',
       subtitle = 'Count for that day',
       x = 'Number of traffic accidents') +
  facet_wrap(~limit)

# 8. Based on the above chart, did having a speed limit reduce the number of daily traffic 
# accidents?

## Yes

# 9. Create a new plot. This will have limit on the x axis and y on the y axis. Make it a 
# jittered point chart (hint, use  geom_jitter).

ggplot(data = traffic,
       aes(x = limit,
           y = y)) +
  geom_jitter(width = 0.2) +
  theme_fivethirtyeight() +
  labs(title = 'Number of traffic accidents',
       subtitle = 'Depending on the existence of limit speed')

# 10. Run the same code as above, but add a boxplot to the chart. Make sure it's 
# semi-transparent, so you can see the points.

ggplot(data = traffic,
       aes(x = limit,
           y = y)) +
  geom_jitter(width = 0.2) +
  geom_boxplot(alpha =0.4, fill= 'yellow') +
  theme_fivethirtyeight() +
  labs(title = 'Number of traffic accidents',
       subtitle = 'Depending on the existence of limit speed')

# 11. Run the same code as above, but remove the boxplot and add a transparent violin chart.

ggplot(data = traffic,
       aes(x = limit,
           y = y)) +
  geom_jitter(width = 0.2) +
  geom_violin(alpha =0) +
  theme_fivethirtyeight() +
  labs(title = 'Number of traffic accidents',
       subtitle = 'Depending on the existence of limit speed')

# 12. Make the chart more beautiful by adding a theme, title, x label, and y label.

ggplot(data = traffic,
       aes(x = limit,
           y = y)) +
  geom_jitter(width = 0.2) +
  geom_violin(alpha =0) +
  theme_cism() +
  labs(title = 'Number of traffic accidents',
       subtitle = 'Depending on the existence of limit speed',
       x= 'Limit Speed', y= 'numeber of accidets per day')

# 13. Run the same code as above, but use facet_wrap to create separate visualizations for each 
# year.

ggplot(data = traffic,
       aes(x = limit,
           y = y, 
           color = limit)) +
  geom_jitter(width = 0.2) +
  geom_violin(alpha =0.4, fill='light green', color= NA) +
  theme_fivethirtyeight() +
  labs(title = 'Number of traffic accidents',
       subtitle = 'Depending on the existence of limit speed',
       x= 'Limit Speed', y= 'numeber of accidets per day') +
  facet_wrap(~year)

# 14. Create an object called daily. This will be traffic, then grouped by day and limit, and 
#then summarised to create a variable called accidents which will be the average number of 
# accidents (y) on that day.

daily <- traffic %>%
  group_by(day, limit) %>%
  summarise(accidents=mean(y))

# 15. Create a plot of daily with day on the x axis and accidents on the y axis. Make 
# the color be a reflection of whether or not there was a limit. Add a layer of points.
ggplot(data = daily,
       aes(x=day,
           y=accidents, 
           color= limit)) +
  geom_jitter()
  
# 16. Run the same code as above, but add geom_smooth() to create smoothed trend lines.

ggplot(data = daily,
       aes(x=day,
           y=accidents, 
           color= limit)) +
  geom_jitter() +
  geom_smooth()

# 17. Make the chart beautiful.
ggplot(data = daily,
       aes(x=day,
           y=accidents, 
           color= limit)) +
  geom_jitter() +
  geom_smooth() +
  theme_fivethirtyeight() +
  labs(title='Number of accidents per day',
       x = 'Day of the year',
       y = 'Number of accidents')


# 18. Assign the code from the chart to an object named g like this

g <- ggplot(data = daily,
            aes(x=day,
                y=accidents, 
                color= limit)) +
  geom_jitter() +
  geom_smooth() +
  theme_fivethirtyeight() +
  labs(title='Number of accidents per day',
       x = 'Day of the year',
       y = 'Number of accidents')


# 19. Now run the following:
library(plotly)
ggplotly(g)

# 20. Having now examined the data visually, if you were the president of Sweden, would you 
# have a speed limit or not? Why?

### Yeees!!! Because thanks to the speed limit, there are less traffic accidents per day! :)
