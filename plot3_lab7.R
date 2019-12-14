NEI <- readRDS("E:\\R\\summarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

#3. З чотирьох типів джерел, позначених змінною type (point, non-point, onroad, or non-road), для якого з цих чотирьох джерел спостерігалось зменшення викидів у 1999–2008 роках для міста Балтімор? Для яких спостерігалося збільшення викидів у 1999–2008 роках? Скористайтеся системою ggplot2, для побудови графіків для відповіді на ці запитання. 

library(ggplot2)

sum_fips_4 <- aggregate(Emissions~fips+type+year, NEI, sum)
Baltimore_4 <- subset(sum_fips_4, fips=="24510")

png("plot3.png", width=480, height=480)
qplot(x=year, y=Emissions, data=Baltimore_4, facets=.~type, geom = c("point", "line"), xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 by the type of source in Baltimore", color=type)
dev.off()

#Зменшування викидів в Балтиморі у 1999–2008 роках спостерігалося в наступних типах джерел: non-point, onroad, or non-road, а збільшення - в point.
