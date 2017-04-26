# SECTION 1
library(cism)
library(sp)
library(databrew)
library(dplyr)
# plot(moz0)
plot(moz0)
plot(moz0, main='Mozambique', col='yellow', border= FALSE)
# plot(man3)
plot(man3)
plot(man3, main='Manhiça', col='grey', border='white')census <- databrew::census
points(census$longitude,
       census$latitude,
       cex = 0.2)
# SECTION 2
census <- databrew::census
# variable female
females <- census %>% filter(sex== 'female')
females <- census[census$sex == 'female']
# average females
mean(females$age)
# histogram
hist(females$age, col = 'blue', border = 'white')
# middle_aged
females$middle_aged <- ifelse (females$age >40 & females$age < 60, 'middle age','not middle aged')
# moto2
females$moto2 <- ifelse(females$moto == 'yes', 'Has moto', 'No moto')
# middle_aged table
tt <- table(females$middle_aged)
# middle_aged and moto2 table
xt <- table(females$moto2, females$middle_aged)
# chi test
chisq.test(xt)
# p-value not significant
# pxt table
pxt <- prop.table(xt)
# pxt*100
pxt <- pxt *100
# barplot
barplot(pxt, beside= TRUE, legend=TRUE, main = 'Middle Aged and Moto', col = c('purple', 'darkorange'))
# SECTION 3
library(tidyverse)
library(data.table)
# SECTION 4
library(cism)
library(data.table)
?get_weather
wd <- getwd()
print(wd)
weather <- get_weather(station = 'FQMA', 
                       start_year = 2010,
                       end_year = 2017)
# head
head(weather)
# colnames
colnames(weather)
# range
range(weather$date)
# temp max
max(weather$temp_max, na.rm = TRUE)
# temp min
min(weather$temp_min, na.rm = TRUE)
# average temp
mean(weather$temp_mean, na.rm = TRUE)
# plot
boxplot(weather$temp_mean, main='Temperature', col = 'blue', border = 'white')
# precipitation hist
hist(weather$precipitation, ylab = 'Days', xlab = 'Precipitation',
main = 'Precipitation Days', col = 'yellow', border = 'grey')
plot(weather$date, weather$temp_max, ylim=c(0,50), col='red', points(weather$date, weather$temp_min))
# daydif variable
daydif<- (weather$temp_max-weather$temp_min)
# daydif histogram
hist(daydif, main = 'Temperature Difference', ylab = 'Days', xlim = c(0,25),
ylim = c(0,600), col = 'blue', border = 'grey', xlab = 'Tª Difference')
# good or bad days
good_or_bad <- ifelse(weather$temp_max>25 & weather$humidity_max<60, 
'good days', 'bad days' )
# table good_or_bad_table
good_or_bad_table <- table(good_or_bad)
# barplot
barplot(good_or_bad_table, main = 'Good or Bad Days', col = c('blue', 'red'), border = 'white', ylim = c(0,2500))
# % good days, 0.912% good days
prop.table(good_or_bad_table)*100
# month
weather$month <- format(weather$date, '%m')
# table xt
xt <- table(weather$month, good_or_bad)
# pxt
pxt <- prop.table(xt, 2)
# pxt*100
pxt*100
# barplot
barplot(pxt, legend= TRUE, beside = TRUE)
# Janaury is the month with more good days, and March is the month with more bad days