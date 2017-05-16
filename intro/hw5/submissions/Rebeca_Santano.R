# Section 1.

#Section 1a.

#1
library(gsheet)
library(dplyr)
library(ggplot2)
library(cism)
library(ggmap)
library(wordcloud2)
library(ggthemes)
library(readr)
library(databrew)

#2
if(!'survey.csv' %in% dir()){
  survey <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1kCpmpVqD4tzkdGgyLQGVqeZG1sJoe2FwFJIxtDRsrb0/edit?usp=sharing')
  write_csv(survey, 'survey.csv')
} else {
  survey <- read_csv('survey.csv')
}

#3 -> Money: 9 people. Sex: 10 people.
table(survey$money_or_sex)

#4 -> 19 people
nrow(survey)

#5
ggplot()+
  geom_histogram(data= survey,
                 aes(x= age))
#6
ggplot()+
  geom_bar(data= survey, 
           aes(x= sex))
#7
ggplot()+
  geom_density(data= survey,
               aes(x= happiness))
#8
ggplot()+
  geom_density(data= survey,
               aes(x= happiness))+
  facet_wrap(~sex)
#9
ggplot()+
  geom_density(data= survey,
               aes(x= happiness,
                   fill= in_love))
#10
ggplot()+
  geom_density(data= survey,
               aes(x= happiness,
                   fill= in_love),
               alpha= 0.3) +
  labs(title= "Are people in love happier?",
       subtitle= "Love is all you need!")

#Section 1b.

#1
# Create an object for places of birth
places_of_birth <- geocode(survey$where_born,
                           output = 'latlon',
                           source = 'google',
                           messaging = TRUE)
#2 -> lon, lat
head(places_of_birth)

#3 
survey <- cbind(survey, places_of_birth)

#4 -> lon, lat
head(survey)

#5
world <- borders("world", colour="gray50", fill="gray50") 
# create a layer of borders
ggplot() + world

#6
world <- borders("world", colour="gray50", fill="gray50") 
ggplot() + world +
  geom_point(data= survey,
             aes(x= lon,
                 y= lat))
#7
world <- borders("world", colour="gray50", fill="gray50") 
ggplot() + world +
  geom_point(data= survey,
             aes(x= lon,
                 y= lat, 
                 size= age))
#8
world <- borders("world", colour="gray50", fill="gray50") 
ggplot() + world +
  geom_point(data= survey,
             aes(x= lon,
                 y= lat, 
                 size= age, 
                 color= sex))
#9
world <- borders("world", colour="gray50", fill="gray50") 
ggplot() + world +
  geom_point(data= survey,
             aes(x= lon,
                 y= lat, 
                 size= age, 
                 color= sex))+
  theme_cism()
#10
world <- borders("world", colour="gray50", fill="gray50") 
ggplot() + world +
  geom_point(data= survey,
             aes(x= lon,
                 y= lat, 
                 size= age, 
                 color= sex),
             alpha= 0.5)+
  theme_cism() +
  labs(title= "Where do the students come from?",
       subtitle= "From Spain only girls!",
       x= "Longitude", 
       y= "Latitude")

#Section 1c.

#1
words <- prepare_for_word_cloud(survey$describe_cism)

#2 -> word, freq
head(words)

#3 -> good

#4
wordcloud2(data = words, size = 0.3, shape = 'circle')

#5
survey <- survey %>%
  mutate (cism_sentiment= score_sentiment(describe_cism))

#6
ggplot()+
  geom_density(data= survey,
               aes(x= cism_sentiment))
#7 In general, more people feel either neutral or positive about cism rather than negative.

#8
survey <- survey %>%
  mutate (self_sentiment= score_sentiment(describe_self))

#9
ggplot()+
  geom_density(data= survey,
               aes(x= self_sentiment))

#10 People feel more neutral or positive about themselves.

#11 
ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point()

#12
ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point() +
  geom_smooth(method = "lm")

#13 As people get older they tend to feel more negative about CISM.