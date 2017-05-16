# HW5 Ana Fonseca

#SECTION 1 - Review

library (gsheet)
library (dplyr)
library (ggplot2)
library (cism)
library (ggmap)
library (wordcloud2)
library (ggthemes)
library (readr)
library (databrew)

#Download survey data

if(!'survey.csv' %in% dir()){
  survey <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1kCpmpVqD4tzkdGgyLQGVqeZG1sJoe2FwFJIxtDRsrb0/edit?usp=sharing')
  write_csv(survey, 'survey.csv')
} else {
  survey <- read_csv('survey.csv')
}


#1. Use table to see how many people prefer money or sex. Write the anwer in a comment (ie, after a #).

table(survey$money_or_sex)
   # 9 prefer money and 10 prefer sex                          
                                                          
#2. Use nrow to see how many people took the survey. Write the answer in a comment.

nrow(survey)
   #19 took the survey
                                                                                    
#3. Make a histogram of the age of the survey participants, using ggplot.

ggplot (data=survey,
        aes (x=age)) +
  geom_histogram(color="dark blue", fill = "light blue", alpha=1) +
  labs (title ="Age distribution",
        x= "Age",
        y= "Number") +
  theme_dark()

#4. Make a barplot of the sex of the survey participants, using ggplot.

ggplot (data=survey,
        aes (x=sex)) +
  geom_bar (color="dark blue", fill = "light blue", alpha=1) +
  labs (title ="Sex participants",
        x= "sex",
        y= "Number") +
  theme_dark()
                                                                                    
#5. Make a density chart of the happiness of the survey participants, using ggplot.

ggplot (data=survey,
        aes (x=happiness)) +
  geom_density (color="dark blue", fill = "light blue", alpha=1) +
  labs (title ="happiness of participants",
        x= "happiness",
        y= "Number") +
  theme_dark()
                                                                                    
#6. Use the same code as number 7 (density chart of happiness), but facet it by sex.

ggplot (data=survey,
        aes (x=happiness)) +
  geom_density (color="dark blue", fill = "light blue", alpha=1) +
  labs (title ="happiness of participants",
        x= "happiness",
        y= "Number") +
  theme_dark() +
  facet_wrap(~sex)
                                                                                    
#7. Use the same code as number 7 (density chart of happiness), but make the fill of the density chart show whether or not the person is in love.

ggplot (data=survey,
        aes (x=happiness, fill=in_love)) +
  geom_density (color="dark blue", alpha=0.5) +
  labs (title ="happiness of participants",
        x= "happiness",
        y= "Number") +
  theme_dark() +
  facet_wrap(~sex)

#8. Use the same code as number 10, but make give it a title, subtitle, an x label and alpha.
       
  # already performed before

#Section 1b. Spatial stuff

#We have the where_born column which shows where people were born. But it’s difficult to analyze because it’s just words. We want to get the geo-locations of those words. This process is called “geocoding”. Geocode the survey participants’ place of birth by running the following code.
                                                                                    
# 1. Create an object for places of birth
places_of_birth <- geocode(survey$where_born,
                           output = 'latlon',
                           source = 'google',
                           messaging = TRUE)

#2. Now you have an object called places_of_birth. Take a look at it by running head(places_of_birth). What are the column names?

head(places_of_birth)

   ##lon, lat

#3. The word “bind” means “put together”. We want to “bind” the columns of places_of_birth with our survey data. We can use the cbind function (“column bind”) to do this. Run the following code:

survey <- cbind(survey, places_of_birth)

#4. Now run head(survey). Do you have two new columns in the dataframe? What are their names?

head(survey)

   ## lon, lat

#5. Use ggplot to make a map of the world by running the following code.

world <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
ggplot() + world


#6. Now use the same code from number 5, but add a layer of points from the survey.

ggplot() + world +
geom_point(data=survey,
           aes (x=lon,
                y=lat))


#7. Now use the same code as number 6, but make the size of those points show the age of the people.

ggplot() + world +
  geom_point(data=survey,
             aes (x=lon,
                  y=lat,
                  size=age))

#8. Now use the same code as number 7, but make the color of the points show the sex of the people.

ggplot() + world +
  geom_point(data=survey,
             aes (x=lon,
                  y=lat,
                  color=sex))

#9. Now use the same code as number 8, but add a theme (for example theme_cism() or theme_economist()).

ggplot() + world +
  geom_point(data=survey,
             aes (x=lon,
                  y=lat,
                  color=sex))+
  theme_economist()

#10. Now use the same code as number 10, but make the points a little bit transparent, add a title, a subtitle, and x / y labels.

ggplot() + world +
  geom_point (data=survey,
             aes (x=lon,
                  y=lat,
                  color=sex, alpha=0.5)) +
  labs (title ="where are we from?",
        x= "Longitude",
        y= "Latitude") +
  theme_economist()

#Section 1c. Analyzing free text

#1. Make an object called words. This is going to be how many times each word was used in the describe_cism question of the survey. You can run the below code to do this.

words <- prepare_for_word_cloud(survey$describe_cism)

#2. Take a look at the words object using head. What are the names of the columns?

head(words)
  ##word, frequencie

#3. Which word was used the most?
  ##good

#4. Run the following code to make a wordcloud.

wordcloud2(data = words, size = 0.3, shape = 'circle')

#5. That’s cool, right? But a bit hard to analyze. Let’s use the score_sentiment function classify each the emotion of each person’s description of the the CISM. Create a variable called cism_sentiment in the survey dataframe. Use score_sentiment on the describe_cism variable to fill this new cism_sentiment variable.
#(The score_sentiment function produces a score from -5 to 5. -5 is very negative, 5 is very positive, 0 is neutral.)

survey$cism_sentiment<- score_sentiment(survey$describe_cism)

#6. Make a density chart (using ggplot) of the new cism_sentiment variable.

ggplot() +
  geom_density(data=survey,
               aes(x=cism_sentiment), color="blue", fill= "light blue", alpha=0.5) +
  theme_economist()

#7. Based on your plot, do people feel more negative or more positive towards the CISM?
  # a bit more positive that negative

#8. Use score_sentiment to create a variable in survey called self_sentiment. For this variable, get the sentiment score of the describe_self.

survey$self_sentiment <- score_sentiment(survey$describe_self)

#9. Make a density chart of the new self_sentiment variable.

ggplot() +
  geom_density(data=survey,
               aes(x=self_sentiment), color="blue", fill= "light blue", alpha=0.5) +
  theme_economist()


#10. Based on your plot, do people feel more negative or more positive about themselves?

  # people don´t feel!!

#11. Make a scatterplot with age on the x-axis and cism_sentiment on the y-axis.

ggplot() +
  geom_point(data=survey,
               aes(x=age, y= cism_sentiment), color="blue", fill= "light blue", alpha=0.5) +
  theme_economist()

#12. Add geom_smooth(method = 'lm') to the above scatterplot to put a line of best fit onto it.

ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point() +
geom_smooth(method = 'lm')

#13. Based on the above plot, do people feel more positive or less positive about the CISM as they get older?
  ## less positive

#Section 2: Rmarkdown practice



  
  




