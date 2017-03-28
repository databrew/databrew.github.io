census <- read.csv('http://www.databrew.cc/census.csv')
nrow(census)
ncol(census)
colnames(census)        
sex_table <- table(census$sex)
sex_table
nrow(sex_table)
ncol(sex_table)
prop.table(sex_table) 
max(census$age)
min(census$age)

graphics::hist(census$age, 
                  main = "Age frequencies", 
                  xlab = "Age", 
                  ylab = "Number of people", 
                  col = 'green', 
                  breaks = 500,
                  border = "dark green"
)


graphics::barplot(census$age, 
               main = "Age frequencies", 
               xlab = "Age", 
               ylab = "Number of people", 
               col = 'green', 
#               breaks = 500,
               border = "dark green"
)

floorMaterialTable <- table(census$floor_material)
paste0(round(prop.table(floorMaterialTable)["Cement"]*100, 3),"%")

barplot(prop.table(table(census$bike)),
        main = "People and their bicycle ownership",
        xlab = "Own?",
        ylab = "Probability",
        ylim = c(0, 1),
        col = c("red", "green")
)
census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')

prop.table(table(census$tv_and_car))
table(census$tv_and_car, census$celular)
library(cism)
library(sp)
plot(moz3,
     col = "orange")
plot(man2,
     col = "green",
     main = "Manhica", add=TRUE)

plot(moz3)
plot(man2)
points(census$longitude, 
       census$latitude
      )

cism_map_interactive(census$longitude, census$latitude, x = census$pigs)
