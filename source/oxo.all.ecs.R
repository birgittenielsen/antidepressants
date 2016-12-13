oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")

oxo.all.ecs <- oxo.all[17:44,]

for(id in c(9,4,13,19,12,16,14,11)) {
  oxo.all.ecs <- oxo.all.ecs[oxo.all.ecs$ID != id,]
}

t.test(Ratio ~ Gruppe, data=oxo.all.ecs, var.equal=TRUE)
