library(mapproj)
library(mapdata)

coordTable  <- read.table("../target/coords.csv", 
                          header = TRUE, 
                          sep=";")


png(filename = "../target/legend.png",
    width = 600)


map('world',
    col="white")


legend("topleft", 
       c("PH centers connected to GoDeep","Ethical approval pending"), 
       fill = c("red","pink"), 
       bty = "n")


dev.off()