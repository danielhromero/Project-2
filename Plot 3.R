#Plot 3
# Daniel Romero

NEI <- readRDS("summarySCC_PM25.rds")

BC <- subset(NEI, fips == "24510")
pd <- aggregate(BC[c("Emissions")], list(type = BC$type, year = BC$year), sum)


# Plot 3
png('plot3.png', width=480, height=480)

p <- ggplot(pd, aes(x=year, y=Emissions, colour=type)) +
        geom_point(alpha=.3) +
        geom_smooth(alpha=.2, size=1, method="loess") +
        ggtitle("Total Emissions by Type in Baltimore City")

print(p)

dev.off()