## Question 4: Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999–2008?

library(dplyr)
library(ggplot2)
## I used the Short.Name to determine which come from coal combustion.
## Searching for "coal" gives charcoal-related sources.  I decided to 
## not include those.
f1 <- grepl("Coal", SCC$Short.Name)
f2 <- grepl("Comb", SCC$Short.Name)
f3 <- f1&f2
flist <- as.character(SCC[f3,1])

##Selecting codes to filter NEI and plotting with a regression line
NEIcoal <- NEI %>% filter(SCC %in% flist) %>% 
                   group_by(year) %>% 
                   summarize(total = sum(Emissions))
png("plot4.png")
g <- ggplot(NEIcoal, aes(year,total)) +
     geom_smooth(method = "lm", se = F, linetype = "dashed") +
     geom_point() +
     ggtitle(expression("Coal Combustion-related PM"[2.5]*" Emissions")) +
     labs(x = "Year", 
          y = expression("Total Emissions (in tons)"))+
     ylim(0, max(NEIcoal$total) + 100000)
print(g)
dev.off()


## Conclusion: The overall trend is decreasing. While somewhat static 
## (although decreasing) between 1999 and 2005, there was a large 
## decrease in coal combustion-related particles in 2008. 
