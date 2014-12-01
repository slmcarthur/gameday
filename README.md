gameday
=======

How to install and load my package:

```
library(devtools)
install_github("slmcarthur/gameday")
library(gameday)
```

Here are the functions you can use in this package and an example of how you might call these functions:

```
# you can ask whether a specifc NHL team plays today
gday("canucks")

# you can also ask whether they played on a different day
gday(team = "vancouver", date = "2014-11-01")

# you might also be interested in the scores from today
scores(Sys.Date())

# or the scores from a different day
scores("2014-11-01")
```

To find the vignette associated with this package, you can look it up on the R command line like so:

```
browseVignettes(package = "gameday")
```

You can also find the vignette for this package [here](http://127.0.0.1:26066/library/gameday/doc/overview.html).

