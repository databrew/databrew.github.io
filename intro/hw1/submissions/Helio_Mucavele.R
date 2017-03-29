# Load the databrew package
library(databrew)

# Get census data
census <- databrew::census

# 1. How many rows are in the data? (hint: use nrow)
nrow(census)

#number of coluns
ncol(census)

#name of coluns
colnames(census)

sex_table <- table(census$sex) #creat a sex table
table(sex_table)

help("frequency")
length(sex_table) #number of observations from a certain variable

prop.table(sex_table) #proportion in a table

age_demo <- c(census$age) #Para xaracterizar as idades
sort(age_demo)

max(age_demo)
min(age_demo)
hist(age_demo, main = "Distribuicao de idades na populacao", xlab = 'Idade (anos)', ylab = 'Numero de observacoes', col = 'red')

barplot(sex_table, main = "Proporcao de sexo no Censu", ylab = 'Numero de obervacoes', col = 'blue')

flor_table <- table(census$floor_material) #tabulates the floor material of all the houses

summary(census)
str(census) #Fazer sumario dos dados
summary(census[c("floor_material")])

View(flor_table) #Ver a tabela e Frequencia de cada evento.

bike_table <- table(census$bike)
View(bike_table)
table(bike_table)

barplot(bike_table, main = "Proporcao de pessoas com bicicleta", xlab = 'Pessoas com bicicleta', ylab = 'Numero de obervacoes', col = 'orange')


census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')     #Create a new varable with conditions

table(census$tv_and_car)
tv_and_car <- table(census$tv_and_car) #First atribyte values and than create a proportion
prop.table(tv_and_car)
View(tv_and_car)

celular <- c(census$celular)

table(tv_and_car,celular)

library(databrew)
install_packages()

library(devtools)
install_github('joebrew/cism', dependencies = TRUE, force = TRUE)

install.packages("stringdist")
install.packages('extrafont')

library(devtools)
install_github('joebrew/cism', dependencies = TRUE, force = TRUE)

library(cism)
library(sp)
plot(moz0)
plot(moz1)
plot(moz2)
plot(moz3)
plot(moz0, col = "orange")
plot(man2)
plot(man2, main = 'Mapa do distrito da Manhica', col = "green")

points(census$longitude, census$latitude)
cism_map(lng = census$longitude,
         lat = census$latitude)

cism_map_interactive






