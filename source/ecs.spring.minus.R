ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

ecs.spring <- subset(ecs.spring, oxo != 66.7)

cols = ecs.spring[4:26]
colnames = names(ecs.spring[4:26])
tests = lapply(cols, function(x) {
  test = t.test(x ~ Gruppe, data=ecs.spring)
  if(test["p.value"] < 0.05) {
    return(test)
  } else {
    return("Not statistically significant")
  }
})


for(name in names(tests)) {
  print(name)
  print(tests[[name]])
}


ecs.spring0 <- subset(ecs.spring, Gruppe == 0)
ecs.spring1 <- subset(ecs.spring, Gruppe == 1)

shapiro.test(ecs.spring0$oxo)
shapiro.test(ecs.spring1$oxo)

hist(ecs.spring0$oxo, las=1)

hist(ecs.spring1$oxo, las=1)