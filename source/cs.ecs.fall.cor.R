ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

normalized <- ecs.fall[4:24]

for(i in names(normalized)) {
  normalized[i] <- normalized[i]/ecs.fall$cs
}

normalized$weight <- ecs.fall$weight
normalized$cs <-ecs.fall$cs
normalized$ID <- ecs.fall$ID
normalized$Gruppe <- ecs.fall$Gruppe


#Dividing data frame into two for each group - c: control, t: treated 
normalized.c <- subset(normalized, Gruppe==0)
normalized.t <- subset(normalized, Gruppe==1)

normalized.cm <- as.matrix(normalized.c)
normalized.tm <- as.matrix(normalized.t)

library(Hmisc)

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
test.c <- rcorr(normalized.cm, type="pearson")

results.cm <- results(test.c$r, test.c$P)

control.p <- subset(results.cm, cor > 0.8 & p < 0.05)
control.n <- subset(results.cm, cor < -0.8 & p < 0.05)

#Correlation for treated group
test.t <- rcorr(normalized.tm, type="pearson")

results.tm <- results(test.t$r, test.t$P)

treated.p <- subset(results.tm, cor > 0.8 & p < 0.05)
treated.n <- subset(results.tm, cor < 0.8 & p < 0.05)


