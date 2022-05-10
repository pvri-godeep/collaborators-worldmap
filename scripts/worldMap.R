library(mapproj)
library(mapdata)

coordTable  <- read.table("../target/coords.csv", 
                          header = TRUE, 
                          sep=";")

png(filename = "../target/wolrdMap.png", width = 600)

# for SVG change remove PNG above and uncomment the following line
#svg(filename="../target/worldMap.svg", width=9, height=6)


map('world',
    col="lightskyblue", 
    fill=TRUE,
    border="lightskyblue",
    ylim = c(-60, 90))


# etl_status - pending
points(coordTable$Longitude[coordTable$etl_status == 'pending'],
       coordTable$Latitude[coordTable$etl_status == 'pending'], 
       pch=20, 
       cex=1, 
       col="pink3")


# etl_status - connected
points(coordTable$Longitude[coordTable$etl_status == 'connected'],
       coordTable$Latitude[coordTable$etl_status == 'connected'], 
       pch=20, 
       cex=1, 
       col="red")



# legend("bottomleft", 
#        c("PH centers connected to GoDeep","Ethical approval pending"), 
#        fill = c("red","indianred1"), 
#        bty = "n")

dev.off()