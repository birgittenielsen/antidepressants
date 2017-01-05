ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

plot.oxo <- boxplot(oxo ~ Gruppe, data=ecs.spring, 
        main="ECS Spring - 8oxoGuo Ratio", 
        ylab="8oxoGuo Pr. 10E6 Guo", 
        names=c("Control", "ECS"), 
        col=c(8,11), 
        las=1)

#Delete outliner
ecs.spring.red <- subset(ecs.spring, oxo != 66.7)

plot.oxo.red <- boxplot(oxo ~ Gruppe, data=ecs.spring.red, 
                    main="ECS Spring - 8oxoGuo Ratio", 
                    ylab="8oxoGuo Pr. 10E6 Guo", 
                    names=c("Control", "ECS"), 
                    col=c(8,11), 
                    las=1, 
                    ylim=c(0,15))

a <- mean(ecs.spring.red$oxo[which(ecs.spring.red$Gruppe==0)], na.rm=TRUE)
b <- mean(ecs.spring.red$oxo[which(ecs.spring.red$Gruppe==1)], na.rm=TRUE)
text(1,8, sprintf("mean %.1f",round(a,1)))
text(2,9.7, sprintf("mean %.1f",round(b,1)))


plot.weight <- boxplot(weight ~ Gruppe, data=ecs.spring,
                       main="ECS Spring - Weight",
                       ylab="Gram",
                       names=c("Control", "ECS"),
                       las=1, 
                       col=c(8,11))
              

ecs.spring. <- read.csv("./data/raw/ecs.spring.csv", header=TRUE, sep=";", dec=",")

plot.h202 <- boxplot(H202 ~ Gruppe*State, data=ecs.spring., 
        col=c(8,11), 
        main="ECS Spring - H2O2 Flux", 
        ylab="pmol/ml*s", 
        names=c("Complex I", "Complex I", "Complex I+II", "Complex I+II", "Complex II", "Complex II", "Complex III", "Complex III", "ETS", "ETS", "LEAK", "LEAK", "ROUTINE", "ROUTINE", "ROX", "ROX"),
        las=2,)
        legend("topleft", c("Control", "ECS"), col=c(8,11), pch=15)
        
plot.o2 <- boxplot(FPM ~ Gruppe*State, data=ecs.spring., 
                   col=c(8,11), 
                   main="ECS Spring - O2 Flux", 
                   ylab="pmol/ml*s", 
                   names=c("Complex I", "Complex I", "Complex I+II", "Complex I+II", "Complex II", "Complex II", "Complex III", "Complex III", "ETS", "ETS", "LEAK", "LEAK", "ROUTINE", "ROUTINE", "ROX", "ROX"),
                   par(las=2))
          legend("topleft", c("Control", "ECS"), col=c(8,11), pch=15)
