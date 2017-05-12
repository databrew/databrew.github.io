#Section 1: practice with survey data
#Section 1a: review
#1: Loading the packages
library(gsheet)
library(dplyr)
library(ggplot2)
library(cism)
library(ggmap)
library(wordcloud2)
library(ggthemes)
library(readr)
library(databrew)

#2: Getting the survey data
if(!'survey.csv' %in% dir()){
  survey <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1kCpmpVqD4tzkdGgyLQGVqeZG1sJoe2FwFJIxtDRsrb0/edit?usp=sharing')
  write_csv(survey, 'survey.csv')
} else {
  survey <- read_csv('survey.csv')
}

#3: Using table to see how many people prefer money over sex and viceversa
table(survey$money_or_sex)
#10 people think sex is more important to achive happiness, while 9 people think money is the most important thing to be happy

#4: Seeing how many people took the survey
nrow(survey)
#19 people took the survey.

#5: Histogram of ages
ggplot(data=survey,
       aes(x=age))+
  geom_histogram(fill= "blue",
                 col = "gold")+
  theme_dark()+
  labs(title = "Joes class survey: distribution of ages",
       subtitle = "What are the ages in Joes R class?",
       x = "Age (years)",
       y = "Count")

#6: barplot of sex
ggplot(data = survey,
       aes(x = sex))+
  geom_bar(fill = "blue",
           col = "gold")+
  theme_wsj()+
  labs(title = "Joes class survey: sex distribution",
       subtitle = "How many females and males attend to Joes class?")

#7: Density chart of happiness
ggplot(data = survey,
       aes(x = happiness))+
  geom_density(fill = "blue", col = "gold")+
  theme_economist()+
  labs(title= "Happiness in Joes class",
       subtitle = "Are Joes Students happy people?",
       x = "Level of Happiness")

#8: Faceting the happiness chart by sex
ggplot(data = survey,
       aes(x = happiness))+
  geom_density(fill = "blue", col = "gold")+
  theme_update()+
  labs(title= "Happiness in Joes class",
       subtitle = "Are Joes Students happy people?",
       x = "Level of Happiness")+
  facet_wrap(~sex)

#9: the fill must reflect if the person is in love or not
ggplot(data = survey,
       aes(x = happiness,
           fill = in_love))+
  geom_density()+
  theme_update()+
  facet_wrap(~sex)
#So all the males in Joes class are in love??? I wonder why are there some unhappy guys!

#10: Making plot in #9 pretier
ggplot(data = survey, 
       aes(x = happiness,
           fill = in_love))+
  geom_density(alpha = 0.5)+
  theme_update()+
  labs(title= "Happiness in Joes class",
       subtitle = "Are Joes Students happy people? What difference does it make with being in love?",
       x = "Level of Happiness")+
  facet_wrap(~sex)

#Section 1b: Spatial stuff
#1: Geocoding the survey participants' place of birth
places_of_birth <- geocode(survey$where_born,
                           output = 'latlon',
                           source = 'google',
                           messaging = TRUE)

#2: Taking a look at places_of_birth
head(places_of_birth)
#the collumn nameas are lon - longitude and lat - latitude

#3: Binding survey and places of birth
survey <- cbind(survey, places_of_birth)

#4: Taking a look at the new survey
head(survey)
#yes I have the collumns, they are named lon (longitude) and lat (latitude)

#5: Using ggplot to map the world
world <- borders("world", colour="gray50", fill="gray50")

# create a layer of borders
ggplot() + world

#6: Adding a layer of poins from survey
ggplot() + world+
  geom_point(data = survey,
             aes(x= lon,
                 y = lat))

#7: Changing the size of point to reflect the age
ggplot() + world+
  geom_point(data = survey,
             aes(x= lon,
                 y = lat,
                 size = age))
#8: Changing the color to reflect sex
ggplot() + world+
  geom_point(data = survey,
             aes(x= lon,
                 y = lat,
                 size = age, 
                 color = sex))

#9: Adding a theme
ggplot() + world+
  geom_point(data = survey,
             aes(x= lon,
                 y = lat,
                 size = age, 
                 color = sex))+
  theme_fivethirtyeight()+
  coord_map()

#10: Making it pretier by adding alpha & lab titles
ggplot() + world+
  geom_point(data = survey,
             aes(x= lon,
                 y = lat,
                 size = age, 
                 color = sex), 
             alpha = 0.5)+
  theme_cism()+
  labs(title= "Birth places in Joes class",
       subtitle= "Where were Joes students born?",
       x = "Longitude",
       y = "Latitude")

#Section 1c: analyzing free text
#1: Creating words
words <- prepare_for_word_cloud(survey$describe_cism)

#2: taking a look at words
head(words)
#there are 2 variables, word (the word used to describe CISM) and freq (the frequency each word was used)

#3: Which word was used the most
words <- words %>%
  arrange(freq)
#The most used word is good

#4: Making a word cloud
wordcloud2(data = words, size = 0.3, shape = 'circle')

#5: Scoring the sentiment of people regarding CISM
survey$cism_sentiment <- score_sentiment(survey$describe_cism)

#6: Plotting cism_sentiment
ggplot(data = survey,
       aes(x = cism_sentiment))+
  geom_density(fill= "blue",
               col = "gold")
#7: There are more people who think positively about CISM, but we should be worried, because there's a lot of neutral feelings about it too.

#8: Scoring self sentiment
survey$self_sentiment <- score_sentiment(survey$describe_self)

#9: Plotting self_sentiment
ggplot(data = survey,
       aes(x= self_sentiment))+
  geom_density(fill = "blue",
               col = "gold")
#10: Most people feel neutral about them selves, but there are stil some people who have a good self-eestim

#11: Making a scatterplot
ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point()

#12: Adding a smooth line
ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point()+
  geom_smooth(method = 'lm')

#13: With age people feel less positive about CISM
