phz.vitro <- read.csv("./data/processed/re.phz.vitro.csv", header=TRUE)

phz.vitro0 <- subset(phz.vitro, Gruppe == 0)
phz.vitro1 <- subset(phz.vitro, Gruppe == 1)
phz.vitro2 <- subset(phz.vitro, Gruppe == 2)

shapiro.test(phz.vitro0$H202.ROX)
shapiro.test(phz.vitro1$H202.ROX)
shapiro.test(phz.vitro2$H202.ROX)

hist(phz.vitro0$H202.ROX, las=1)
hist(phz.vitro1$H202.ROX, las=1)
hist(phz.vitro2$H202.ROX, las=1)

bartlett.test(H202.ROX ~ Gruppe, data=phz.vitro)
