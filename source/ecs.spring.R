ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

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

