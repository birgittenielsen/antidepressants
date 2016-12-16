weight <- read.csv("./data/raw/weight.copy.csv", header=TRUE, sep=";", dec=",")

weight <- weight[order(weight$ID),]

weight.ecs <- subset(weight, ID < 21 | ID > 1000)

weight.ecs$Gruppe <- c(1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1)

t.test(Weight ~ Gruppe, data=weight.ecs)
