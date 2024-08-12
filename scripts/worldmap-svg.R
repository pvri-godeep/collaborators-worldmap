library(mapproj)
library(mapdata)

coordTable  <- read.table("target/coords.csv", 
                          header = TRUE, 
                          sep=";")

svg(filename="target/worldmap-latest.svg", width=9, height=6)


map('world',
    col="#b6e0fc", # lightskyblue
    fill=TRUE,
    border="#b6e0fc",
    ylim = c(-60, 90))



# etl_status - talks
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

# close output image file
dev.off()


# generate map for web site
svg(filename="target/worldmap-web-latest.svg", width=9, height=6)

map('world',
    col="#b6e0fc", # lightskyblue
    fill=TRUE,
    border="#b6e0fc",
    ylim = c(-60, 90))



# etl_status - talks
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
       col="red")

# etl_status - connected
points(coordTable$Longitude[coordTable$etl_status == 'connected'],
       coordTable$Latitude[coordTable$etl_status == 'connected'], 
       pch=20, 
       cex=1.5, 
       col="red")

legend(x=-40,y=-35, border="white", c("PH centers connected to GoDeep","Ethical approval pending"), fill = c("red","slategray"), bty = "n")

dev.off()
