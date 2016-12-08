ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

cols = ecs.spring[4:25]
colnames = names(ecs.spring[4:25])
tests = lapply(data, function(x) {
  t.test(x ~ Gruppe, data=ecs.spring, var.equal=TRUE)
})