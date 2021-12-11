hms(56, 34, 12)
hms()

as.hms(1)
as.hms("12:34:56")
as.hms(Sys.time())
as.POSIXct(hms(1))

data.frame(a = hms(1))
d <- data.frame(hours = 1:3)

d$hours <- hms(hours = d$hours)
d
