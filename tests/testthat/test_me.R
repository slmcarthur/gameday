# expect case to be ignored
test_that("case is ignored", {
	expect_equal(gday("canucks"), gday("CANUCKS"))
})

# expect that baseball teams don't play hockey; Seattle has no hockey team
test_that("Seattle Mariners are not a hockey team",{
	expect_false(gday"mariners", gday"Seattle")
})

# expect that use either city or team name to query
test_that("city and team name can both be used", {
	expect_equal(gday("boston"), gday("bruins"))
})

# always expect logical return
test_that("always returns logical", {
	expect_is(gday("canucks"), "logical")
})

# expect the check_date returns true for teams that definitely played on those dates
test_that("Vancouver Canucks had a game against Nashville Predators on 2014-11-02", {
	expect_true(gday(team = "canucks",   date = "2014-11-02"))
	expect_true(gday(team = "predators", date = "2014-11-02"))
})

# expect that the check_date returns false for dates where your team did not play
test_that("Boston Bruins did not play on 2014-11-20", {
	expect_false(gday(team = "bruins", date = "2014-11-20"))
})

# checking for check_date error for invalid dates
test_that("Vancouver Canucks can't have played on invalid dates", {
	expect_error(gday(team = "canucks", date = "208-113-22"))
	expect_error(gday(team = "canucks", date = "today"))
})

####### NEED TO CHANGE

# Checking scores function
test_that("Score function returns a data frame", {
	expect_is(scores(Sys.Date()), "data.frame")
})
# Check failure when date is invalid
test_that("Can't check scores for invalid date", {
	expect_error(scores("today"))
	expect_error(scores("201-01-01"))
})