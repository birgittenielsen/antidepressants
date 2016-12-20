phz.vivo <- read.csv("./data/processed/re.phz.vivo.ow.csv", header=TRUE)

phz.vivo <- phz.vivo[,3:26]

#Dividing data frame into two for each group - c: control, t: treated 
phz.vivo.c <- subset(phz.vivo, Gruppe==0)
phz.vivo.t1 <- subset(phz.vivo, Gruppe==1)

phz.vivo.cm <- as.matrix(phz.vivo.c)
phz.vivo.t1m <- as.matrix(phz.vivo.t1)

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
test.c <- rcorr(phz.vivo.cm, type="pearson")

results.cm <- results(test.c$r, test.c$P)

control <- results.cm[which(results.cm$cor > 0.8 | results.cm$cor < -0.8 & results.cm$p < 0.05),]

control.in <- subset(control, column=="H202.ROX" | column=="weight" | column=="oxo")

#Correlation for treated group 1
test.t1 <- rcorr(phz.vivo.t1m, type="pearson")

results.t1m <- results(test.t1$r, test.t1$P)

treated <- results.t1m[which(results.t1m$cor > 0.8 | results.t1m$cor < -0.8 & results.t1m$p < 0.05),]

treated.in <- subset(treated, column=="H202.ROX" | column=="weight" | column=="oxo")
