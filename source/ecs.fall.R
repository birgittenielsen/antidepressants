ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

alpha <- 0.05
cols <- ecs.fall[4:27]
colnames <- names(ecs.fall[4:27])
tests <- lapply(cols, function(x) {
  test = t.test(x ~ Gruppe, data=ecs.fall)
  if(test["p.value"] < alpha) {
    return(list(TRUE, test, x))
  } else {
    return(list(FALSE, "Not statistically significant"))
  }
})


for(name in names(tests)) {
  print(name)
  print(tests[[name]])
}


ecs.fall0 <- subset(ecs.fall, Gruppe == 0)
ecs.fall1 <- subset(ecs.fall, Gruppe == 1)

shapiro.test(ecs.fall0$oxo)
shapiro.test(ecs.fall1$oxo)

hist(ecs.fall0$oxo, las=1)

hist(ecs.fall1$oxo, las=1)

bartlett.test(oxo ~ Gruppe, data=ecs.fall)

shapiro.test(ecs.fall0$weight)
shapiro.test(ecs.fall1$weight)

hist(ecs.fall0$weight, las=1)

hist(ecs.fall1$weight, las=1)

bartlett.test(weight ~ Gruppe, data=ecs.fall)
