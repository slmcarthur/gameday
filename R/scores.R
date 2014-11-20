######### NEED TO CHANGE THIS

#' NHL final scores for a particular date
#'
#' This function returns a data frame with all scores on the specified date.
#'
#' Allows the user to look up NHL final scores without going to the internet browser.
#'
#' @param date The specified date for which to look up scores for.
#' @return A data frame with columns for the home and away team names, and for the home and away team scores.
#' @note If the date is in the future, the columns for the scores will be empty.
#' @export
#' @examples
#' scores("2014-11-11")
#' scores("2015-01-01")
#' scores(Sys.Date())
scores <- function(date){
	assertthat::assert_that(check_date(date))
	if(internet_connection()){
		url <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
									date, '.jsonp')
		raw <- RCurl::getURL(url)
		json <- gsub('([a-zA-Z_0-9\\.]*\\()|(\\);?$)', "", raw, perl = TRUE)
		data <- jsonlite::fromJSON(json)$games
		with(data,
				 data.frame(home = paste(htn, htcommon),
				 					 away = paste(atn, atcommon),
				 					 home_score = hts,
				 					 away_score = ats))
	}
	else
		stop("Please check your internet connection.")
}