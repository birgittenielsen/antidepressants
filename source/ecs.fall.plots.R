ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

boxplot(oxo ~ Gruppe, data=ecs.fall, main="ECS - 8oxoGuo Ratio", 
        names=c("Control", "ECS"), ylab="8oxoGuo Pr. 10E6 Guo", col=c(16,11))

boxplot(H202.ROX ~ Gruppe, data=ecs.fall, 
        main="ECS - H202 Flux in Residual Oxygen Consumption State", 
        names=c("Control", "ECS"), ylab="H202 [pmol/ml*s]", col=c(16,11))