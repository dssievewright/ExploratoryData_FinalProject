## Question 6: Compare emissions from motor vehicle sources in Baltimore City 
## with emissions from motor vehicle sources in Los Angeles County, California 
## (fips == "06037"). Which city has seen greater changes over time in motor 
## vehicle emissions?


library(dplyr)
library(ggplot2)

## Find the motor vehicle sources and their total emissions each year.
Veh <- grepl("Veh" ,SCC$Short.Name)
codes <- as.character(SCC[Veh,1])
NEIVeh <- NEI %>% filter(SCC %in% codes) %>% 
    filter(fips == "24510" | fips == "06037") %>%
    group_by(year, fips) %>% 
    summarize(total = sum(Emissions))

## Plot with a regression line
png("plot6.png")
g <- ggplot(NEIVeh, aes(year,total)) +
    facet_grid(.~fips, 
               labeller = as_labeller(c("06037" = "Los Angeles County", "24510"= "Baltimore City"))) +
    geom_smooth(method = "lm", se = F, linetype = "dashed") +
    geom_point() +
    ggtitle(expression("PM"[2.5]*" Emissions from Vehicles")) +
    labs(x = "Year", 
         y = expression("Total Emissions (in tons)"))
print(g)
dev.off()

## Conclusion:  While I could change the scales to make the indpendent trends
## more obvious, the current plot does answer our original question.  In LA,
## the PM2.5 emissions from vehicles have actually increased while the opposite
## is true in Baltimore City.