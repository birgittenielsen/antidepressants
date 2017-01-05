oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")
oxo.all <- oxo.all[order(oxo.all$ID),]

oxo.all.ecs <- subset(oxo.all, ID < 21 | ID > 1000)

t.test(Ratio ~ Gruppe, data=oxo.all.ecs)

boxplot(Ratio ~ Gruppe, data=oxo.all.ecs,
        main="ECS All - 8-oxoGuo", 
        ylab="8oxoGuo Pr. 10E6 Guo",
        col=c(16,11), 
        names=c("Control", "ECS"), 
        las=1)

# ID 7002 tages ud
oxo.all.ecs. <- subset(oxo.all.ecs, ID != 7002)

t.test(Ratio ~ Gruppe, data=oxo.all.ecs.)

boxplot(Ratio ~ Gruppe, data=oxo.all.ecs.,
        main="ECS All - 8-oxoGuo", 
        ylab="8oxoGuo Pr. 10E6 Guo",
        col=c(16,11), 
        names=c("Control", "ECS"), 
        las=1)


#Kør correlation mellem ratio og weight data
