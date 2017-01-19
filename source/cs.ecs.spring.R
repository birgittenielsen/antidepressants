ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

normalized <- ecs.spring[4:27]

for(i in names(normalized)) {
  normalized[i] <- normalized[i]/ecs.spring$cs
}

normalized$cs <-ecs.spring$cs
normalized$ID <- ecs.spring$ID
normalized$Gruppe <- ecs.spring$Gruppe

stopifnot(all(ecs.spring$ID == normalized$ID))

alpha <- 0.05
cols <- normalized[1:24]
colnames <- names(normalized[1:24])
tests <- lapply(cols, function(x) {
  test = t.test(x ~ Gruppe, data=normalized)
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