phz.vivo <- read.csv("./data/processed/re.phz.vivo.csv", header=TRUE)

cols = phz.vivo[4:25]
colnames = names(phz.vivo[4:25])
tests = lapply(data, function(x) {
  t.test(x ~ Gruppe, data=phz.vivo, var.equal=TRUE)
})