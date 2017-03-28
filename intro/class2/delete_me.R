station = "FQMA"; start_year = 2014; end_year = 2016; 
save = TRUE; load_saved = TRUE

file_name <- paste0("weather_", station, "_", start_year, 
                    "_", end_year, ".RData")
if (load_saved & file_name %in% dir()) {
  load(file_name)
}
else {
  station <- toupper(gsub(" ", "%20", station))
  start_date <- as.Date(paste0(start_year, "-01-01"))
  end_date <- as.Date(paste0(end_year, "-12-31"))
  if (end_date > Sys.Date()) {
    end_date <- Sys.Date() - 1
  }
  start_day <- as.numeric(format(start_date, "%d"))
  start_month <- as.numeric(format(start_date, "%m"))
  start_year <- as.numeric(format(start_date, "%Y"))
  end_day <- as.numeric(format(end_date, "%d"))
  end_month <- as.numeric(format(end_date, "%m"))
  end_year <- as.numeric(format(end_date, "%Y"))
  years <- start_year:end_year
  results_list <- list()
  for (i in 1:length(years)) {
    try({
      this_year <- years[i]
      this_start_month <- 1
      this_start_day <- 1
      if (this_year == end_year) {
        this_end_month <- as.numeric(format(end_date, 
                                            "%m"))
        this_end_day <- as.numeric(format(end_date, 
                                          "%m"))
      } else {
        this_end_month <- 12
        this_end_day <- 31
      }
      link <- paste0("http://www.wunderground.com/history/airport/", 
                     station, "/", this_year, "/", this_start_month, 
                     "/", this_start_day, "/CustomHistory.html?dayend=", 
                     this_end_day, "&monthend=", this_end_month, 
                     "&yearend=", this_year, "&req_city=NA&req_state=NA&req_statename=NA&format=1")
      df <- suppressWarnings(fread(link))
      names_df <- names(df)
      df <- data.frame(df)
      names(df) <- names_df
      df <- df[, 1:21]
      names(df)[1] <- "date"
      df$date <- as.Date(df$date, format = "%Y-%m-%d")
      names(df) <- tolower(gsub(" |[/]", "_", names(df)))
      df <- df[, !grepl("sea_level|visibility|wind|gust|dew", 
                        names(df))]
      names(df) <- c("date", "temp_max", "temp_mean", 
                     "temp_min", "humidity_max", "humidity_mean", 
                     "humidity_min", "precipitation", "cloud_cover")
      df$location <- toupper(as.character(station))
      message(paste0("Data retrieved for ", this_year))
      results_list[[i]] <- df
    })
  }
  x <- do.call("rbind", results_list)
}
if (save) {
  save(x, file = file_name)
}
