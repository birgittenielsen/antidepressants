ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

alpha <- 0.05
cols <- ecs.fall[4:25]
colnames <- names(ecs.fall[4:25])
tests <- lapply(cols, function(x) {
  test = t.test(x ~ Gruppe, data=ecs.fall, var.equal=TRUE)
  if(test["p.value"] < alpha) {
    return(list(TRUE, test, x))
  } else {
    return(list(FALSE, "Not statistically significant"))
  }
})

for(testa in tests) {
  for(testb in tests) {
    if(test[[1]]) {
      cor(testa[[3]], testb[[3]], method="pearson")
    }
  }
}


# alpha = 0.05
# for(name in names(ecs.fall)) {
#   ttest = t.test(ecs.fall[[name]] ~ ecs.fall$Gruppe, var.equal=TRUE)
#   if(ttest["p.value"] < alpha) {
#     print(name)
#     print(ttest)
#   }
# if(ttest["p.value"] < alpha) {
#   print(ttest)
#   significant <- cbind(significant, x)
# }S = data.frame(matrix(NA,14,0))
# A = mapply(function(col, colname, test) {
#   if(test["p.value"] < 0.05) {
#     return(col)
#   }
# }, cols, colnames, tests, SIMPLIFY=TRUE)
# }