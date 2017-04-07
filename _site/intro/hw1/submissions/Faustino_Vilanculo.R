
# Ready csv file
census <- read.csv('E:/R/Aulas/census.csv')

#determinate number of  rows 
nrow(census)

#determinate number of columns 
ncol(census)

#names of the columns
colnames(census)
names(census)

#determinate the number of male and female
sex_table <-table(census$sex)
sex_table

# percentage of observations in female
sex_table/nrow(census)

#to determinate the maximum age in the data
max(census$age)

#to determinate the minimum  age in the data
min(census$age)

#Creation of histogram of the ages 
hist(census$age, main ='Grafico de distribuicao de idades', 
     xlab = 'Idades', ylab = 'Frequencias')

#Creation of barplot of the sex_table
barplot(sex_table)

floor_table <- table(census$floor_material)
floor_table
