phz.vitro <- read.csv("./data/processed/re.phz.vitro.csv", header=TRUE)

cols <- phz.vitro[4:24]
colnames <- names(phz.vitro[4:24])

tests <- lapply(cols, function(x) {
  lm_result <- lm(x ~ factor(Gruppe), data=phz.vitro)
  anova_result <- anova(lm_result)
  aov_result <- aov(lm_result)
  TukeyHSD_result <- TukeyHSD(aov_result)
  if(anova_result[1,5] < 0.04) {
    return(list(TRUE, TukeyHSD_result)) 
  } else {
    return(list(FALSE))
  }
})

for(name in names(tests)) {
  print(name)
  print(tests[[name]])
}

# Significant for H2O2 ROX and FCR LEAK in Group 2-0
phz.vitro20 <- subset(phz.vitro, Gruppe==2 | Gruppe==0)

t.test(H202.ROX ~ Gruppe, data=phz.vitro20, var.equal=TRUE)
t.test(FCR.LEAK ~ Gruppe, data=phz.vitro20, var.equal=TRUE)
