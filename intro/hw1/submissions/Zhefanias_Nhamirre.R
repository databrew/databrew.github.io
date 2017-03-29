2+2
x<-c (1,2,3,4,5)
x
barplot(x)
a <- 1
a+3
ages <- c(31,23,24,26,26,30)
ages
ages[1]
ages[4]
sort(ages)
sorted_ages <- sort(ages)
min(ages)
max(ages)
mean(ages)
range(ages)
sd(ages)
hist(ages)
frangos <- read.csv("C:/Users/Musa/Desktop/frangos.csv")
table(frangos$chick)
unique(frangos$chick)
max(frangos$Time)
min(frangos$weight)
max(frangos$weight)
hist(frangos$weight)
boxplot(frangos$weight)
frangos[3,]
frangos[,2]
frango7 <- frangos[frangos$Chick == 7,]
belen <- frango7
plot(x=belen$Time, y=belen$weight,
type = 'l',maim = "frango development",
    xlab = 'Time (in days)',
    ylab = 'weight (in grams)',
    lwd = 3,
    col = "pink",
    lty = 4)

max(belen$Time)
max(belen$weight)

frangos$color <- 'red'
frangos$color <-
ifelse(frangos$Diet == 1, 'blue', 'green')
plot(x=frangos$Time,
   y=frangos$weight,
   col=frangos$color,
   pch = 8,
   xlab='Time',ylab ='Grams',main='Diet 1 vs other diets')

diet2<-frangos[frangos$Diet==2,]
maen(diet2$weight)
hist(diet2$weight)
