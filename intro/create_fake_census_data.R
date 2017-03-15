library(cism)
library(dplyr)

# READ IN OUR TABLES OF INTEREST
load('../../../solar_works/df.RData')
# Get dictionary
dictionary <- get_dssodk_dictionary()

# Define some variables we want to explore
the_variables <- c(#'EDUCATION',
                   'FLOOR_MATERIAL',
                   #'GENDER',
                   'HAS_BIKE',
                   'HAS_CAR',
                   'HAS_PIGS',
                   'HAS_CELULAR',
                   'HAS_MOTO',
                   'HAS_TELEPHONE',
                   'HAS_TV',
                   #'MARITAL_STATUS',
                   # 'NR_OF_PIGS',
                   #'RELIGION',
                   #'OCUPATION',
                   'WASH_AFTER_POOP',
                   'WATER_SOURCE')

# Keep only these variables
df <- df[,c('latitude', 'longitude', the_variables)]

# Jitter locations
new_indices <- sample(1:nrow(df))
df$longitude <- df$longitude[new_indices]
df$latitude <- df$latitude[new_indices]

# Jitter everything else too
locations <- df[,c('longitude', 'latitude')]

df <- data.frame(df)

# Convert for dictionary
for (j in 1:ncol(df)){
  this_column <- names(df)[j]
  if(this_column %in% dictionary$variable){
    this_dictionary <- dictionary %>% filter(variable == this_column)
    this_data <- data.frame(old = df[,this_column])
    new_data <- left_join(this_data,
                          this_dictionary %>%
                            dplyr::select(answer_eng, old)) %>%
      dplyr::select(answer_eng) %>%
      .$answer_eng
    df[,j] <- new_data
  }
}

# Lowercase all the names
names(df) <- tolower(names(df))

# Rearrange the order
df <- df %>%
  sample_n(nrow(df))

# Remove has
names(df) <- gsub('has_', '', names(df))

# Remove rownames
row.names(df) <- 1:nrow(df)

# Remove no locations
df <- df %>% filter(!is.na(longitude),
                    !is.na(latitude))

# Give a number of Nas
x <- apply(df, 1, function(x){length(which(is.na(x)))})

# Remove those with over 2 nas
df <- df[x <= 1,]
df <- df %>%
  sample_n(9000)

# Create sex
df$sex <- sample(c('male', 'female'), nrow(df), replace = TRUE)

# Create age
ages <- rbeta(100000,2,5) * 100
ages <- ages[ages >= 18]
df$age <- sample(ages, nrow(df))

# Write the csv
readr::write_csv(df, '/home/joebrew/Documents/databrew.github.io/census.csv')
