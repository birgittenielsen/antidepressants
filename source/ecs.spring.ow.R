ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

ecs.spring.ow <- ecs.spring[c(2:3,25:26)]

ecs.spring.ow <- subset(ecs.spring.ow, oxo != 66.7)

a <- min(ecs.spring.ow$oxo)
b <- max(ecs.spring.ow$oxo)

ecs.spring.ow$norm <- (ecs.spring.ow$oxo-a)/b

t.test(norm ~ Gruppe, data=ecs.spring.ow, var.equal=TRUE)

boxplot(norm ~ Gruppe, data=ecs.spring.ow,
        names=c("Control", "ECS"), 
        main="ECS Spring Normalized 8oxoGuo", 
        col=c(16,11))
