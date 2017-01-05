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

boxplot(oxo ~ Gruppe, data=phz.vivo.ow,
        main="Phenelzine - 8oxoGuo Ratio",
        ylab="8oxoGuo Pr. 10E6 Guo", 
        col=c("olivedrab", "olivedrab1"), 
        names=c("Control", "Phenelzine"), 
        las=1)
a <- mean(phz.vivo.ow$oxo[which(phz.vivo.ow$Gruppe==0)], na.rm=TRUE)
b <- mean(phz.vivo.ow$oxo[which(phz.vivo.ow$Gruppe==1)], na.rm=TRUE)
text(1,9.6, sprintf("mean %.1f",round(a,1)))
text(2,8.1, sprintf("mean %.1f",round(b,1)))

boxplot(weight ~ Gruppe, data=phz.vivo.ow,
        main="Phenelzine - Weight",
        ylab="Gram", 
        col=c("olivedrab", "olivedrab1"), 
        names=c("Control", "Phenelzine"), 
        las=1,
        ylim=c(340,480))
a <- mean(phz.vivo.ow$weight[which(phz.vivo.ow$Gruppe==0)], na.rm=TRUE)
b <- mean(phz.vivo.ow$weight[which(phz.vivo.ow$Gruppe==1)], na.rm=TRUE)
text(1,475, sprintf("mean %.1f",round(a,1)))
text(2,412, sprintf("mean %.1f **",round(b,1)))
title(sub="**: p-value < 0.01", adj=0)



