## Question 1: Have total emissions from PM2.5 decreased in the United States 
## from 1999 to 2008? Using the **base** plotting system, make a plot showing 
## the total PM2.5 emission from all sources for each of the 
## years 1999, 2002, 2005, and 2008.


## I am plotting five sets of data.  The first four are boxplots
## of total county emissions for each year of interest. I added a
## baseline value to the boxplot corresponding with the median
## county in 1999.
## The final plot is total US emissions for each year. A linear 
## regression that fits the four data points has been added.

library(dplyr)
NEIsumm <- NEI %>% group_by(fips, year) %>% summarize(total = sum(Emissions))
NEIyear <- NEI %>% group_by(year) %>% summarize(UStotal = sum(Emissions))
png("plot1.png", width = 720)
par(mfrow = c(1,2), oma = c(0,0,2,0), font.main =1)
boxplot(log10(total)~year, data= NEIsumm, 
        xlab= "Year", main = "Per County", 
        ylab = expression("log"[10]*"(Total Emissions (in tons))"))
med99 <-  median(log10(filter(NEIsumm, year == 1999)$total))
abline(h = med99, lty =2, lwd = 2, col = "blue")
plot(NEIyear$year, NEIyear$UStotal, 
     ylab = expression("Total Emissions (in tons)"),
     pch = 20, ylim = c(0, max(NEIyear$UStotal)),
     xlab = "Year",
     main = "US total")
lmus <-lm(NEIyear$UStotal~NEIyear$year)
abline(lmus, lty = 2, lwd = 2, col = "red")
title( main = expression("PM"[2.5]*" Emissions"), outer = T)
dev.off()




## Conclusion:  The overall trend indicates a decrease in total emissions
## across the United States.  Over 75% of 2008's counties fell below
## the median 2009 county. 

## Note 1: Without log the plot is difficult to read as the outliers
## will squish all the boxes.  This will introduce a warning since
## there are seven counties that measure 0 emissions (none are negative).

## Note 2: The number of counties particpating is increasing
## over time (3222 to 3260).  Furthermore, 
## there are 3221 counties that measured total emissions all four years.

## Note 3: The total US emissions decreased from 2002 to 2005 even though
## each quartile appears to have increased. It may be of interest to find 
## what is going on with the extreme outlier (almost 10 times greater than
## the next highest value).