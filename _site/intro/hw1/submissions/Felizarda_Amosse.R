2+2
x<-c(1,2,3,4,5)
barplot(x)
a <- 1
a + 3
ages <- c(21,22,24,26,26,30)
ages
ages[1]
ages[4]
sorted_ages <- sort(ages)
min(ages)
max(ages)
mean(ages)
range(ages)
sd(ages)
hist(ages)

frangos <-read.csv("C:/UPS-Felizarda/Aula R/frangoS.csv")
max(frangos$Time)
unique(frangos$Chick)
hist(frangos$weight)
boxplot(frangos$weight)
frangos[1,2]
frangos[3,]
frangos[,2]

frango7 <- frangos[frangos$Chick ==7,]
belen <- frango7

plot(x=belen$Time, y=belen$weight,
type = 'l',main = "frango development",
   xlab = 'Time (in days)',
   ylab = 'weight (in grams)',
   lwd = 3,
   col = "pink",
   lty = 4)
max(belen$Time)
max(belen$weight)

frangos$color <- 'red'
frangos$color <-
  ifelse(frangos$Diet == 1, 'blue', 'grey')

plot(x = frangos$Time,
   y = frangos$weight,
   col = frangos$color,
   pch = 8,
   xlab = 'time',ylab = 'grams', main = 'diet 1 vs other diets')
   
   diet2<-frangos[frangos$Diet==2,] 
   mean(diet2$weight)
   hist(diet2$weight)
  version$minor

  ## To import document
  census <- read.csv('C:/Users/famosse/Desktop/census.csv')
  
  head(census)
  nrow(census)
  ncol(census)
  colnames(census)
  
  sex_table <-table(census$sex)
  dim(sex_table)
  head(sex_table)
  prop.table(sex_table)
  sex_table / nrow(census)
  max(census$age)
  min(census$age)
  
  ##Create a histogram of the ages of the people in our data. Make it pretty (ie, title, axis labels, etc.).
  hist(census$age)
  hist(census$age, breaks = 40, freq = F, main = "Histogram of age according sex", col ="pink",xlab = "People by age", ylab = "frequency")
  
  ###Create a barplot of the sex_table object you created earlier. Make it pretty
  barplot(sex_table, width = 1,space = NULL, main = "People by gender", col = c(2,1))
  
  ### Use the table function to create an object called floor_table which tabulates the floor material of all the houses in our data
  floor_table <- table(census$floor_material)
  head(floor_table)
  prop.table(floor_table)
  bike.table <- table(census$bike)
  barplot(bike.table, width = 1, space = NULL, main = "people that have a bike", col=c(2,4))
  
  ##Create a new variable called "tv_and_car" like this
  head(census)
  tv_and_car.table <- table(census$tv_and_car)
  tv_and_car.table
  head(tv_and_car.table)
  
  ##Use table to see how many people have both a TV and a car?
  prop.table(tv_and_car.table)

  
  xt <-table(census$tv_and_car, census$celular)
  
  library(cism)
  library(sp)
  plot(moz0,col= "Orange")
  plot(man2, main= "mapa do distrito da manhica", col = "green")
  plot(man3)
  