ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

cols = ecs.spring[4:25]
colnames = names(ecs.spring[4:25])
tests = lapply(cols, function(x) {
  test = t.test(x ~ Gruppe, data=ecs.spring, var.equal=TRUE)
  if(test["p.value"] < 0.04) {
    return(test)
  } else {
    return("Not statistically significant")
  }
})