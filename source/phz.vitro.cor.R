phz.vitro <- read.csv("./data/processed/re.phz.vitro.csv", header=TRUE)

phz.vitro <- phz.vitro[,3:24]

#Dividing data frame into two for each group - c: control, t: treated 
phz.vitro.c <- subset(phz.vitro, Gruppe==0)
phz.vitro.t1 <- subset(phz.vitro, Gruppe==1)
phz.vitro.t2 <- subset(phz.vitro, Gruppe==2)

phz.vitro.cm <- as.matrix(phz.vitro.c)
phz.vitro.t1m <- as.matrix(phz.vitro.t1)
phz.vitro.t2m <- as.matrix(phz.vitro.t2)

#rcorr returns r: the correlation matrix, n, p
results <- function(cormat, pmat) {
  ut <- upper.tri(cormat)
  data.frame(
    row = rownames(cormat)[row(cormat)[ut]],
    column = rownames(cormat)[col(cormat)[ut]],
    cor  =(cormat)[ut],
    p = pmat[ut]
  )
}

#Correlation for control group
test.c <- rcorr(phz.vitro.cm, type="pearson")

results.cm <- results(test.c$r, test.c$P)

control <- results.cm[which(results.cm$cor > 0.8 | results.cm$cor < -0.8 & results.cm$p < 0.05),]

#Correlation for treated group 1
test.t1 <- rcorr(phz.vitro.t1m, type="pearson")

results.t1m <- results(test.t1$r, test.t1$P)

lowcon <- results.t1m[which(results.t1m$cor > 0.8 | results.t1m$cor < -0.8 & results.t1m$p < 0.05),]

#Correlation for treated group 2
test.t2 <- rcorr(phz.vitro.t2m, type="pearson")

results.t2m <- results(test.t2$r, test.t2$P)

highcon <- results.t2m[which(results.t2m$cor > 0.8 | results.t2m$cor < -0.8 & results.t2m$p < 0.05),]


