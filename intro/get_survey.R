# Libraries
library(mailR)
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

# Write to each participant
from = 'joebrew@gmail.com'
password = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'

# Comma separated list of participants
cat(paste0(participants$Email.address, 
                         collapse = ', '))

# participants <- participants %>%
#   filter(First.name %in% c('Andrew', 'Augusto', 'Helena'))
# participants <- participants %>%
#   filter(!grepl('Messa', Last.name))

for (i in 1:nrow(participants)){
  destinataire <- participants$Email.address[i]
  body <- paste0('Dear ',
                 participants$First.name[i],
                 ',\n\n',
                 'Your grade for the first homework assignment is ',
                 participants$hw1[i],
                 ' out of 10.\n\n',
                 participants$hw1_comments[i],
                 '\n\n',
                 'Remember that class 2 starts today at 15:00 in the library.\n\n',
                 'Cumpr.\n',
                 'Joe Brew\n\n',
                 'P.S. This email was automatically sent in R.')
  send.mail(from = from,
            to = destinataire,
            subject = 'R course: your grade for homework assignment number 1',
            body = body,
            smtp = list(host.name = "smtp.gmail.com", 
                        port = 465, 
                        user.name = from,
                        passwd=password, 
                        ssl=TRUE),
            authenticate = TRUE,
            send = TRUE)
  Sys.sleep(1)
}
