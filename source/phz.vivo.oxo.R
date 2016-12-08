phz.vivo.oxo <- read.csv("./data/processed/re.phz.vivo.oxo.csv", header=TRUE)

cols = phz.vivo.oxo[4:25]
colnames = names(phz.vivo.oxo[4:25])
tests = lapply(cols, function(x) {
  test = t.test(x ~ Gruppe, data=phz.vivo.oxo, var.equal=TRUE)
  if(test["p.value"] < 0.05) {
    return(test)
  } else {
    return("Not statistically significant")
  }
})