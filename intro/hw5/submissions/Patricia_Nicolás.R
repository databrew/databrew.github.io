# SECTION 1
# SECTION 1a
library(gsheet)
library(dplyr)
library(ggplot2)
library(cism)
library(ggmap)
library(wordcloud2)
library(ggthemes)
library(readr)
library(databrew)
# download survey
if(!'survey.csv' %in% dir()){
  survey <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1kCpmpVqD4tzkdGgyLQGVqeZG1sJoe2FwFJIxtDRsrb0/edit?usp=sharing')
  write_csv(survey, 'survey.csv')
} else {
  survey <- read_csv('survey.csv')
}
# table money_or_sex, 9 people prefer money and 10 sex
table(survey$money_or_sex)
# nrow, 19 people have done the survey
nrow(survey)
# histogram
ggplot(data = survey, 
       aes(age))+ 
  geom_histogram(binwidth = 3)
# barplot
ggplot(data = survey, 
       aes(sex))+ 
  geom_bar()
# density chart
ggplot(data = survey, 
       aes(happiness)) +
  geom_density()
# facet by sex
ggplot(data = survey, 
       aes(happiness)) +
  geom_density()+ 
  facet_wrap(~sex)
# fill in_love
ggplot(data = survey,
       aes(happiness, 
           fill=(in_love))) +
  geom_density()+ 
  facet_wrap(~sex)
# beautiful
ggplot(data = survey, 
       aes(happiness, 
           fill=(in_love))) +
  geom_density(alpha=0.5)+ 
  facet_wrap(~sex)+
  labs(title='Being in love means happiness?', 
       subtitle='Happiness according if the people are in love and sex', 
       x='scale of happiness')
# SECTION 1b
# geocoding
places_of_birth <- geocode(survey$where_born,
                           output = 'latlon',
                           source = 'google',
                           messaging = TRUE)
# head(places_of_birth), the columns name are longitude and latitude
head(places_of_birth)
# cbind
survey <- cbind(survey, places_of_birth)
# head(survey), yes there are two more columns named latitude and longitude
head(survey)
# ggplot
world <- borders("world", colour="gray50", fill="gray50")
ggplot() + world
# points
ggplot(data = survey, 
       aes(x=lon, y=lat)) +
  world+ 
  geom_point()
# age
ggplot(data = survey, 
       aes(x=lon, y=lat, size=age, color = age)) +
  world+ 
  geom_point(alpha=0.6)
# sex 
ggplot(data = survey, 
       aes(x=lon, y=lat, color = sex)) +
  world+ 
  geom_point()
# theme
ggplot(data = survey, 
       aes(x=lon, y=lat, color = sex)) +
  world+ 
  geom_point()+
  theme_light()
# beautiful
ggplot(data = survey, 
       aes(x=lon, y=lat, color = sex)) +
  world+ 
  geom_point(alpha=0.5)+
  theme_light()+ 
  labs(title='Where did the people born?', subtitle='Borned location and sex', x='longitude', y='latitude')
# SECTION 1c
# words
words <- prepare_for_word_cloud(survey$describe_cism)
# head, the names of the columns are word and freq
head(words)
# the most common word is 'good'
# wordcloud
wordcloud2(data = words, size = 0.3, shape = 'circle')
# score_sentiment
survey<- survey %>%
  mutate(cism_sentiment=score_sentiment(describe_cism))
# density chart
ggplot(data = survey, 
       aes(x=cism_sentiment))+ 
  geom_density()
# In CISM the people are more positive than negative
# self_sentiment
survey<- survey %>%
  mutate(self_sentiment=score_sentiment(describe_self))
# density chart
ggplot(data = survey,
       aes(x=self_sentiment))+ 
  geom_density()
# more people feel positive
# scatterplot
ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point()
# geom_smooth
ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point()+
  geom_smooth(method = 'lm')
# As they are older they feel more negative