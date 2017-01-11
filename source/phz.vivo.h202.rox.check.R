phz.vivo <- read.csv("./data/processed/re.phz.vivo.csv", header=TRUE)

phz.vivo0 <- subset(phz.vivo, Gruppe == 0)
phz.vivo1 <- subset(phz.vivo, Gruppe == 1)
phz.vivo2 <- subset(phz.vivo, Gruppe == 2)

shapiro.test(phz.vivo0$H202.ROX)
shapiro.test(phz.vivo1$H202.ROX)
shapiro.test(phz.vivo2$H202.ROX)

hist(phz.vivo0$H202.ROX, las=1)
hist(phz.vivo1$H202.ROX, las=1)
hist(phz.vivo2$H202.ROX, las=1)

bartlett.test(H202.ROX ~ Gruppe, data=phz.vivo)
