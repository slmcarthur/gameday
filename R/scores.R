#' What was the final score?
#'
#' This function returns a data.frame with all scores from NHL games played on a certain date.
#'
#' The user can look up NHL final scores for whichever day they please, without starting up a web browser.
#'
#' @param date The specified date for which you want to know the scores.
#' @return A data frame with the home and away team names and their scores for that day.
#' @export
#' @examples
#' scores("2014-11-19")
#' scores("2013-10-01")
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
