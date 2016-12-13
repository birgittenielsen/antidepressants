oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")

oxo.phz <- oxo.all[1:16, ]
oxo.phz <- oxo.phz[order(oxo.phz$ID),]

t.test(Ratio ~ Gruppe, data=oxo.phz,)
