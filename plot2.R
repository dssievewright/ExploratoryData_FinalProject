## Question 2: Have total emissions from PM2.5 decreased in the 
## Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
## Use the base plotting system to make a plot answering this question.


## I have just plotted the total emissions for this county.
## I did add a zero to the y-axis to get a better understanding of 
## the scale of any changes in emissions.
library(dplyr)
Balt <- NEI %>% filter(fips == "24510") %>%
          group_by(year) %>%
          summarize(total = sum(Emissions))
png("plot2.png")
with(Balt, plot(year, total, type="l", lwd =2,
                ylim=c(0, max(Balt$total)),
                xlab = "Year", 
                ylab = expression("PM"[2.5]*" emissions (in tons)"),
                main = expression("Baltimore PM"[2.5]*" Emissions")))
dev.off()


## Conclusion: There is an overall trend indicating that the county of Baltimore
## City, Maryland saw a decrease in the total PM2.5 emissions between 1999
## and 2008.  