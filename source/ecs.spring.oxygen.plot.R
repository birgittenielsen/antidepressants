ecs.spring <- read.csv("./data/raw/ecs.spring.csv", header=TRUE, sep=";", dec=",")
ecs.spring.fpm <- subset(ecs.spring, select=c("ID", "Gruppe", "State", "FPM"))

ecs.spring.fpm.g <- ecs.spring.fpm[which(ecs.spring.fpm$State=="CII" | 
                                       ecs.spring.fpm$State=="CI.CII" | 
                                       ecs.spring.fpm$State=="ETS"),]

ecs.spring.fpm.g$State <- factor(ecs.spring.fpm.g$State)

boxplot(FPM~Gruppe*State, 
        data=ecs.spring.fpm.g, 
        ylim=c(0,160), 
        names=c("Oxphos Capacity", "Oxphos Capacity", "Complex II", 
                "Complex II", "ETS Capacity", "ETS Capacity"),  
        main="ECS Spring - O2 Flux", 
        ylab="pmol/ml*s", 
        las=1,
        col=c(16,11))

ws.ecs.spring <- reshape(ecs.spring, 
                       timevar="State", 
                       idvar=c("ID", "Gruppe"), 
                       direction="wide")


a <- mean(ws.ecs.spring$FPM.CI.CII[which(ws.ecs.spring$Gruppe==0)], na.rm=TRUE)
b <- mean(ws.ecs.spring$FPM.CI.CII[which(ws.ecs.spring$Gruppe==1)], na.rm=TRUE)
text(1,95, sprintf("mean %.1f",round(a,1)))
text(2,92, sprintf("mean %.1f",round(b,1)))
c <- mean(ws.ecs.spring$FPM.CII[which(ws.ecs.spring$Gruppe==0)], na.rm=TRUE)
d <- mean(ws.ecs.spring$FPM.CII[which(ws.ecs.spring$Gruppe==1)], na.rm=TRUE)
text(3,57, sprintf("mean %.1f",round(c,1)))
text(4,50, sprintf("mean %.1f",round(d,1)))
e <- mean(ws.ecs.spring$FPM.ETS[which(ws.ecs.spring$Gruppe==0)], na.rm=TRUE)
f <- mean(ws.ecs.spring$FPM.ETS[which(ws.ecs.spring$Gruppe==1)], na.rm=TRUE)
text(5,147, sprintf("mean %.1f",round(c,1)))
text(6,155, sprintf("mean %.1f",round(d,1)))

title(sub="n: control 6; ECS 6, ETS=Electron Transfer System", adj=0.1)
legend("bottomright", c("ECS", "Control"), col=c(11,16), pch=15)
