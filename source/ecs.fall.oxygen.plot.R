ecs.fall <- read.csv("./data/raw/ecs.fall.csv", header=TRUE, sep=";", dec=",")
ecs.fall.fpm <- ecs.fall[,-c(4,6)]

ecs.fall.fpm.g <- ecs.fall.fpm[which(ecs.fall.fpm$State=="CII" | 
                                 ecs.fall.fpm$State=="CI.CII" | 
                                 ecs.fall.fpm$State=="ETS"),]

ecs.fall.fpm.g$State <- factor(ecs.fall.fpm.g$State)

boxplot(FPM~Gruppe*State, 
        data=ecs.fall.fpm.g, 
        ylim=c(0,160), 
        names=c("Oxphos Capacity", "Oxphos Capacity", "Complex II", 
                "Complex II", "ETS Capacity", "ETS Capacity"),  
        main="ECS Fall - O2 Flux", 
        ylab="pmol/ml*s", 
        las=1,
        col=c(16,11))

ws.ecs.fall <- reshape(ecs.fall, 
                       timevar="State", 
                       idvar=c("ID", "Gruppe"), 
                       direction="wide")


a <- mean(ws.ecs.fall$FPM.CI.CII[which(ws.ecs.fall$Gruppe==0)], na.rm=TRUE)
b <- mean(ws.ecs.fall$FPM.CI.CII[which(ws.ecs.fall$Gruppe==1)], na.rm=TRUE)
text(1,80, sprintf("mean %.1f",round(a,1)))
text(2,70, sprintf("mean %.1f *",round(b,1)))
c <- mean(ws.ecs.fall$FPM.CII[which(ws.ecs.fall$Gruppe==0)], na.rm=TRUE)
d <- mean(ws.ecs.fall$FPM.CII[which(ws.ecs.fall$Gruppe==1)], na.rm=TRUE)
text(3,57, sprintf("mean %.1f",round(c,1)))
text(4,47, sprintf("mean %.1f *",round(d,1)))
e <- mean(ws.ecs.fall$FPM.ETS[which(ws.ecs.fall$Gruppe==0)], na.rm=TRUE)
f <- mean(ws.ecs.fall$FPM.ETS[which(ws.ecs.fall$Gruppe==1)], na.rm=TRUE)
text(5,125, sprintf("mean %.1f",round(c,1)))
text(6,113, sprintf("mean %.1f *",round(d,1)))

title(sub="*:p-value<0.05, n control: 8, n ECS: 6, ETS=Electron Transfer System", adj=0.1)
legend("topleft", c("ECS", "Control"), col=c(11,16), pch=15)
