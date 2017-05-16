remove.packages('databrew')
devtools::install_github('databrew/databrew')
library(databrew)
install.packages(ggmap)
library(ggmap)
install.packages('wordcloud')
library(wordcloud)
install.packages('wordcloud2')
library(wordcloud2)
install.packages('gapminder')
library(gsheet)
library(dplyr)
library (ggplot2)
library(cism)
library(ggmap)
library(wordcloud2)
library(ggthemes)
library(readr)
library(databrew)
if(!'survey.csv' %in% dir()){
  survey <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1kCpmpVqD4tzkdGgyLQGVqeZG1sJoe2FwFJIxtDRsrb0/edit?usp=sharing')
  write_csv(survey, 'survey.csv')
} else {
  survey <- read_csv('survey.csv')
}

#Use table to see how many people prefer money or sex.

table(survey$money_or_sex)
#Money   Sex 
#   9    10

#Use nrow to see how many people took the survey
nrow(survey)
#R: 19  

#Make a histogram of the age of the survey participants, using ggplot
ggplot (data=survey, aes(x=age))+geom_histogram(alpha=0.5)

#Make a barplot of the sex of the survey participants, using ggplot
ggplot(data=survey, aes(sex))+geom_bar()

#Make a density chart of the happiness of the survey participants, using ggplot
ggplot(data=survey, aes(happiness))+geom_density()

#Use the same code as number 7 (density chart of happiness), but facet it by sex
ggplot(data=survey, aes(happiness))+geom_density()+facet_wrap(~`sex`)

#Use the same code as number 7 (density chart of happiness), but make the fill of the density chart show whether or not the person is in love
ggplot(data=survey, aes(happiness, fill=in_love))+geom_density()

#Use the same code as number 10, but make give it a title, subtitle, an x label and alpha
ggplot(data=survey, aes(happiness, fill=in_love))+geom_density()+labs(x='Level of happiness', y='happiness density', title='Happiness chart')

places_of_birth <- geocode(survey$where_born,
                           output = 'latlon',
                           source = 'google',
                           messaging = TRUE)

#Section 1b. Spatial stuff
#Now you have an object called places_of_birth. Take a look at it by running head(places_of_birth). What are the column names? 
#R: Longitude and latitude

#The word "bind" means "put together". We want to "bind" the columns of places_of_birth with our survey data. We can use the cbind function ("column bind") to do this. Run the following code:
survey <- cbind(survey, places_of_birth)

#Now run head(survey). Do you have two new columns in the dataframe? What are their names?
head(survey)
#R: Long and lat

#Use ggplot to make a map of the world by running the following code
world <- borders("world", colour="gray50", fill="gray50") 
ggplot()+world

#Now use the same code from number 5, but add a layer of points from the survey
ggplot(data=survey, aes(x=lat, y=lon))+world+geom_point(data=survey, alpha=0.3)

#Now use the same code as number 6, but make the size of those points show the age of the people
ggplot(data=survey, aes(x=lat, y=lon))+world+geom_point(data=survey, aes(x=lat, y=lon, size=age), alpha=0.3)+coord_map()

#Now use the same code as number 7, but make the color of the points show the sex of the people
ggplot(data=survey, aes(x=lat, y=lon))+world+geom_point(data=survey, aes(x=lat, y=lon, col=sex,size=age), alpha=0.3)+coord_map()

#Now use the same code as number 8, but add a theme (for example theme_cism() or theme_economist()).
ggplot(data=survey, aes(x=lat, y=lon))+world+geom_point(data=survey, aes(x=lat, y=lon, col=sex,size=age), alpha=0.3)+coord_map()+theme_cism()

#Now use the same code as number 10, but make the points a little bit transparent, add a title, a subtitle, and x / y labels
ggplot(data=survey, aes(x=lat, y=lon))+world+geom_point(data=survey, aes(x=lat, y=lon, col=sex,size=age), alpha=0.5)+coord_map()+theme_cism()+labs(title='places of birth')

#Section 1c. Analyzing free text
#Make an object called words. This is going to be how many times each word was used in the describe_cism question of the survey. You can run the below code to do this.
words <- prepare_for_word_cloud(survey$describe_cism)

#Take a look at the words object using head. What are the names of the columns
#R: word and freq

#Which word was used the most
table(words$word)
#R: They were used equally

#Run the following code to make a wordcloud
wordcloud2(data = words, size = 0.3, shape = 'circle')

#That's cool, right? But a bit hard to analyze. Let's use the score_sentiment function classify each the emotion of each person's description of the the CISM. Create a variable called cism_sentiment in the survey dataframe. Use  score_sentiment on the describe_cism variable to fill this new cism_sentiment variable.
survey$cism_sentiment <- score_sentiment(survey$describe_cism)

#Make a density chart (using ggplot) of the new cism_sentiment variable
ggplot(data=survey,aes(x=cism_sentiment))+geom_density()

#Based on your plot, do people feel more negative or more positive towards the CISM?
#R: People feel more positive

#Use score_sentiment to create a variable in survey called self_sentiment. For this variable, get the sentiment score of the describe_self
survey$self_sentiment<-score_sentiment(survey$describe_self)

#Make a density chart of the new self_sentiment variable
ggplot(data=survey,aes(x=self_sentiment))+geom_density()

#Based on your plot, do people feel more negative or more positive about themselves
#R: People feel more negative

#Make a scatterplot with age on the x-axis and cism_sentiment on the y-axis.
ggplot(data=survey,aes(x=age, y=cism_sentiment))+geom_jitter()

#Add geom_smooth(method = 'lm') to the above scatterplot to put a line of best fit onto it.
ggplot(data=survey,aes(x=age, y=cism_sentiment))+geom_jitter()+geom_smooth(method='lm')

#Based on the above plot, do people feel more positive or less positive about the CISM as they get older
#R:People feel less positive about cism when getting old.