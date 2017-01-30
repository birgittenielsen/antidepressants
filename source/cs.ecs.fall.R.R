ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

normalized <- ecs.fall[4:24]

for(i in names(normalized)) {
  normalized[i] <- normalized[i]/ecs.fall$cs
}

normalized$weight <- ecs.fall$weight
normalized$cs <-ecs.fall$cs
normalized$ID <- ecs.fall$ID
normalized$Gruppe <- ecs.fall$Gruppe

stopifnot(all(ecs.fall$ID == normalized$ID))

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