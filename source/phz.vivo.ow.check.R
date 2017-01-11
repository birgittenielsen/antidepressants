phz.vivo.ow <- read.csv("./data/processed/re.phz.vivo.ow.csv", header=TRUE)

phz.vivo.ow0 <- subset(phz.vivo.ow , Gruppe == 0)
phz.vivo.ow1 <- subset(phz.vivo.ow , Gruppe == 1)

shapiro.test(phz.vivo.ow0$oxo)
shapiro.test(phz.vivo.ow1$oxo)

hist(phz.vivo.ow0$oxo, las=1)

hist(phz.vivo.ow1$oxo, las=1)

bartlett.test(oxo ~ Gruppe, data=phz.vivo.ow)

