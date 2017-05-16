remove.packages('databrew')
devtools::install_github('databrew/databrew')
library(databrew)
install.packages('wordcloud')

if(!'survey.csv' %in% dir()){
  survey <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1kCpmpVqD4tzkdGgyLQGVqeZG1sJoe2FwFJIxtDRsrb0/edit?usp=sharing')
  write_csv(survey, 'survey.csv')
} else {
  survey <- read_csv('survey.csv')
}

##3. Use table to see how many people prefer money or sex.
table(survey$money_or_sex)
# More prefer sex (10sex and 9 money)

##4. Use nrow to see how many people took the survey. 
nrow(survey)

install.packages('databrew')
library(databrew)

##5. Make a histogram of the age of the survey participants, using ggplot.
ggplot(survey, aes(x=age)) +
geom_histogram()

##6. Make a barplot of the sex of the survey participants, using ggplot.
ggplot(survey, aes(x = age)) + 
  geom_bar()

##7. Make a density chart of the happiness of the survey participants, using ggplot.
ggplot(survey, aes(x = happiness)) + 
  geom_density()

##8. Use the same code as number 7 (density chart of happiness), but facet it by sex.
ggplot(survey, aes(x = happiness)) + 
  geom_density() +
  facet_wrap(~sex)

##9. Use the same code as number 7 (density chart of happiness), but make the fill of the density chart show whether or not the person is in love.
ggplot(survey, aes(x = happiness, fill = in_love)) + 
  geom_density() 

##10. Use the same code as number 10, but make give it a title, subtitle, an x label and alpha.
ggplot(survey, aes(x = happiness, fill = in_love)) + 
  geom_density(alpha = 0.6, col = "pink") +
  labs(title = 'Density chart of the happiness', subtitle = 'Participants happiness in love')


##Section 1b. Spatial stuff
## 1. We have the where_born column which shows where people were born. But it's difficult to analyze because it's just words. We want to get the geo-locations of those words. This process is called "geocoding". Geocode the survey participants' place of birth by running the following code.
# Create an object for places of birth
places_of_birth <- geocode(survey$where_born,
                           output = 'latlon',
                           source = 'google',
                           messaging = TRUE)

##2. Now you have an object called places_of_birth. Take a look at it by running head(places_of_birth). What are the column names?
head(places_of_birth)
#lon & lat

##3. The word "bind" means "put together". We want to "bind" the columns of places_of_birth with our survey data. We can use the cbind function ("column bind") to do this. Run the following code:
survey <- cbind(survey, places_of_birth)

##4. Now run head(survey). Do you have two new columns in the dataframe? What are their names?
head(survey)
##lon & lat

##5. Use ggplot to make a map of the world by running the following code.
world <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
ggplot() + world

##6. Now use the same code from number 5, but add a layer of points from the survey.
world <- borders("world", colour="gray50", fill="gray50")  # create a layer of borders
ggplot() + world+
  geom_point(data = survey, aes(x = lon, y = lat))

##7. Now use the same code as number 6, but make the size of those points show the age of the people.
world <- borders("world", colour="gray50", fill="gray50")  # create a layer of borders
ggplot() + world+
  geom_point(data = survey, aes(x = lon, y = lat, size = age)) 

##8. Now use the same code as number 7, but make the color of the points show the sex of the people.
world <- borders("world", colour="gray50", fill="gray50")  # create a layer of borders
ggplot() + world+
  geom_point(data = survey, aes(x = lon, y = lat, size = age, color = sex))

##9. Now use the same code as number 8, but add a theme (for example theme_cism() or theme_economist()).
world <- borders("world", colour="gray50", fill="gray50")  # create a layer of borders
ggplot() + world+
  geom_point(data = survey, aes(x = lon, y = lat, size = age, color = sex)) +
  theme_cism()

##10. Now use the same code as number 10, but make the points a little bit transparent, add a title, a subtitle, and x / y labels.
world <- borders("world", colour="gray50", fill="gray50")  # create a layer of borders
ggplot() + world+
  geom_point(data = survey, aes(x = lon, y = lat, size = age, color = sex), alpha = 0.4) +
  theme_cism() +
  labs(title = "Locais de nascimento", subtitle = "Onde as participantes nasceram?", x = "longitude", y = "latitude")

##Section 1c. Analyzing free text

##1. Make an object called words. This is going to be how many times each word was used in the describe_cism question of the survey. You can run the below code to do this.
# Create an object called "words" which has how many times each
# word was used
words <- prepare_for_word_cloud(survey$describe_cism)

##2. Take a look at the words object using head. What are the names of the columns?
head(words)

##3. Which word was used the most?
words <- words %>%
  arrange(freq)