
#ler arquivo csv
census <- read.csv('C:/Users/olga.cambaco/R/census.csv')

nrow(census)

ncol(census)

colnames(census)


sex_table <- table(census$sex)

sex_table['male']

prop.table(sex_table)

max(census$age)

min(census$age)

# main para dar nome
hist(census$age, main = 'Grafico de Distribuicao das Idades')

barplot(sex_table)

floor_table <- table(census$floor_material)

floor_table['Cement']

prop.table(floor_table)['Cement']

bike_table <- table(census$bike)

barplot(bike_table)

census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')

has_tv_and_car <- table(census$tv_and_car)

has_tv_and_car['Has TV and car']

prop.table(has_tv_and_car)


library(cism)
library(sp)
plot(moz0)

plot(moz0, col='orange')
plot(man2)
plot(man2, col='green', main='mapa manhica')
plot(man3, col='green', main='mapa manhica')
