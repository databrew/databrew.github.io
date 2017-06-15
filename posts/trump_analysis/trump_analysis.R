# Packages
library(tidyverse)
library(rtweet)
library(databrew)
library(prophet)
library(Rcpp) # needed to run prophet

theme_databrew <- theme_bw


# The following comes from: https://github.com/mkearney/trumptweets
## function to scrape IDs
.trumpids <- function(year) {
  ## build url
  url <- paste0("http://trumptwitterarchive.com/",
                "data/realdonaldtrump/", year, ".json")
  ## return ids
  jsonlite::fromJSON(url)[["id_str"]]
}
## function to download status ids
trumpids <- function(trumptwitterarchive = TRUE) {
  ## scrape from trumptwitterarchive.com
  if (trumptwitterarchive) {
    ids <- c(2009:2017) %>%
      lapply(.trumpids) %>%
      unlist(use.names = FALSE)
  } else {
    ## or from my github page (note: this one is unlikely to
    ## be updated as frequently as trumptwitterarchive)
    ids <- paste0(
      "https://github.com/mkearney/trumptweets/blob/",
      "master/data/realdonaldtrump-ids-2009-2017.csv") %>%
      read.csv(stringsAsFactors = FALSE) %>%
      unlist(use.names = FALSE)
  }
  ## return ids
  ids
}
## function to download twitter data
trumptweets <- function() {
  ## get archive of status ids
  ids <- trumpids()
  ## get newest trump tweets (set to 1000 to be safe)
  rt1 <- get_timeline(
    "realdonaldtrump", n = 1000,
    since_id = ids[length(ids)])
  ## download archive
  message("    Downloading ", length(ids), " tweets...")
  rt2 <- lookup_statuses(ids[1:16000])
  message("    You're halfway there...")
  rt3 <- lookup_statuses(ids[16001:(length(ids))])
  message("    Huzzah!!!")
  ## combine data into list
  rt <- list(rt1, rt2, rt3)
  ## collapse into data frame (or salvage list if error)
  tryCatch(do.call("rbind", rt),
           error = function(e) return(rt))
}

# Download all of Trump's tweets.
# ## run function to download Trump's twitter archive
if('all_tweets.RData' %in% dir()){
  load('all_tweets.RData')
} else {
  djt <- trumptweets()
  # Run sentiment scoring
  djt$sentiment <- databrew::score_sentiment(x = djt$text)
  save(djt, file = 'all_tweets.RData')
}

# Remove retweets
djt <- djt %>% filter(!is_retweet)

# Create date columns
djt$date <- as.Date(djt$created_at)
djt$time <- djt$created_at
djt <- 
  djt %>%
  mutate(dow = weekdays(date),
         day_number = as.numeric(format(date, '%d')),
         month = as.numeric(format(date, '%m')),
         year = as.numeric(format(date, '%Y'))) %>%
  mutate(dow = factor(dow,
                      levels = c('Monday',
                                 'Tuesday',
                                 'Wednesday',
                                 'Thursday',
                                 'Friday',
                                 'Saturday',
                                 'Sunday')))

# Get birth certificate tweets
djt <-
  djt %>%
  mutate(bc = grepl('birth certificate', tolower(djt$text)))

# Group by day of week
x <- djt %>%
  group_by(dow) %>%
  summarise(sentiment = mean(sentiment))

# Group by day of month
x <- djt %>%
  group_by(day_number) %>%
  summarise(sentiment = mean(sentiment))

# Get daily
daily <-
  djt %>%
  group_by(date) %>%
  summarise(sentiment_avg = mean(sentiment, na.rm = TRUE),
            sentiment_max = max(sentiment, na.rm = TRUE),
            sentiment_min = min(sentiment, na.rm = TRUE),
            n_tweets = n()) %>%
  ungroup %>%
  mutate(sentiment_variation = sentiment_max - sentiment_min)
daily$sentiment_7 <- NA
for (i in 7:nrow(daily)){
  this_date <- daily$date[i]
  sub_data <- djt %>%
    filter(date >= (this_date - 6),
           date <= this_date)
  val <- mean(sub_data$sentiment, na.rm = TRUE)
  daily$sentiment_7[i] <- val
}

ggplot(data = daily %>%
         filter(date >= '2016-06-01',
                date <= '2017-04-01'),
       aes(x = date,
           y = sentiment_7)) +
  geom_line(alpha = 0.6,
            color = 'darkorange') +
  geom_smooth(span = 0.1, fullrange = FALSE, se = FALSE, alpha = 0.6) +
  geom_vline(xintercept = as.numeric(as.Date('2016-05-10') +
                                       seq(0, 600, by = 27)
                                       # months(0:30)
                                     ),
             alpha = 0.3) +
  theme_databrew() +
  labs(x = 'Date',
       y = '(negative) Tweet sentiment score (positive)',
       title = "Are Donald Trump's emotions on a monthly cycle?",
       subtitle = 'Vertical grey lines = 27 day intervals')
ggsave('fig1.png')


g1 <- ggplot(data = daily,
       aes(x = date,
           y = sentiment_min)) +
  geom_line(alpha = 0.6,
            color = 'darkorange') +
  geom_smooth(span = 0.001, fullrange = FALSE, se = FALSE, alpha = 0.6) +
  theme_databrew() +
  labs(x = 'Date',
       y = 'Score',
       title = "Score of most negative daily tweet")
g2 <- ggplot(data = daily,
             aes(x = date,
                 y = sentiment_max)) +
  geom_line(alpha = 0.6,
            color = 'darkorange') +
  geom_smooth(span = 0.001, fullrange = FALSE, se = FALSE, alpha = 0.6) +
  theme_databrew() +
  labs(x = 'Date',
       y = 'Score',
       title = "Score of most positive daily tweet")
png(filename = 'fig3.png', height = 4.01, width = 5.64, units = 'in', res = 300)
Rmisc::multiplot(g1, g2)
dev.off()

# Distribution
ggplot(data = djt,
       aes(x = sentiment)) +
  geom_density(n = 40,
               fill = 'darkorange',
               alpha = 0.6) +
  labs(x = 'Sentiment',
       y = 'Density',
       title = 'Distribution of sentiment of Trump tweets',
       subtitle = 'Left = negative; Right = positive') +
  geom_vline(xintercept = 0, col = 'darkred', alpha = 0.2) +
  theme_databrew()
ggsave('fig4.png')

# Meanest tweet ever
djt %>%
  filter(sentiment <= min(sentiment) +1)

# Retweets by sentiment
x <- 
  djt %>%
  mutate(sentiment_group = ifelse(sentiment <= -10,
                                  'Very negative',
                                  ifelse(sentiment < 0,
                                         'Negative',
                                         ifelse(sentiment == 0,
                                                'Neutral',
                                                ifelse(sentiment <= 10,
                                                       'Positive',
                                                       'Very positive'))))) %>%
  mutate(sentiment_group = factor(sentiment_group,
                                  levels = c('Very negative',
                                             'Negative',
                                             'Neutral',
                                             'Positive',
                                             'Very positive')))
y <- x %>%
  group_by(sentiment_group) %>%
  summarise(n_tweets = n(),
            sentiment_score = mean(sentiment),
            retweets = mean(retweet_count))

ggplot(data = y,
       aes(x = sentiment_group,
           y = retweets)) +
  geom_bar(stat = 'identity',
           fill = 'darkorange',
           alpha = 0.6) +
  theme_databrew() +
  labs(x = 'Sentiment',
       y = 'Average number of retweets',
       title = 'Retweets by sentiment group',
       subtitle = 'Negativity = publicity')
ggsave('fig5.png')

# Most retweeted ever
djt %>%
  filter(retweet_count >= 200000)

## Group by day of week
dow <- 
  djt %>%
  group_by(dow) %>%
  summarise(sentiment_avg = mean(sentiment, na.rm = TRUE),
            sentiment_max = max(sentiment, na.rm = TRUE),
            sentiment_min = min(sentiment, na.rm = TRUE),
            n_tweets = n()) %>%
  ungroup %>%
  mutate(sentiment_variation = sentiment_max - sentiment_min)

ggplot(data = dow,
       aes(x = dow,
           y = sentiment_avg)) +
  geom_bar(stat = 'identity',
           alpha = 0.6,
           fill = 'darkorange') +
  theme_databrew() +
  labs(x = 'Date',
       y = 'Average sentiment score',
       title = 'Sentiment by day of week',
       subtitle = 'Excluding re-tweets')
ggsave('fig2.png')


# Group at yearly level
yearly <- 
  djt %>%
  group_by(year) %>%
  summarise(sentiment_avg = mean(sentiment, na.rm = TRUE),
            sentiment_max = max(sentiment, na.rm = TRUE),
            sentiment_min = min(sentiment, na.rm = TRUE),
            n_tweets = n()) %>%
  ungroup %>%
  mutate(sentiment_variation = sentiment_max - sentiment_min)


# # Group at the daily level
# djt <-
#   djt %>%
#   group_by(date = as.Date(created_at)) %>%
#   summarise(sentiment_avg = mean(sentiment, na.rm = TRUE),
#             sentiment_max = max(sentiment, na.rm = TRUE),
#             sentiment_min = min(sentiment, na.rm = TRUE),
#             n_tweets = n()) %>%
#   ungroup %>%
#   mutate(sentiment_variation = sentiment_max - sentiment_min)
# 
# # Change column names to conform with prophet
# djt <-
#   djt %>%
#   mutate(ds = date,
#          y = sentiment_avg)
# 
# # Run model
# m <- prophet::prophet(djt)
# 
# # Make future
# future <- make_future_dataframe(m, periods = 365)
# forecast <- predict(m, future)
# 
# # Plot
# plot(m, forecast)
# 
# # Look at components
# prophet_plot_components(m, forecast)
