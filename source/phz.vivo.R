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

#Significant for H2O2 ROX in Group 2-0 and 2-1
phz.vivo20 <- subset(phz.vivo[which(phz.vivo$Gruppe == 2 | phz.vivo$Gruppe == 0),])
phz.vivo21 <- subset(phz.vivo[which(phz.vivo$Gruppe == 2 | phz.vivo$Gruppe == 1),])

t.test(H202.ROX ~ Gruppe, data=phz.vivo20, var.equal=TRUE)
t.test(H202.ROX ~ Gruppe, data=phz.vivo21, var.equal=TRUE)
