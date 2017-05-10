## installing nonexistent packages
install.packages('knitr')
install.packages('plotly')

## loading packages
library(knitr)
library(rmarkdown)
library(gsheet)
library(plotly)


## Section 3: Quick review of dplyr
library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats

##2. Create an object called x, which shows the average body weight for each sex. Hint, you’ll need to use %>%, group_by and summa
x <- 
  cats %>%
  group_by(Sex) %>%
  summarise(Bwt = mean(Bwt, rm.na = TRUE))

##3. Which cats have a greater average body weight: males or females?
x
## Males

##4.In cats, use filter to remove really fat cats (those with a Bwt of greater than 3.8 kilograms). (Hint, you’ll need to use cats <- cats %>% ... to do this.)
cats <-
  cats %>%
  filter(Bwt < 3.8 )

##5.In cats, use mutate to create a new variable called hb. This will be the heart weight divided by the body weight. (Hint, you’ll need to use cats <- cats %>% ... to do this.)
cats <-
  cats %>%
  mutate(hb = Hwt/Bwt)


##6.Create an object called x which shows the average hb for each sex
x <- 
  cats %>%
  group_by(Sex)%>%
  summarise(hb = mean(hb, rm.na = TRUE))

##7.Which cats have a greater average hb (heart to body weight ratio): males or females?
x
##Females

##Section 4: Data visualization
library(ggplot2)
library(ggthemes)
library(MASS)

##1.Get some data on traffic accidents by running the following code.
traffic <- MASS::Traffic
?Traffic


##3.What do the variables mean?
# year 1961 or 1962
# day of year
# limit of there speed
# y traffic accident count for that day

##4.Create a plot using ggplot. This will be of only one variable: y. Add a layer to make it a histogram
ggplot(data = traffic, mapping = aes(x = y))+
  geom_histogram(color='red', fill='green')

##5.Run the same code as above, but instead of a histogram, make a density chart.
ggplot(data = traffic, mapping = aes(x = limit))+
  geom_density(alpha=0.6)

##6.Run the same code as above, but add transparency, change the fill color, add a title, add an x label, and add a y label.
ggplot(data=traffic, aes(x = y)) +
  geom_histogram(alpha=0.5,fill="blue", col = "pink") +
  labs(title = 'Numero de acidentes por velocidade')

##7.Run the same code as above, but make the fill be different for whether or not there was a speed limit that day (ie, the limit variable).
ggplot(data=traffic, aes(x = y, 
                        fill = limit)) +
  geom_histogram(alpha=0.5) +
  labs(title = 'Numero de acidentes por velocidade')

##8.Based on the above chart, did having a speed limit reduce the number of daily traffic accidents?
# yes, having a speed limit reduce the number of accident

##*9.Create a new plot. This will have limit on the x axis and y on the y axis. Make it a jittered point chart (hint, use geom_jitter).
ggplot(data=traffic, 
       aes(x = limit,
           y = y)) +
  geom_jitter(alpha =0.7)
 

##10.Run the same code as above, but add a boxplot to the chart. Make sure it’s semi-transparent, so you can see the points.
ggplot(data=traffic, 
       aes(x = limit,
           y = y)) +
  geom_boxplot(alpha = 0.5)

##11.Run the same code as above, but remove the boxplot and add a transparent violin chart.
ggplot(data=traffic, 
       aes(x = limit,
           y = y)) +
geom_violin(fill="white")

##12.Make the chart more beautiful by adding a theme, title, x label, and y label.
ggplot(data = traffic,
       aes(x = limit,
           y = y,))+
  geom_violin(alpha=0.3,
             size = 0.5)+
  labs(title = 'Numero de acidentes por velocidade')
  theme_fivethirtyeight()
  
##13. Run the same code as above, but use facet_wrap to create separate visualizations for each year
  ggplot(data = traffic,
         aes(x = limit,
             y = y))+
    geom_violin(alpha=0.3,
                size = 0.5)+
        labs(title = 'Numero de acidentes por velocidade') +
    facet_wrap(~year)+
    theme(axis.title=element_text(face="bold.italic",
                                  size="12", color="brown"), legend.position="top") 

##14. Create an object called daily. This will be traffic, then grouped by day and limit, and then summarised to create a variable called accidents which will be the average number of accidents (y) on that day.
  daily <- 
    traffic %>%
    group_by(day, limit) %>%
    summarise(accidents = mean(y))
  
##15. Create a plot of daily with day on the x axis and accidents on the y axis. Make the color be a reflection of whether or not there was a limit. Add a layer of points.
  ggplot(data = daily,
         aes(x = day,
             y = accidents))+
    geom_point(alpha=0.6,
                size = 0.9)+
           theme(axis.title=element_text(face="bold.italic",
                                  size="12", color="brown"), legend.position="top")
  ##16. Run the same code as above, but add geom_smooth() to create smoothed trend lines.
  ggplot(data = daily,
         aes(x = day,
             y = accidents))+
    geom_point(alpha=0.6,
               size = 0.9)+
    geom_smooth(span = 0.8)+
    theme(axis.title=element_text(face="bold.italic",
                                  size="12", color="brown"), legend.position="top")
  
##17. Make the chart beautiful.
  ggplot(data = daily,
         aes(x = day,
             y = accidents))+
    geom_point(alpha=0.6,
               size = 0.9)+
    geom_smooth(method = "lm", formula = y ~ splines::bs(x, 3), se = FALSE)+
    theme(axis.title=element_text(face="bold.italic",
                                  size="12", color="brown"), legend.position="top")

##18. Assign the code from the chart to an object named g like this

g <- ggplot(data = daily,
            aes(x = day,
                y = accidents))+
  geom_point(alpha=0.6,
             size = 0.9)+
  geom_smooth(method = "lm", formula = y ~ splines::bs(x, 3), se = FALSE)+
  theme(axis.title=element_text(face="bold.italic",
                                size="12", color="brown"), legend.position="top")

##19. Now run the following:
library(plotly)
ggplotly(g)

devtools::install_github('hadley/ggplot2')

##20. Having now examined the data visually, if you were the president of Sweden, would you have a speed limit or not? Why?

##If I were President of Sweden I would recommend the speed limit because with the stipulated limit there is a decrease in daily accidents