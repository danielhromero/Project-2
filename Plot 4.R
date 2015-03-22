#Plot 4
# Daniel Romero

NEI <- readRDS("summarySCC_PM25.rds")
SRC <- readRDS("exdata-data-NEI_dataSource_Classification_Code.rds")

CC <- grep("coal",SRC$EI.Sector,value=T,ignore.case=T)
SRC.CC <- subset(SRC, SRC$EI.Sector %in% CC, select=SCC)
NEI.CC <- subset(NEI, NEI$SCC %in% SRC.CC$SCC)
pd <- aggregate(NEI.CC[c("Emissions")], list(year = NEI.CC$year), sum)
# Plot 4

png('plot4.png', width=480, height=480)
p <- ggplot(pd, aes(x=year, y=Emissions)) +
        geom_point(alpha=.3) +
        geom_smooth(alpha=.2, size=1) +
        ggtitle("Total PM2.5 Coal Combustion Emissions in the US")

print(p)
dev.off()