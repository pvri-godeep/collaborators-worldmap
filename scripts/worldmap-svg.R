library(mapproj)
library(mapdata)

coordTable  <- read.table("../target/coords.csv", 
                          header = TRUE, 
                          sep=";")

#png(filename = "../target/wolrdMap.png", width = 600)

# for SVG change remove PNG above and uncomment the following line
svg(filename="../target/worldmap-latest.svg", width=9, height=6)


map('world',
    col="#b6e0fc", # lightskyblue
    fill=TRUE,
    border="#b6e0fc",
    ylim = c(-60, 90))



# etl_status - pending
points(coordTable$Longitude[coordTable$etl_status == 'talks'],
       coordTable$Latitude[coordTable$etl_status == 'talks'], 
       pch=20, 
       cex=1.5, 
       col="slategray")
       
# etl_status - pending
points(coordTable$Longitude[coordTable$etl_status == 'pending' | coordTable$etl_status == 'etl'],
       coordTable$Latitude[coordTable$etl_status == 'pending' | coordTable$etl_status == 'etl'], 
       pch=20, 
       cex=1.5, 
       col="#ff6600")
# was pink3

# etl_status - connected
points(coordTable$Longitude[coordTable$etl_status == 'connected'],
       coordTable$Latitude[coordTable$etl_status == 'connected'], 
       pch=20, 
       cex=1.5, 
       col="red")



# legend("bottomleft", 
#        c("PH centers connected to GoDeep","Ethical approval pending"), 
#        fill = c("red","indianred1"), 
#        bty = "n")

dev.off()
