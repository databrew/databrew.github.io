#section 1
remove.packages('databrew')
devtools::install_github('databrew/databrew')
library(databrew)
library(ggmap)
library(wordcloud)
library(wordcloud2)
library(gapminder) 
library(googleVis)
#Section 1: Practice with survey data
#Section 1a. Review
library(gsheet)
library(dplyr)
library(ggplot2)
library(cism)
library(ggmap)
library(wordcloud2)
library(ggthemes)
library(readr)
#Use the following code to download the survey data from the survey we took in class the other day.
#(You???ll need an internet connection for the first time you run this.)

if(!'survey.csv' %in% dir()){
  survey <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1kCpmpVqD4tzkdGgyLQGVqeZG1sJoe2FwFJIxtDRsrb0/edit?usp=sharing')
  write_csv(survey, 'survey.csv')
} else {
  survey <- read_csv('survey.csv')
}
#Use table to see how many people prefer money or sex. Write the anwer in a comment (ie, after a #).#
View(survey)
table(survey$money_or_sex)
# Money   Sex 
#  9    10
#Use nrow to see how many people took the survey. Write the answer in a comment.
nrow(survey)
#[1] 19
#Make a histogram of the age of the survey participants, using ggplot.
ggplot()
ggplot(data=survey, aes(age))+geom_histogram()
#Make a barplot of the sex of the survey participants, using ggplot.
ggplot(data=survey, aes(sex))+geom_bar()
#Make a density chart of the happiness of the survey participants, using ggplot.
ggplot(data=survey,aes(happiness))+geom_density()
#Use the same code as number 7 (density chart of happiness), but facet it by sex.
ggplot(data=survey,aes(happiness))+geom_density()+facet_wrap(~sex)
#se the same code as number 7 (density chart of happiness), but make the fill of the density chart show whether or not the person is in love.
ggplot(data=survey,aes(happiness, fill = in_love))+geom_density()+facet_wrap(~sex)
#Use the same code as number 10, but make give it a title, subtitle, an x label and alpha.
ggplot(data=survey,aes(happiness, fill = in_love,alpha =0.2))+geom_density()+facet_wrap(~sex)+labs(title=' people in love and happy ', subtitle= 'love and happiness')
#Section 1b. Spatial stuff
places_of_birth <- geocode(survey$where_born,
                           output = 'latlon',
                           source = 'google',
                           messaging = TRUE)

#Now you have an object called places_of_birth. Take a look at it by running head(places_of_birth). What are the column names?
head(places_of_birth)
#The word ???bind??? means ???put together???. We want to ???bind??? the columns of places_of_birth with our survey data. We can use the cbind function (???column bind???) to do this. Run the following code:
  survey <- cbind(survey, places_of_birth)
#Now run head(survey). Do you have two new columns in the dataframe? What are their names?
  head(survey)

  #Use ggplot to make a map of the world by running the following code.
world <- borders("world", colour="gray50", fill="gray50")# create a layer of borders
ggplot() + world
#Now use the same code from number 5, but add a layer of points from the survey
world <- borders("world", colour="gray50", fill="gray50")
ggplot() + world
ggplot(data = survey, aes(x=lon, y=lat)) + world
                                                              
#Now use the same code as number 6, but make the size of those points show the age of the people.
ggplot(data = survey, aes(x=lon, y=lat, size=age)) + world 

#Now use the same code as number 7, but make the color of the points show the sex of the people.
ggplot(data = survey, aes(x=lon, y=lat, color=)) + world

#faz size=age and col=sex

ggplot()+
  geom_polygon(data=moz0_fortified, aes(x=long, y=lat, group=group),
               color='blue') +
  geom_label(data=us, aes(x=longitude, y=latitude, label=name),
             alpha=0.2, size=0.1)

ggplot(data = df,
       aes(x = Cost,
           y = Total,
           color = Rep,
           pch = Item)) +
  geom_point() +
  theme_cism()

#Now use the same code as number 8, but add a theme (for example theme_cism() or theme_economist()).

#Now use the same code as number 10, but make the points a little bit transparent, add a title, a subtitle, and x / y labels.


#Section 1c. Analyzing free text

# Create an object called "words" which has how many times each
# word was used
words <- prepare_for_word_cloud(survey$describe_cism)
#Take a look at the words object using head. What are the names of the columns?
head(words)
#word freq
#Which word was used the most
hist(words$freq)xxxxxxxxxxxxx
#Run the following code to make a wordcloud.
# Make the wordcloud of the object
wordcloud2(data = words, size = 0.3, shape = 'circle')

#That???s cool, right? But a bit hard to analyze. Let???s use the score_sentiment function classify each the emotion of each person???s description of the the CISM. Create a variable called cism_sentiment in the survey dataframe. Use score_sentiment on the describe_cism variable to fill this new cism_sentiment variable.
survey$cism_sentiment <- score_sentiment(survey$describe_cism)


#(The score_sentiment function produces a score from -5 to 5. -5 is very negative, 5 is very positive, 0 is neutral.)

#Make a density chart (using ggplot) of the new cism_sentiment variable.
ggplot(data = survey, aes(cism_sentiment))+geom_density()
#Based on your plot, do people feel more negative or more positive towards the CISM?
#more positive
#Use score_sentiment to create a variable in survey called self_sentiment. For this variable, get the sentiment score of the describe_self.
survey$self_sentiment <- score_sentiment(survey$describe_self)
#Make a density chart of the new self_sentiment variable.
ggplot(data = survey, aes(self_sentiment))+geom_density()
#Based on your plot, do people feel more negative or more positive about themselves?
#More people
#Make a scatterplot with age on the x-axis and cism_sentiment on the y-axis.
ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) 


#Add geom_smooth(method = 'lm') to the above scatterplot to put a line of best fit onto it.
ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point()+geom_smooth(method = 'lm')
#Based on the above plot, do people feel more positive or less positive about the CISM as they get older?

# they fell negative
#Section 2: Rmarkdown practice
# will submit soon
