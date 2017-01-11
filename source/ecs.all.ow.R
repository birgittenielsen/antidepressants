# SKAL IKKE BRUGES!

weight <- read.csv("./data/raw/weight.copy.csv", header=TRUE, sep=";", dec=",")

weight <- weight[order(weight$ID),]

weight.ecs <- subset(weight, ID < 21 | ID > 1000)

weight.ecs$Gruppe <- c(1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1)

oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")
oxo.all <- oxo.all[order(oxo.all$ID),]

oxo.all.ecs <- subset(oxo.all, ID < 21 | ID > 1000)

stopifnot(all(weight.ecs$ID == oxo.all.ecs$ID))

weight.ecs$oxo <- oxo.all.ecs$Ratio

ecs.all.ow <- subset(weight.ecs, oxo != 66.7)

a <- min(ecs.all.ow$oxo[which(ecs.all.ow$Gruppe==0)], na.rm=TRUE)
b <- min(ecs.all.ow$oxo[which(ecs.all.ow$Gruppe==1)], na.rm=TRUE)
c <- max(ecs.all.ow$oxo[which(ecs.all.ow$Gruppe==0)], na.rm=TRUE)
d <- max(ecs.all.ow$oxo[which(ecs.all.ow$Gruppe==1)], na.rm=TRUE)

ecs.all.ow$oxo-1

ecs.all.ow$norm <- ecs.all.ow$oxo[which(ecs.all.ow$Gruppe==0)]-a)/c
