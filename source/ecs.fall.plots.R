ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

boxplot(weight ~ Gruppe, data=ecs.fall,
                       main="ECS Fall - Weight", 
                       ylab="Gram", 
                       names=c("Control", "ECS"),
                       col=c(16,11), 
                       las=1)


boxplot(oxo ~ Gruppe, data=ecs.fall, 
        main="ECS Fall - 8oxoGuo Ratio", 
        names=c("Control", "ECS"), 
        ylab="8oxoGuo Pr. 10E6 Guo", 
        col=c(16,11),
        las=1, 
        ylim=c(0,10))

a <- mean(ecs.fall$oxo[which(ecs.fall$Gruppe==0)], na.rm=TRUE)
b <- mean(ecs.fall$oxo[which(ecs.fall$Gruppe==1)], na.rm=TRUE)
text(1,5, sprintf("mean %.1f",round(a,1)))
text(2,9.5, sprintf("mean %.1f",round(b,1)))

boxplot(H202.ROX ~ Gruppe, data=ecs.fall, 
        main="ECS - H202 Flux in Residual Oxygen Consumption State", 
        names=c("Control", "ECS"), 
        ylab="H202 [pmol/ml*s]", 
        col=c(16,11))

ecs.fall. <- read.csv("./data/raw/ecs.fall.csv", header=TRUE, sep=";", dec=",")

boxplot(H202 ~ Gruppe*State, data=ecs.fall., 
                     col=c(16,11), 
                     main="ECS Fall - H2O2 Flux", 
                     ylab="pmol/ml*s", 
                     names=c("Complex I", "Complex I", "Complex I+II", "Complex I+II", "Complex II", "Complex II", "Complex III", "Complex III", "ETS", "ETS", "LEAK", "LEAK", "ROUTINE", "ROUTINE", "ROX", "ROX"),
                     las=2)
legend("topleft", c("Control", "ECS"), col=c(8,11), pch=15)
