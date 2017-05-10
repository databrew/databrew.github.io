# SECTION 1
library(knitr)
library(rmarkdown)
library(gsheet)
library(plotly)
install.packages('plotly')
library(plotly)

# SECTION 3
library(cism)
library(databrew)
library(dplyr)
cats <- MASS::cats
# object x
x <- cats %>% group_by(Sex) %>% 
  summarise(Hwt= mean(Hwt))
# Males have a greater average weight
# Filter by bwt< 3.8
cats <- cats %>% filter(Bwt<3.8 )
# cats new variable, assuming that hwt is expressed in g and bwt in kg
cats<- cats %>% mutate(hb= (Hwt/1000)/(Bwt))
# object x
x <- cats %>% 
  group_by(Sex) %>% 
  summarise(hb= mean(hb))
# females have a greater hb ratio

# SECTION 4
library(ggplot2)
library(ggthemes)
library(MASS)
Traffic <- MASS:: Traffic
?Traffic
# ggplot
ggplot(data = Traffic, 
       aes(x=y))+ 
  geom_histogram()
# density chart
ggplot(data = Traffic, 
       aes(x=y)) + 
  geom_density()
# density chart prettier
ggplot(data = Traffic,
       aes(x=y)) + 
  geom_density(alpha=0.5, 
               fill='red', 
               color='blue') +
  labs(title='Number traffic accident', 
       y='Density',
       x='Number of traffic accident')
# fill
ggplot(data = Traffic, 
       aes(x=y, fill=limit)) +
  geom_density(alpha=0.5) +
  labs(title='Number traffic accident', 
       y='Density', 
       x='Number of traffic accident')+ 
  facet_wrap(~limit)
# no
# plot geom_jitter
ggplot(data = Traffic, 
       aes(x=limit, y=y))+ 
  geom_jitter()
# boxplot
ggplot(data = Traffic,
       aes(x=limit, y=y))+ 
  geom_jitter()+ 
  geom_boxplot(alpha=0.5)
# violin_chart
ggplot(data = Traffic, 
       aes(x=limit, y=y))+ 
  geom_jitter()+ 
  geom_violin(alpha=0.5)
# beautiful
ggplot(data = Traffic, 
       aes(x=limit, y=y))+ 
  geom_jitter()+ 
  geom_violin(alpha=0.5)+ 
  theme_cism()+ 
  labs(title='Accidents according limit speed',
       x='limit', 
       y='Number of traffic accident')
# facet_wrap
ggplot(data = Traffic, 
       aes(x=limit, y=y))+ 
  geom_jitter()+ 
  geom_violin(alpha=0.5)+ 
  theme_cism()+ 
  labs(title='Accidents according limit speed',
       x='limit',
       y='Number of traffic accident')+ 
  facet_wrap(~year)
# daily
daily <- Traffic %>% 
  group_by(day, limit)%>% 
  summarise(accidents=mean(y))
# plot
ggplot(data = daily, 
       aes(x=day, y=accidents, col=limit))+ 
  geom_point()
# geom_smooth
ggplot(data = daily, 
       aes(x=day, y=accidents, col=limit))+ 
  geom_point()+ 
  geom_smooth()
# beautiful
ggplot(data = daily, 
       aes(x=day, y=accidents, col=limit))+ 
  geom_point()+ 
  geom_smooth()+
  labs(title='Accidents according limit speed per day', 
       x='day of year', 
       y='number of accidents')
# object g
g<-ggplot(data = daily, 
          aes(x=day, y=accidents, col=limit))+ 
  geom_point()+ 
  geom_smooth()+
  labs(title='Accidents according limit speed per day', 
       x='day of year', 
       y='number of accidents')
library(plotly)
ggplotly(g)
# I would not have any speed limit because there is no association between speed limit and reduction of accidents