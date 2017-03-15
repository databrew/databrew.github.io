# Libraries
library(gsheet)
library(dplyr)

# Get data
the_url <- 'https://docs.google.com/spreadsheets/d/1zz2OWpqG7TOtbEQNESj26LuYtRGfMt9Xrib6N5TMR_Y/edit?usp=sharing'
participants <- gsheet2tbl(the_url)

# Arrange by last name
participants <- participants %>% arrange(Last.name)

need_to_write <- 
  participants %>%
  filter(grepl('No', Do.you.have.RStudio.on.your.computer.))

cat(paste0(participants$First.name, 
       ' ',
       participants$Last.name, 
       ' (',
       participants$Email.address,
       ')',
       collapse = '\n'))
