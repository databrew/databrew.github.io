# Libraries
library(mailR)
library(gsheet)
library(dplyr)

# Get data
the_url <- 'https://docs.google.com/spreadsheets/d/1zz2OWpqG7TOtbEQNESj26LuYtRGfMt9Xrib6N5TMR_Y/edit?usp=sharing'
participants <- gsheet2tbl(the_url)
participants <- data.frame(participants)

# Arrange by last name
participants <- participants %>% arrange(Last.name)

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
                 'Your grade for homework assignment four is ',
                 participants$hw4[i],
                 ' out of 10.\n\n',
                 participants$hw4_comments[i],
                 '\n\n',
                 # 'Attached is your automatically generated "mid-term report".\n\n',
                 'Remember that class 5 starts on Wednesday (May 10) at 15:00 in the library.\n\n',
                 'Cumpr.\n',
                 'Joe Brew\n\n',
                 'P.S. This email was automatically sent in R.')
  
  # Knit the mid-term report
  # report_name <- paste0(participants$First.name[i],
  #                     '_',
  #                     'mid_term_report.pdf')
  # rmarkdown::render('report.Rmd',
  #                   output_file = report_name,
  #                   params = list('email' = destinataire))
  send.mail(from = from,
            # attach.files = report_name,
            to = destinataire,
            subject = 'HW 4 grade and class 5',
            body = body,
            smtp = list(host.name = "smtp.gmail.com", 
                        port = 465, 
                        user.name = from,
                        passwd=password, 
                        ssl=TRUE),
            authenticate = TRUE,
            send = TRUE)
  # file.remove(report_name)
  # Sys.sleep(1)
}
