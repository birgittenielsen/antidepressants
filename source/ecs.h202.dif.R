ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

#ecs.fall <- na.omit(ecs.fall)

ecs.fall$Absolut.Forskel <- ecs.fall$H202.ROX-ecs.fall$H202.CIII

ecs.fall$Procentvis.Forskel <- (ecs.fall$H202.ROX-ecs.fall$H202.CIII)/ecs.fall$H202.CIII*100

ecs.fall.H202.rox <- subset(ecs.fall, 
                            select=c(ID, Gruppe, H202.CIII, H202.ROX, 
                                     Absolut.Forskel, Procentvis.Forskel))
ecs.fall.H202.rox <- na.omit(ecs.fall.H202.rox)

t.test(Procentvis.Forskel ~ Gruppe, data=ecs.fall.H202.rox, var.equal=TRUE)

boxplot(Procentvis.Forskel ~ Gruppe, data=ecs.fall.H202.rox,
        names=c("Control", "ECS"), 
        col=c(16,11), 
        main="Procentvis stigning af H202 til ROX State")

#ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

#ecs.spring <- na.omit(ecs.spring)

#ecs.spring$Absolut.Forskel <- ecs.spring$H202.ROX-ecs.spring$H202.CIII

#ecs.spring$Procentvis.Forskel <- (ecs.spring$H202.ROX-ecs.spring$H202.CIII)/ecs.spring$H202.CIII*100

#ecs.spring.H202.rox <- subset(ecs.spring, 
 #                           select=c(ID, Gruppe, H202.CIII, H202.ROX, 
  #                                   Absolut.Forskel, Procentvis.Forskel))
