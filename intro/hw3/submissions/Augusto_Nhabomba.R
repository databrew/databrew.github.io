#We need to install some new packages (for next class). With a good internet connection, run the following.
install.packages('ggthemes')
install.packages('gsheet')
#following without
library(ggthemes)
library(gsheet)
#Section 2: Using dplyr
#Run code to use the databrew , cism and data.table packages.
library(cism)
library(sp)
library(databrew)
# Get weather data
weather <- get_weather(station = 'FQMA',
                       start_year = 2010,
                       end_year = 2017)
#Create an object called x . This will be weather , but ???arranged??? by the temp_max variable. Hint, you???ll need to use both %>% and arrange .
x<-weather%>%arrange(temp_max)
#Delete x by using the rm command.
?rm
rm(x)
#Create a new object called x. This will be weather , but it will have a new variable named water . Use mutate to create thisvariable. If precipitation is greater than 0, then water should say ???wet day???; otherwise it should say ???dry day???. (Hint, you???ll need to use ifelse )
x<-weather%>%mutate(water<-ifelse(weather$precipitation>=0&weather$precipitation<=0,'wet day','dry day'))
#Create an object called y . This will be x , then grouped by water , then summarise by creating a new variable called number_of_days which contains the number of days that were wet vs. dry. (Hint, you???ll need to use n() )
y<-x%>%group_by(water)%>%summarise(number_of_days=n('wet day'))xxxxxxx
#Take a look at y. How many days were wet vs. dry?

