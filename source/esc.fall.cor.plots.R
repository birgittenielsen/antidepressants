ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

library(car)


#Scatterplot med H202 og vægt i forhold til grupper
scatterplot(H202.ROX ~ weight | Gruppe, data=ecs.fall, 
            main="Electroconvulsive Stimulation", 
            ylab="H202 ROX Flux (pmol/ml*s)", 
            xlab="Weight (g)",
            ylim=c(0,1.7),
            legend.plot=FALSE
)

legend("bottomright", 
       c("Control", "ECS"), 
       pch=c(1,2), 
       col=c(1,2), 
       title="Group")

ecs.fall.0 <- subset(ecs.fall, Gruppe==0)
ecs.fall.1 <- subset(ecs.fall, Gruppe==1)

#Matrix scatterplots med respiration             
pairs(~FPM.CII+FPM.CI.CII+FPM.ETS,data=ecs.fall.1, 
      main="ECS - Mitochondrial Respiration")

pairs(~FPM.CII+FPM.CI.CII+FPM.ETS,data=ecs.fall.0, 
      main="ECS Control- Mitochondrial Respiration")

pairs(~FPM.CII+FPM.CI.CII+FPM.ETS,data=ecs.fall, 
      main="ECS All- Mitochondrial Respiration")

#Correlation med oxo og H202 ROX 
scatterplot(H202.ROX ~ oxo | Gruppe, data=ecs.fall, 
            main="Electroconvulsive Stimulation", 
            ylab="H202 ROX Flux (pmol/ml*s)", 
            xlab="8oxoGuo",
            ylim=c(0,1.7))