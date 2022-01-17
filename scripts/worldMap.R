library(mapproj)
library(mapdata)

coordTable  <- read.table("../target/coords.csv", 
                          header = TRUE, 
                          sep=";")

png(filename = "../target/wolrdMap.png", 
    width = 600)

map('world',
    col="lightskyblue", 
    fill=TRUE,
    border="lightskyblue",
    ylim = c(-60, 90))

points(coordTable$Longitude,
       coordTable$Latitude, 
       pch=20, 
       cex=2, 
       col="red")  

# legend("bottomleft", 
#        c("PH centers connected to GoDeep","Ethical approval pending"), 
#        fill = c("red","indianred1"), 
#        bty = "n")

dev.off()