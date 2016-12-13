oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")


for(id in c(9,4,13,19,12,16,14,11)) {
  oxo.all <- oxo.all[oxo.all$ID != id,]
}

oxo.all.ecs <- oxo.all[17:44,]

t.test(Ratio ~ Gruppe, data=oxo.all.ecs)
