phz.vivo.ow <- read.csv("./data/processed/re.phz.vivo.ow.csv", header=TRUE)

#Indeholder kun gruppe 0 og 1 pga. oxo data

cols = phz.vivo.ow[4:26]
colnames = names(phz.vivo.ow[4:26])
tests = lapply(cols, function(x) {
  test = t.test(x ~ Gruppe, data=phz.vivo.ow)
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

#No significant difference between group 0 (control) and group 1 