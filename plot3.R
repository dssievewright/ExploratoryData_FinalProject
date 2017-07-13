## Question 3: Of the four types of sources indicated by the type 
## (point, nonpoint, onroad, nonroad) variable, which of these four 
## sources have seen decreases in emissions from 1999–2008 for 
## Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.



## I plotted each of the source types and added a linear regression.
library(dplyr)
library(ggplot2)
Baltgs <- NEI %>% filter(fips == "24510") %>%
              group_by(year, type) %>%
              summarize(total = sum(Emissions))
png("plot3.png")
g <- ggplot(Baltgs, aes(year, total)) + 
     facet_wrap(~type, nrow =2) + 
     geom_smooth(method = "lm", se = F) + 
     geom_point() + 
     ggtitle("Total Emissions in Boltimore City") +
     theme(plot.title = element_text(size=15, hjust = .5)) +
     labs(x = "Year", 
          y = expression("Total PM"[2.5]*" emissions (in tons)"))
print(g)
dev.off()


## Conclusion: The non-road, nonpoint, and on-road types have all 
## been decreasing while point has increased.  The first three show 
## a clear downward trend while the last type is quite unclear.
## There is a significant jump in the point type in 2005 before 
## coming back down again in 2008.  More data should be studied.


