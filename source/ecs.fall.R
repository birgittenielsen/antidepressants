ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

alpha <- 0.05
cols <- ecs.fall[4:25]
colnames <- names(ecs.fall[4:25])
tests <- lapply(data, function(x) {
  t.test(x ~ Gruppe, data=ecs.fall, var.equal=TRUE)
  })

for(df in ) {
  print(col)
  print(colname)
}

cor(data.matrix(S), method="pearson")

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