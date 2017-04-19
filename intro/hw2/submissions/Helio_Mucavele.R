
#section 1
library(cism)
library(databrew)
library(sp)


plot(moz0, main = "Mapa de Mocambique", col = 'yellow', border = FALSE)
plot(man3, col = 'grey', main = 'Distrito da Manhica', border = 'white')


census <- databrew::census
points(census$longitude,
       census$latitude,
       cex = 0.2)

#section 2 
females <- census[census$sex =='female', ]
females

mean(females$age)

hist(females$age, col ='blue', border = 'white')

females$middle_aged <- ifelse(females$age >= 40 & females$age <= 60,'middle aged', 'not middle aged')
females$middle_aged

census$moto2 <- ifelse(census$moto == 'yes', 'has moto', 'no moto')
census$moto2


tt <- table(females$middle_aged)
tt

xt_table <- table(census$moto2, census$middle_aged) #?????? error in completing this one
xt_table

#section3
library(tidyverse)


#section 4
library(cism)
library(data.table)

?get_weather
library(data.table)

weather <- get_weather(station = 'FQMA', 
                       start_year = 2010,
                       end_year = 2017)

head(weather)
ncol(weather)
View(weather)

range(min(weather$date), max(weather$date))

max(weather$temp_max, na.rm = TRUE) # Why we need to add this?

boxplot(weather$temp_mean)

hist(weather$precipitation)
        