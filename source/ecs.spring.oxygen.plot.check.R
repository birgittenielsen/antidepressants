ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

ecs.spring0 <- subset(ecs.spring , Gruppe == 0)
ecs.spring1 <- subset(ecs.spring , Gruppe == 1)

shapiro.test(ecs.spring0$FPM.ETS)
shapiro.test(ecs.spring1$FPM.ETS)

hist(ecs.spring0$FPM.ETS, las=1)

hist(ecs.spring1$FPM.ETS, las=1)

bartlett.test(FPM.ETS ~ Gruppe, data=ecs.spring)

shapiro.test(ecs.spring0$FPM.CII)
shapiro.test(ecs.spring1$FPM.CII)

hist(ecs.spring0$FPM.CII, las=1)

hist(ecs.spring1$FPM.CII, las=1)

bartlett.test(FPM.CII ~ Gruppe, data=ecs.spring)

shapiro.test(ecs.spring0$FPM.CI.CII)
shapiro.test(ecs.spring1$FPM.CI.CII)

hist(ecs.spring0$FPM.CI.CII, las=1)

hist(ecs.spring1$FPM.CI.CII, las=1)

bartlett.test(FPM.CI.CII ~ Gruppe, data=ecs.spring)

