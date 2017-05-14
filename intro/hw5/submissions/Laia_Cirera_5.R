# Homework 5. Laia Cirera

# Section 0: Installation
#Re-install the "databrew" package. (We are doing this because the most recent version has the score_sentiment function for assessing the emotionality of written text.)

library(databrew)


# Make sure that you have the following packages installed as well: ggmap, wordcloud, wordcloud2, gapminder,  googleVis. You can see if you have these by running the library function. If you don't have any of these packages, install them by using install.packages.

library(ggmap)
library(wordcloud2)
library(gapminder)
library(googleVis)

# Section 1: Practice with survey data
# Section 1a. Review
#Prepare your workspace by loading the following packages: gsheet, dplyr, ggplot2, cism, ggmap, wordcloud2,  ggthemes, readr, and databrew

library(gsheet)
library(dplyr)
library(ggplot2)
library(cism)
library(ggmap)
library(wordcloud2)
library(ggthemes)
library(readr)
library(databrew)


#Use the following code to download the survey data from the survey we took in class the other day.

if(!'survey.csv' %in% dir()){
  survey <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1kCpmpVqD4tzkdGgyLQGVqeZG1sJoe2FwFJIxtDRsrb0/edit?usp=sharing')
  write_csv(survey, 'survey.csv')
} else {
  survey <- read_csv('survey.csv')
}

#Use table to see how many people prefer money or sex. Write the anwer in a comment (ie, after a #).

head(survey)                                                                                   
#Use nrow to see how many people took the survey. Write the answer in a comment
table(survey$money_or_sex)
#Sex is preferred 

#Make a histogram of the age of the survey participants, using ggplot.

ggplot(data =survey, aes(x=age)) + geom_histogram()
                                                                                    
#Make a barplot of the sex of the survey participants, using ggplot.
                                                   
ggplot(data=survey, aes(x=sex)) + geom_bar()   

#Make a density chart of the happiness of the survey participants, using ggplot.
                                                                                    
ggplot(data=survey, aes(x=happiness)) + geom_density()   

#Use the same code as number 7 (density chart of happiness), but facet it by sex.
                                                                                    
ggplot(data=survey, aes(x=happiness)) + geom_density()+ facet_wrap(~sex)   

#Use the same code as number 7 (density chart of happiness), but make the fill of the density chart show whether or not the person is in love.
ggplot(data=survey, aes(x=happiness, fill=in_love)) + geom_density()+ facet_wrap(~sex)   
                                                                                    
#Use the same code as number 10, but make give it a title, subtitle, an x label and alpha.

ggplot(data=survey, aes(x=happiness, fill=in_love)) + 
  geom_density(alpha=0.5)+ 
  facet_wrap(~sex)+
  labs(title='Is happiness related to sex and being in love?', subtitle='happiness density distributions by sex and "being in love"', x='level of happiness', y='density level')  


#Section 1b. Spatial stuff
#We have the where_born column which shows where people were born. But it's difficult to analyze because it's just words. We want to get the geo-locations of those words. This process is called "geocoding". Geocode the survey participants' place of birth by running the following code.
#(You'll need an internet connection for this.)

# Create an object for places of birth
places_of_birth <- geocode(survey$where_born,
                           output = 'latlon',
                           source = 'google',
                           messaging = TRUE)

#Now you have an object called places_of_birth. Take a look at it by running head(places_of_birth). What are the column names?

head(places_of_birth)

#coordinates

#The word "bind" means "put together". We want to "bind" the columns of places_of_birth with our survey data. We can use the cbind function ("column bind") to do this. Run the following code:

survey <- cbind(survey, places_of_birth)

head(survey) 

#Do you have two new columns in the dataframe? What are their names?
# Yes, we have the lon and lat (coordinates variables)

#Use ggplot to make a map of the world by running the following code.

world <- borders("world", colour="gray50", fill="gray50") # create a layer of borders

#Now use the same code from number 5, but add a layer of points from the survey.
ggplot() + world+ geom_point(data=survey, aes(x=lon, y=lat))
  
#Now use the same code as number 6, but make the size of those points show the age of the people.
ggplot() + world+ geom_point(data=survey, aes(x=lon, y=lat, size=age))
  
#Now use the same code as number 7, but make the color of the points show the sex of the people.
ggplot() + world+ geom_point(data=survey, aes(x=lon, y=lat, size=age, color=sex))

#Now use the same code as number 8, but add a theme (for example theme_cism() or theme_economist()).
ggplot() + world+ geom_point(data=survey, aes(x=lon, y=lat, size=age, color=sex))+theme_economist()

#Now use the same code as number 10, but make the points a little bit transparent, add a title, a subtitle, and x / y labels.
ggplot() + world+ geom_point(data=survey, aes(x=lon, y=lat, size=age, color=sex), alpha=0.5)+theme_economist()+labs(title='Where were you born?', subtitle='question among R students', x='longitude', y='latitude') 

#Section 1c. Analyzing free text

#Make an object called words. This is going to be how many times each word was used in the describe_cism question of the survey. You can run the below code to do this.

library(databrew)

# Create an object called "words" which has how many times each word was used

words <- prepare_for_word_cloud(survey$describe_cism)

#Take a look at the words object using head. What are the names of the columns?
head(words)
# Word and frequency

#Which word was used the most?
# good

#Run the following code to make a wordcloud.
# Make the wordcloud of the object

wordcloud2(data = words, size = 0.3, shape = 'circle')

#That's cool, right? But a bit hard to analyze. Let's use the score_sentiment function to classify each emotion of each person's description of the the CISM. Create a variable called cism_sentiment in the survey dataframe. Use  score_sentiment on the describe_cism variable to fill this new cism_sentiment variable.

survey$cism_sentiment <- score_sentiment(x = survey$describe_cism)

#(The score_sentiment function produces a score from -5 to 5. -5 is very negative, 5 is very positive, 0 is neutral)

#Make a density chart (using ggplot) of the new cism_sentiment variable.

ggplot(data=survey, aes(x=cism_sentiment)) + geom_density()

#Based on your plot, do people feel more negative or more positive towards the CISM?
# Density function is left-skewed, so given the score ranges (0 is neutral), we see people tend to have more positive thoughts about CISM

#Use score_sentiment to create a variable in survey called self_sentiment. For this variable, get the sentiment score of the describe_self.

survey$self_sentiment <- score_sentiment(x= survey$describe_self)

#Make a density chart of the new self_sentiment variable.

ggplot(data=survey, aes(x=self_sentiment)) + geom_density()

#Based on your plot, do people feel more negative or more positive about themselves?
#It resembles the cism_sentiment density distribution, so people tend to feel positive and say good words about themselves. 

#Make a scatterplot with age on the x-axis and cism_sentiment on the y-axis.

ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point()

#Add geom_smooth(method = 'lm') to the above scatterplot to put a line of best fit onto it.
ggplot(data = survey,
       aes(x = age,
           y = cism_sentiment)) +
  geom_point() + geom_smooth(method = 'lm')

#Based on the above plot, do people feel more positive or less positive about the CISM as they get older?
#people tend to feel more negative about the CISM as they get older. 

#Section 2: Rmarkdown practice

#Go to https://raw.githubusercontent.com/databrew/databrew.github.io/master/template.Rmd, right click on the text and "save as" to download the file there.

#Save the file on your computer, but change the name of the file to Firstname_Lastname.Rmd (so, Joe_Brew.Rmd, for example).

#Open the file and click the knit button. It should produce an html.

#You'll notice that line 15 says theme: united. Change the theme to something else. You can see the possible themes at: http://rmarkdown.rstudio.com/html_document_format.html#appearance_and_style

#Also change the title: and author: parameters to match a research question that interests you and your name. This can be the research question from class the other day, or it can be something new. However, it must be from the survey. For example, the title can be "Does age affect happiness?" or "do people who are in love have more money in their pocket than people who are not in love?"

#Now that you have changed the title, author, and theme, write a bit in the introduction and methods (just 2-3 sentences each).

#In the results section, replace "Here is some more text" with something more interesting.

#In the results section, add 3 more R chunks (Code -> Insert Chunk) with 3 plots of 3 different variables. At least 1 must be numeric, and at least 1 must be categorical.

#Add text above each of your 3 plots.

#Create one chart with multiple variables. This chart should address your research question.

#Add text above your multiple variable chart.

#Add some text to the "Discussion" and "Conclusion" sections.

#Knit the whole document.

