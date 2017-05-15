#Homework 5 (Still indented... sorry)
#Beatriz Galatas 

#Section 0 : Installations 
remove.packages('databrew')
devtools::install_github('databrew/databrew')
library(databrew)
library(ggmap)
library(wordcloud)
library(wordcloud2) 
library(gapminder)
library(googleVis)

#Section 1: Practice with survey data 
  #Section 1: Review 

  #1. Prepare your workspace by loading the following packages
  library(gsheet)
  library(dplyr)
  library(ggplot2)
  library(cism)
  library(ggmap)
  library(wordcloud2)
  library(ggthemes)
  library(readr)

  #2. Use the following code to download the survey data from the survey we took in class the other day.
  if(!'survey.csv' %in% dir()){
    survey <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1kCpmpVqD4tzkdGgyLQGVqeZG1sJoe2FwFJIxtDRsrb0/edit?usp=sharing')
    write_csv(survey, 'survey.csv')
  } else {
    survey <- read_csv('survey.csv')
  }

  #3. Use table to see how many people prefer money or sex. Write the anwer in a comment (ie, after a #).
  table(survey$money_or_sex)
    #money (8) , sex(14)
  #4. Use nrow to see how many people took the survey. Write the answer in a comment.
  nrow(survey)
    #22
  #5. Make a histogram of the age of the survey participants, using ggplot.
  ggplot() + 
    geom_histogram(data=survey, 
                   aes(age), 
                   fill="orange") + 
    labs(title="Age distribution of R Survey", 
         y="Frequency", 
         x="Age") + 
    theme_cism()
  #6. Make a barplot of the sex of the survey participants, using ggplot.
  ggplot() + 
    geom_bar(data=survey, 
             aes(sex)) + 
    labs(title="Gender distribution of R Survey", 
         y="Frequency", 
         x="Gender") + 
    theme_cism()
  #7. Make a density chart of the happiness of the survey participants, using ggplot.
  ggplot() + 
    geom_density(data=survey, 
                 aes(happiness), 
                 fill="lightblue", 
                 color="darkblue") + 
    labs(y="density", 
         x="Happiness Index") + 
    theme_fivethirtyeight()
  #8. Use the same code as number 7 (density chart of happiness), but facet it by sex.
  ggplot(data=survey) + 
    geom_density(aes(happiness), 
                 fill="lightblue", 
                 color="darkblue") + 
    facet_wrap(~sex)
    labs(y="density", 
         x="Happiness Index") + 
    theme_fivethirtyeight()
  #9. Use the same code as number 7 (density chart of happiness), but make the fill of the density chart show whether or not the person is in love.
  ggplot(data=survey) + 
    geom_density(aes(x=happiness, 
                      fill=in_love), 
                  alpha=0.4) + 
    labs(y="density", 
          x="Happiness Index") 
  #10. Use the same code as number 10, but make give it a title, subtitle, an x label and alpha.
  ggplot(data=survey) + 
    geom_density(aes(x=happiness, 
                     fill=in_love), 
                 alpha=0.4) + 
    labs(title="Happiness Index by Love reporting", 
         y="density", 
         x="Happiness Index") 
  
#Section 1b: Spatial Stuff 
  
places_of_birth <- geocode(survey$where_born,
                             output = 'latlon',
                             source = 'google',
                             messaging = TRUE)
  #Merging data 
  survey <- cbind(survey, places_of_birth)  
  head(survey)
  
  #5. Use ggplot to make a map of the world by running the following code.
  world <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
  ggplot() + world
  #6. Now use the same code from number 5, but add a layer of points from the survey.
  world <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
  ggplot() + 
    world +  
    geom_point(data=survey, 
               aes(x=lon, 
                   y=lat))
  #7. Now use the same code as number 6, but make the size of those points show the age of the people.
  world <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
  ggplot() + 
    world +  
    geom_point(data=survey, 
               aes(x=lon, 
                   y=lat, 
                   size=age))
  #8. Now use the same code as number 7, but make the color of the points show the sex of the people.
  world <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
  ggplot() + 
    world +  
    geom_point(data=survey, 
               aes(x=lon, 
                   y=lat, 
                   size=age, 
                   color=sex))
  #9. Now use the same code as number 8, but add a theme (for example theme_cism() or theme_economist()).
  world <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
  ggplot() + 
    world +  
    geom_point(data=survey, 
               aes(x=lon, 
                   y=lat, 
                   size=age, 
                   color=sex)) + 
    theme_economist()
  #10. Now use the same code as number 10, but make the points a little bit transparent, add a title, a subtitle, and x / y labels.
  world <- borders("world", colour="gray50", fill="gray50") # create a layer of borders
  ggplot() + 
    world +  
    geom_point(data=survey, 
               aes(x=lon, 
                   y=lat, 
                   size=age, 
                   color=sex), 
               alpha=0.7) + 
    labs(title="Place of Birth of R Survey Participants", 
         y="Latitude", 
         x="Longitude") +
    theme_economist()

#Section 1c: Analyzing free text 
  #1. Make an object called words. This is going to be how many times each word was used in the describe_cism question of the survey. You can run the below code to do this.
    # Create an object called "words" which has how many times each
    # word was used
    words <- prepare_for_word_cloud(survey$describe_cism)
  #2. Take a look at the words object using head. What are the names of the columns?
  words
  #3. Which word was used the most?
    #good 
  #4. Run the following code to make a wordcloud
    # Make the wordcloud of the object
    wordcloud2(data = words, size = 0.3, shape = 'circle')
  #5. That’s cool, right? But a bit hard to analyze. Let’s use the score_sentiment function classify each the emotion of each person’s description of the the CISM. 
    #Create a variable called cism_sentiment in the survey dataframe. 
    #Use  score_sentiment on the describe_cism variable to fill this new cism_sentiment variable.
  #(The score_sentiment function produces a score from -5 to 5. -5 is very negative, 5 is very positive, 0 is neutral.)
  words$score <- score_sentiment(words$word)
  #6. Make a density chart (using ggplot) of the new cism_sentiment variable.
  ggplot(data=words, 
         aes(score)) + 
    geom_density(fill="blue")
  #7. Based on your plot, do people feel more negative or more positive towards the CISM?
    #more positive
  #8. Use score_sentiment to create a variable in survey called self_sentiment. For this variable, get the sentiment score of the describe_self.
  survey$score <- score_sentiment(survey$describe_self)
  #9. Make a density chart of the new self_sentiment variable.
  ggplot(data=survey, 
         aes(score)) + 
    geom_density(fill="blue")
  #10. Based on your plot, do people feel more negative or more positive about themselves?
    #more positive 
  #11. Make a scatterplot with age on the x-axis and cism_sentiment on the y-axis.
  survey$cism_sentiment <- score_sentiment(survey$describe_cism)
  ggplot(data = survey,
         aes(x = age,
             y = cism_sentiment)) +
    geom_point()
  #12. Add geom_smooth(method = 'lm') to the above scatterplot to put a line of best fit onto it.
  survey$cism_sentiment <- score_sentiment(survey$describe_cism)
  ggplot(data = survey,
         aes(x = age,
             y = cism_sentiment)) +
    geom_point() + 
    geom_smooth()
  #13. Based on the above plot, do people feel more positive or less positive about the CISM as they get older?
    #As people grow older, they feel worse about CISM 
  









