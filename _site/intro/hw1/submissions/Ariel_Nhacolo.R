

# SECTION 1:
# This is a one-time preliminary setting up of the R to runs smoothly.

library(devtools)
library(cism)
library(databrew)


# SECTION 2: OF HOMEWORK
# Get or load a dataset named census

census <- databrew::census


# SECTION 3: EXPLORE THE DATASET

# Have a look at the data, 

View(census)     # like browse
nrow(census)     # How many rows are in the data?
ncol(census)     # How many columns are in the data?
colnames(census) # What are the names of the columns/variables in the database?

# Explore the content

sex_table <- table(census$sex) # Create an object called sex_table; then:
sex_table # mostra-te o numero de pessoas por sexo
# We could just have tabulated like this: 
table(census$sex) # poupa massada de criar objectos para simples contagens como EuStockMarkets

sex_table / nrow(census) # Percentage by sex

max(census$age)  # maximum age
min(census$age)  # maximum age
hist(census$age) # histogram of age - not submitted


# Create a histogram of the ages of the people in our data. Make it pretty (ie, title, axis labels, etc.).

hist(x= census$age, main = "Population by age",
     xlab = 'Age (in years)',
     ylab = 'Nr (in thousands)',
     lwd = 3,
     col = 'blue') # histogram of age - submitted.

plot(x = census$age,
     type = 'l', main = "Population by age",
     xlab = 'Age (in years)',
     ylab = 'Nr (in thousands)',
     lwd = 3,
     col = 'blue') # este ultimo parentesis joga com o 1o no inicio do comando plot(x....)


# SECTION 4: MORE EXPLORTION

floor_table <- table(census$floor_material) # Or we could use table(census$floor_material), if not interested in objects.
floor_table # CTRL + ENTER
floor_table / nrow(census) # Percentage of cement floor?

# Create another table called bike_table with information about whether people have bikes or not.

bike_table <- table(census$bike)
bike_table

barplot(bike_table, main = "Does this household have a bike?",
     xlab = 'Existence of bike in households)',
     ylab = 'Nr of households (in thousands)',
     lwd = 3,
     col = 'blue') # este ultimo parentesis joga com o 1o no inicio do comando plot(x....)


# Create a new variable called "tv_and_car" like this:

census$tv_and_car <-
  ifelse(census$tv == 'yes' &
           census$car == 'yes',
         'Has TV and car',
         'Does not have TV and car')

# Use table to see how many people have both a TV and a car?

table(census$tv_and_car)

tv_and_car <- table(census$tv_and_car) # primeiro criamos a tabela, depois 'e que usamos esta tabela para calcular as proporcoes
prop.table(tv_and_car)

# Create a two variable table (a "cross-table") called xt using the tv_and_car variable and the celular variable (hint, use the table function, but just put a comma between the variables

xt <- table(census$tv_and_car, census$celular)
xt


# SECTION 5: MAPPING

# Map of Mozambique. This map is in the cism package. It's called moz0.

library(cism)
library(sp)
plot(moz0)  # Nivel nacional
plot(moz1)  # Nivel provincial
plot(moz2)  # Nivel districtal

plot(moz0, col='orange')  # todo o pais fica cor orange
# Se queremos provincias pintadas a cores, ao criterio de R, criamos um objecto chamado cols e usamos a funcao rainbow(nr de cores diferentes que queremos, neste caso 10 cores)

cores <- rainbow(10) # aqui deixamos R atribuir as cores; mas podiamos decidir usar c("red", "green", "blue", ...)
plot(moz1, col = cores)

plot(man2) # Mapa de Manhica

plot(man2, col='green', main = "Mapa do distrito de Manhica")

plot(man3, col='green', main = "Mapa do distrito de Manhica")

manhica_cores <- rainbow(6) # cores diferentes
plot(man3, col= manhica_cores, main = "Divisao Administrativa do distrito de Manhica")

# Create a simple scatterplot of the geographic coordinates in our census data (hint: longitude should be on the x-axis).

plot(x = census$longitude, y = census$latitude, main = "GPS positions of xxx in Manhica district")

# Make a map of Manhiça at the district level. Then, on the next line, run points(census$longitude, census$latitude)

plot(man2)
points(census$longitude, census$latitude) # sai um mapa de Manhica com GPS positions de agregados familiares, sem cores.

# Make a map with CISM colors by running the following:

cism_map(lng = census$longitude,
         lat = census$latitude)  # agora com cores. 

# Para saber como funciona funcao "cism_map" veja a documentation usando o comando "? cim_map".

# Make an interactive map using the cism_map_interactive function. If you do this right, it should look like this:

cism_map_interactive <- plot(x = census$longitude, y = census$latitude)
