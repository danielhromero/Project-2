#Plot1
#Daniel Romero


NEI <- readRDS("summarySCC_PM25.rds")

pd <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)
# Plot 1

png('plot1.png', width=480, height=480)
plot(pd$year, pd$Emissions, type = "l",
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions")
dev.off()
