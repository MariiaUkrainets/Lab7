NEI <- readRDS("E:\\R\\summarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

#6. Порівняйте викиди від автомобільних джерел у місті Балтимор із аналогічними викидами в окрузі Лос-Анджелес, Каліфорнія (fips == "06037"). У якому місті відбулися значні зміни з часом у викидах від автомобільних джерел? 

motor_vehicle_sources_1 <- SCC[grep("Vehicle", SCC$SCC.Level.Three, ignore.case = T), ]
motor_vehicle_sources_df1 <- merge(NEI, motor_vehicle_sources_1, by="SCC")

Baltimore_LA <- subset(motor_vehicle_sources_df1, fips=="24510" | fips=="06037")

motor_vehicle_Baltimore_LA <- aggregate(Emissions~fips+year, Baltimore_LA, sum)

png("plot6.png", width=480, height=480)
ggplot(motor_vehicle_Baltimore_LA, aes(year, Emissions))+geom_line(aes(color=fips))+geom_point(aes(color=fips))+
  labs(title = "Total Emissions of PM2.5 from Motor Vehicle sources in Baltimore, Maryland, and Los Angeles, California")+labs(x = "Year", y = "Emissions of PM2.5 (tons)")+
  scale_color_discrete(name = "Fips", labels = c("Los Angeles", "Baltimore"))
dev.off()

#У місті Балтимор відбулися значне зменшення з часом викидів від автомобільних джерел протягом 1999-2008 рр, а в місті Лос-Анджелес відбулося зростання викидів від автомобільних джерел протягом 1999-2005рр, а протягом 2005-2008рр - викиди зменшувалися.
