
library(lubridate)


Sys.getlocale("LC_TIME")
## [1] "en_CA.UTF-8"




# Create an object
bday <- dmy("23121984")



wday(bday) # day of the week
wday(bday, label=T) # day of the week, abreviated
yday(bday) # day of the year


this_day <- today()
this_day
## [1] "2015-08-09"


y <- year(this_day)
m <- month(this_day)
d <-day(this_day)

rbind(y,m,d)

w <- wday(this_day)
m <- mday(this_day)
y <- yday(this_day)

rbind(w,m,y)


wday(this_day, label = TRUE)
## [1] Sun
## Levels: Sun < Mon < Tues < Wed < Thurs < Fri < Sat


### Date-time

In addition to handling dates, lubridate is great for working with date and time combinations, referred to as date-times. The `now()` function returns the date-time representing this exact moment in time. We store the result in a variable called this_moment.


this_moment <- now()
this_moment



hr <- hour(this_moment)
minu <- minute(this_moment)
sec <- second(this_moment)

rbind(hr,minu,sec)


my_date <- ymd("1989-05-17")
my_date
## [1] "1989-05-17 UTC"


It looks almost the same, except for the addition of a time zone, which we’ll discuss later in the lesson. Below the surface, there’s another important change that takes place when lubridate parses a date.



class(my_date)
## [1] "POSIXct" "POSIXt"


ymd("1989 May 17")
## [1] "1989-05-17 UTC"

Despite being formatted differently, the last two dates had the year first, then the month, then the day. Hence, we used ymd() to parse them. What about the appropriate function is for parsing “March 12, 1975” ?



mdy("March 12, 1975")
## [1] "1975-03-12 UTC"



dmy(25081985)
## [1] "1985-08-25 UTC"



ymd("192012")
## Warning: All formats failed to parse. No formats found.
## [1] NA



# or ymd("1920-1-2")
ymd("1920/1/2")
## [1] "1920-01-02 UTC"




dt1 <- '2014-08-23 17:23:02'

ymd_hms(dt1)
## [1] "2014-08-23 17:23:02 UTC"


What if we have a time, but no date? Lets use the appropriate lubridate function to parse “03:22:14” (hh:mm:ss).
```{r}
hms("03:22:14")
## [1] "3H 22M 14S"
```

lubridate is also capable of handling vectors of dates, which is particularly helpful when you need to parse an entire column of data.



```{r}
dt2 <- c('2014-05-14', '2014-09-22', '2014-07-11')

ymd(dt2)
## [1] "2014-05-14 UTC" "2014-09-22 UTC" "2014-07-11 UTC"
```

### Update date-time

The `update()` function allows us to update one or more components of a date-time. For example, let’s say the current time is 08:34:55 (hh:mm:ss). Lets update this_moment to the new time using update(this_moment, hours = 8, minutes = 34, seconds = 55).


update(this_moment, hours = 8, minutes = 34, seconds = 55)
## [1] "2015-08-09 08:34:55 EDT"
Lets update() this_moment, so that it contain the new time.



this_moment <- update(this_moment, hours = 11, minutes = 55, seconds = 0)
this_moment
## [1] "2015-08-09 11:55:00 EDT"



nyc <- now("America/New_York")
nyc
## [1] "2015-08-09 11:19:08 EDT"



depart <- nyc + days(2)
depart
## [1] "2015-08-11 11:19:08 EDT"



depart <- update(depart, hours = 17, minutes = 34)
depart
## [1] "2015-08-11 17:34:08 EDT"



arrive <- depart + hours(15) + minutes(50)
arrive
## [1] "2015-08-12 09:24:08 EDT"



arrive <- with_tz(arrive, "Asia/Hong_Kong")
arrive
## [1] "2015-08-12 21:24:08 HKT"



last_time <- mdy("June 17, 2008", tz = "Singapore")
last_time
## [1] "2008-06-17 SGT"



how_long <- interval(last_time, arrive)
how_long
## [1] 2008-06-17 SGT--2015-08-12 21:24:08 SGT



Now use as.period() to see how long it’s been.
```{r}
as.period(how_long)
## Warning in Ops.factor(left, right): '-' not meaningful for factors
## [1] "7y 1m 26d 21H 24M 8.27182102203369S"
```


library(lubridate)

lubridate also makes it easy to calculate with dates


# day of week one year later
wday(bday + years(1), label=T)
# days of the week for next 100 years.
table(sapply(1:100, function(x) wday(bday + years(x), label=T)))
1
