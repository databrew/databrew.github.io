
# Turn off scientific notation
options(scipen = '999')

# Libraries
library(tidyverse)
library(printr)
# Get weather for 2012-2016
library(gsod)
weather <- bind_rows(gsod2012,
                     gsod2013,
                     gsod2014,
                     gsod2015,
                     gsod2016)
# Get the station ids
ids <- bind_rows(find_nearest_station('Amsterdam, Netherlands'),
                 find_nearest_station('Barcelona, Catalonia'))
ids
library(rworldmap)
library(ggplot2)
library(ggrepel)
library(databrew)
world <- map_data(map="world")

# Define black background
library(grid)
theme_black = function(base_size = 12, base_family = "") {
  
  theme_grey(base_size = base_size, base_family = base_family) %+replace%
    
    theme(
      # Specify axis options
      axis.line = element_blank(),  
      axis.text.x = element_text(size = base_size*0.8, color = "white", lineheight = 0.9),  
      axis.text.y = element_text(size = base_size*0.8, color = "white", lineheight = 0.9),  
      axis.ticks = element_line(color = "white", size  =  0.2),  
      axis.title.x = element_text(size = base_size, color = "white", margin = margin(0, 10, 0, 0)),  
      axis.title.y = element_text(size = base_size, color = "white", angle = 90, margin = margin(0, 10, 0, 0)),  
      axis.ticks.length = unit(0.3, "lines"),   
      # Specify legend options
      legend.background = element_rect(color = NA, fill = "black"),  
      legend.key = element_rect(color = "white",  fill = "black"),  
      legend.key.size = unit(1.2, "lines"),  
      legend.key.height = NULL,  
      legend.key.width = NULL,      
      legend.text = element_text(size = base_size*0.8, color = "white"),  
      legend.title = element_text(size = base_size*0.8, face = "bold", hjust = 0, color = "white"),  
      legend.position = "right",  
      legend.text.align = NULL,  
      legend.title.align = NULL,  
      legend.direction = "vertical",  
      legend.box = NULL, 
      # Specify panel options
      panel.background = element_rect(fill = "black", color  =  'black'),  
      panel.border = element_rect(fill = NA, color = "black"),  
      panel.grid.major = element_line(color = "black"),  
      panel.grid.minor = element_line(color = "black"),  
      panel.margin = unit(0.1, "lines"),   
      # Specify facetting options
      strip.background = element_rect(fill = "black", color = "black"),  
      strip.text.x = element_text(size = base_size*0.8, color = "black"),  
      strip.text.y = element_text(size = base_size*0.8, color = "black",angle = -90),  
      # Specify plot options
      plot.background = element_rect(color = "black", fill = "black"),  
      plot.title = element_text(size = base_size*1.2, color = "black"),  
      plot.margin = unit(rep(1, 4), "lines")
      
    )
}

# Plot all weather stations
stations <- weather %>%
  group_by(lon, lat) %>%
  tally
ggplot() + 
  geom_map(data=world, 
           map=world,
           aes(map_id=region, x=long, y=lat),
           fill = 'black',
           alpha = 0.8) +
  theme_black() +
  geom_point(data = stations,
             aes(x = lon,
                 y = lat),
             alpha = 0.5,
             size = 0.3,
             color = 'red',
             pch = 16) +
  labs(x = 'Longitude',
       y = 'Latitude') +
  theme(legend.position = 'bottom')

# Daily weather by station
stnids <- sort(unique(weather$stnid))
stnids <- sample(stnids, 300)
ggplot(data = weather %>% filter(stnid %in% stnids) %>%
         filter(lat <= 60, lat >= -60) %>%
         mutate(Hemisphere = ifelse(lat > 0, 'Northern', 'Southern')) %>%
         filter(!is.na(Hemisphere)),
       aes(x = date,
           y = temp,
           group = stnid,
           color = Hemisphere)) +
  geom_line(alpha = 0.1, 
            size = 0.1) +
  theme_databrew() +
  labs(x = 'Date',
       y = 'Degrees (celcius)',
       title = 'Daily average temperature',
       subtitle = '300 randomly sampled stations: each line is a station') +
  scale_color_manual(name = 'Hemisphere',
                     values = c('darkorange', 'blue')) +
  guides(colour = guide_legend(override.aes = list(alpha=1)))


x <- weather %>%
  mutate(degrees_from_equator = abs(lat)) %>%
  group_by(stnid,
           lon,
           lat,
           degrees_from_equator) %>%
  summarise(avg = mean(temp, na.rm = TRUE),
            max = max(max, na.rm = TRUE),
            min = min(min, na.rm = TRUE)) %>%
  ungroup %>%
  filter(!is.na(degrees_from_equator))
x <- x %>%
  gather(key, value,
         avg:min)

ggplot(data = x %>% filter(key != 'avg',
                           value <= 65,
                           value >= -75) %>%
         mutate(key = paste0(Hmisc::capitalize(key), ' temperature')),
       aes(x = degrees_from_equator,
           y = value,
           col = key)) +
  geom_point(alpha = 0.2,
             size = 0.2) +
  theme_databrew() +
  labs(x = 'Degrees (latitude) from equator',
       y = 'Degrees (celcius)',
       title = 'Max and min temperature by station',
       subtitle = 'Each dot is one weather station') +
  scale_color_manual(name = '',
                     values = c('darkorange', 'blue')) +
  guides(colour = guide_legend(override.aes = list(alpha=1))) +
  geom_hline(yintercept = 0, lty = 2)



g <- 
  ggplot() + 
  theme_databrew() +
  geom_map(data=world, 
           map=world,
           aes(map_id=region, x=long, y=lat),
           fill = 'lightblue',
           alpha = 0.8) +
  geom_point(data = ids,
             aes(x = lon,
                 y = lat),
             alpha = 0.6,
             size = 3,
             color = 'red') +
  labs(x = 'Longitude',
       y = 'Latitude') +
  theme(legend.position = 'bottom') +
  geom_label_repel(data = ids,
                   aes(x = lon,
                       y = lat,
                       label = stn_name),
                   alpha = 0.7,
                   size = 2)
g

# Get weather for only our two stations
weather <- weather %>%
  filter(stnid %in% ids$stnid)
# Make long tidy data for plotting temperatures
long <- weather %>%
  dplyr::select(date, max, min, stn_name) %>%
  gather(key, value, max:min)
# Compare temperature
g <- ggplot(data = long,
            aes(x = date,
                y = value,
                color = key)) +
  geom_line(alpha = 0.6) +
  facet_wrap(~stn_name) +
  theme(legend.position = 'bottom') +
  scale_color_manual(name = '',
                     values = c('blue', 'red')) +
  theme_databrew() +
  labs(x = 'Date',
       y = 'Degrees (celcius)')
g
rain <- weather %>%
  mutate(month = format(date, '%m')) %>%
  group_by(month, stn_name) %>%
  summarise(rainy = length(which(prcp > 0)),
            days = n()) %>%
  ungroup %>%
  mutate(p = rainy / days * 100)

ggplot(data = rain,
       aes(x = month,
           y = p,
           color = stn_name,
           group = stn_name)) +
  geom_line() +
  theme_databrew() +
  scale_color_manual(name = '',
                     values = c('blue', 'red')) +
  labs(x = 'Month',
       y = 'Percentage',
       title = 'Percentage of days which are rainy') +
  ylim(0,100)
