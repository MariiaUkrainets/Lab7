NEI <- readRDS("E:\\R\\summarySCC_PM25.rds") 
SCC <- readRDS("E:\\R\\Source_Classification_Code.rds") 

#4. Як змінилися викиди від джерел спалювання вугілля (coal combustionrelated sources)в США у 1999–2008 роках у США? 

coal <- SCC[grep("coal", SCC$SCC.Level.Four, ignore.case = T), ]
comb <- SCC[grep("comb", SCC$SCC.Level.One, ignore.case = T), ]

coal_comb <- merge(coal, comb)
coal_comb_df <- merge(NEI, coal_comb)
sum_coal_comb <- aggregate(Emissions~year, coal_comb_df, sum)

png("plot4.png", width=480, height=480)
plot(sum_coal_comb, type = "l", xlab = "Year",  ylab = "Emissions of PM2.5 (tons)", main = "Total Emissions of PM2.5 from U.S. Coal Combustion-related Sources", xaxt = "n")
years <- c(1999,2002,2005,2008)
axis(1, at = years, labels = years);
dev.off()

#Викиди від джерел спалювання вугілля (coal combustionrelated sources)в США у 1999–2008 роках зменшились.
