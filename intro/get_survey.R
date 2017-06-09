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


# University of Toronto course

the_url <-
  "https://docs.google.com/spreadsheets/d/16U9wC07Ub8a3Q6JIymQLjKT-tSTJ0-0rUX_1H3DBlAg/edit?usp=sharing"

toronto <- gsheet2tbl(the_url)
toronto <- data.frame(toronto)

names(toronto) <- tolower(names(toronto))

# Write to each participant
from = 'joe@databrew.cc'
password = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'


for (i in 20:nrow(toronto)){
  destinataire <- c(toronto$email[i], "benmbrew@gmail.com")
  body <- paste0('Dear ',
                 toronto$name[i],
                 ',\n\n',
                 "I'm writing because I thought that perhaps some of your students ",
                 "might be interested in taking this R course being offered in Toronto this weekend:\n\n",
                 "http://www.databrew.cc/Rworkshops.html#openModal1\n\n",
                 '\n',
                 'It should provide a solid foundation for those just getting into statistical computing - and there is a discount for university students.\n\n',
                 'Best,\n',
                 'Joe Brew\n\n')
  
  send.mail(from = from,
            # attach.files = report_name,
            to = destinataire,
            subject = 'R course in Toronto this weekend',
            body = body,
            smtp = list(host.name = "smtp.gmail.com", 
                        port = 465, 
                        user.name = from,
                        passwd=password, 
                        ssl=TRUE),
            authenticate = TRUE,
            send = TRUE)
  # file.remove(report_name)
  Sys.sleep(1)
}

# RYERSON
the_url <- "https://docs.google.com/spreadsheets/d/1vaXJuAqHf8S9sFJl3ZmYnIBCgsc_GKVthMja9nPWCzA/edit?ts=592ece3c#gid=0"


toronto <- gsheet2tbl(the_url)
toronto <- data.frame(toronto)
names(toronto) <- tolower(names(toronto))

# # Clean up
# toronto$email <- 
#   gsub('(at)', '@', toronto$email, fixed = TRUE)
# toronto$email <- paste0(toronto$email,
#                         ifelse(is.na(toronto$email2), '',
#                                toronto$email2))
get_name <- function(x){
  x_split <- strsplit(x, ' ')
  x_split <- unlist(x_split)
  out <- x_split[2]
  if(length(x_split) == 2){
    out <- paste0('Dr. ', out)
  }
  return(out)
}
for (i in 1:nrow(toronto)){
  toronto$name[i] <-
    get_name(toronto$name[i])
}


# Write to each participant
from = 'joebrew@gmail.com'
password = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'


for (i in 1:nrow(toronto)){
  destinataire <- c(toronto$email[i], "info@databrew.cc")
  body <- paste0('Dear ',
                 toronto$name[i],
                 ',\n\n',
                 "I'm writing because I thought that perhaps some of your students ",
                 "might be interested in taking this R course being offered in Toronto this weekend:\n\n",
                 "http://www.databrew.cc/Rworkshops.html#openModal1\n\n",
                 '\n',
                 'It should provide a solid foundation for those just getting into statistical computing - and there is a discount for university students.\n\n',
                 'Best,\n',
                 'Joe Brew\n\n')
  
  send.mail(from = from,
            # attach.files = report_name,
            to = destinataire,
            subject = 'R course in Toronto this weekend',
            body = body,
            smtp = list(host.name = "smtp.gmail.com", 
                        port = 465, 
                        user.name = from,
                        passwd=password, 
                        ssl=TRUE),
            authenticate = TRUE,
            send = TRUE)
  # file.remove(report_name)
  Sys.sleep(1)
}
