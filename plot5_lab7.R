NEI <- readRDS("E:\\R\\summarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

#5. Як змінилися викиди від автомобільних джерел (motor vehicle sources) у 1999–2008 роках у місті Балтимор? 

motor_vehicle_sources <- SCC[grep("Vehicle", SCC$SCC.Level.Three, ignore.case = T), ]
motor_vehicle_sources_df <- merge(NEI, motor_vehicle_sources, by="SCC")
Baltimore <- subset(motor_vehicle_sources_df, fips=="24510")
motor_vehicle_sources_df <- aggregate(Emissions~year, Baltimore, sum)

png("plot5.png", width=480, height=480)
plot(motor_vehicle_sources_df, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from Motor Vehicle 
     Sources in Baltimore, Maryland", xaxt = "n")
years <- c(1999,2002,2005,2008)
axis(1, at = years, labels = years)
dev.off()

#Викиди від автомобільних джерел (motor vehicle sources) у 1999–2008 роках у місті Балтимор зменшилися.
