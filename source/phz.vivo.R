phz.vivo <- read.csv("./data/processed/re.phz.vivo.csv", header=TRUE)

cols <- phz.vivo[4:24]
colnames <- names(phz.vivo[4:24])

tests <- lapply(cols, function(x) {
  lm_result <- lm(x ~ factor(Gruppe), data=phz.vivo)
  anova_result <- anova(lm_result)
  aov_result <- aov(lm_result)
  TukeyHSD_result <- TukeyHSD(aov_result)
  if(anova_result[1,5] < 0.05) {
    return(list(TRUE, TukeyHSD_result)) 
  } else {
    return(list(FALSE))
  }
})

for(name in names(tests)) {
  print(name)
  print(tests[[name]])
}
