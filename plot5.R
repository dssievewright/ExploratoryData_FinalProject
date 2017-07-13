## Question 5: How have emissions from motor vehicle sources changed from 
## 1999–2008 in Baltimore City?



library(dplyr)
library(ggplot2)

## Find the motor vehicle sources and their total emissions each year.
Veh <- grepl("Veh" ,SCC$Short.Name)
codes <- as.character(SCC[Veh,1])
NEIVeh <- NEI %>% filter(SCC %in% codes) %>% 
            filter(fips == "24510") %>%
            group_by(year) %>% 
            summarize(total = sum(Emissions))

## Plot with a regression line
png("plot5.png")
g <- ggplot(NEIVeh, aes(year,total)) +
    geom_smooth(method = "lm", se = F, linetype = "dashed") +
    geom_point() +
    ggtitle(expression("PM"[2.5]*" Emissions in Baltimore City from Vehicles")) +
    labs(x = "Year", 
         y = expression("Total Emissions (in tons)"))+
    ylim(0, max(NEIVeh$total))
print(g)
dev.off()

## Conclusion: Their is a clear downward trend indicating that vehicle-related
## PM2.5 emissions have decreased over this time period.