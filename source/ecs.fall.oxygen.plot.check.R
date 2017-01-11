ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

ecs.fall0 <- subset(ecs.fall, Gruppe == 0)
ecs.fall1 <- subset(ecs.fall, Gruppe == 1)

shapiro.test(ecs.fall0$FPM.ETS)
shapiro.test(ecs.fall1$FPM.ETS)

hist(ecs.fall0$FPM.ETS, las=1)

hist(ecs.fall1$FPM.ETS, las=1)

bartlett.test(FPM.ETS ~ Gruppe, data=ecs.fall)

shapiro.test(ecs.fall0$FPM.CII)
shapiro.test(ecs.fall1$FPM.CII)

hist(ecs.fall0$FPM.CII, las=1)

hist(ecs.fall1$FPM.CII, las=1)

bartlett.test(FPM.CII ~ Gruppe, data=ecs.fall)

shapiro.test(ecs.fall0$FPM.CI.CII)
shapiro.test(ecs.fall1$FPM.CI.CII)

hist(ecs.fall0$FPM.CI.CII, las=1)

hist(ecs.fall1$FPM.CI.CII, las=1)

bartlett.test(FPM.CI.CII ~ Gruppe, data=ecs.fall)

