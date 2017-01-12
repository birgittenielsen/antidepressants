ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

ecs.fall.ow <- ecs.fall[c(2:3,25:26)]

ecs.fall.ow <- na.omit(ecs.fall.ow)

a <- min(ecs.fall.ow$oxo)
b <- max(ecs.fall.ow$oxo)

ecs.fall.ow$norm <- (ecs.fall.ow$oxo-a)/b

t.test(norm ~ Gruppe, data=ecs.fall.ow, var.equal=TRUE)

boxplot(norm ~ Gruppe, data=ecs.fall.ow,
        names=c("Control", "ECS"), 
        main="ECS Fall Normalized 8oxoGuo", 
        col=c(16,11))
