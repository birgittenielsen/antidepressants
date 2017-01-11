ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

ecs.fall.ow <- ecs.fall[c(2:3,25:26)]

ecs.fall.ow <- na.omit(ecs.fall.ow)

a <- min(ecs.fall.ow$oxo[which(ecs.fall.ow$Gruppe==0)])
b <- min(ecs.fall.ow$oxo[which(ecs.fall.ow$Gruppe==1)])
c <- max(ecs.fall.ow$oxo[which(ecs.fall.ow$Gruppe==0)])
d <- max(ecs.fall.ow$oxo[which(ecs.fall.ow$Gruppe==1)])

ecs.fall.ow$norm <- NA


ecs.fall.ow$norm[which(ecs.fall.ow$Gruppe == 1)] <- 
  (ecs.fall.ow$oxo[which(ecs.fall.ow$Gruppe==1)]-b)/d 

ecs.fall.ow$norm[which(ecs.fall.ow$Gruppe == 0)] <- 
  (ecs.fall.ow$oxo[which(ecs.fall.ow$Gruppe==0)]-a)/c 

t.test(norm ~ Gruppe, data=ecs.fall.ow, var.equal=TRUE)
