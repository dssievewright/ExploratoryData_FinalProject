# Exploratory Data Analysis Final Project

This project is for the MOOC "Exploratory Data Analysis" offered through Coursera and John Hopkins University.  The original data and documentation was gathered through the EPA.  See their [Air Emmisions Inventories website][https://www.epa.gov/air-emissions-inventories] for more information.

## Data

The data I am using has been cleaned up by the instructors and is available at 

* [pm2.5 data][https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip]

The zip file contains two files which will be read in as
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Each .R file in the repo will assume NEI and SCC have been read into R.  

## Variables in the tables

The first table, NEI, contains six columns:

1. **fips**: A five digit code (as a character string) that indicates county.
2. **SCC**: The name of the source (as a character string of digits)
3. **Pollutant**:  A character string indicating the pollutant.  For this project, only fine particulate matter (PM~2.5~) is included.
4. **Emissions**: A numeric indicating amount (in tons) of PM~2.5~ emitted.
5. **type**: Character string indicating the type of source: point, nonpoint, on-road, and non-road. 
6. **year**: The year that the emission was recorded.  Only 1999, 2002, 2005, and 2008 are included for this analysis.

The SCC table has 15 columns. We will be using this to identify the Source Classification Code (SCC) mentioned in NEI to the type of source.  Specifically, we will collect the data on the PM~2.5~ pollutants that are related to coal combustion related sources for plot4 and motor vehicle sources for plots 5 and 6.


## Plots

The following questions are taken from the Instructions page for this assignment:

1. Have total emissions from PM~2.5~ decreased in the United States from 1999 to 2008? Using the **base** plotting system, make a plot showing the total PM~2.5~ emission **from all sources** for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM~2.5~ decreased in the **Baltimore City**, Maryland (**fips == "24510"**) from 1999 to 2008? Use the **base** plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the **type** (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for **Baltimore City**? Which have seen increases in emissions from 1999–2008? Use the **ggplot2** plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in **Baltimore City**?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in **Los Angeles County**, California (**fips == "06037"**). Which city has seen greater changes over time in motor vehicle emissions?


The files plotn.R and plotn.png are the code and plot created that I used to answer question n.