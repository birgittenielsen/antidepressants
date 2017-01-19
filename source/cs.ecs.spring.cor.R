ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

normalized <- ecs.spring[4:27]

for(i in names(normalized)) {
  normalized[i] <- normalized[i]/ecs.spring$cs
}

normalized$cs <-ecs.spring$cs
normalized$ID <- ecs.spring$ID
normalized$Gruppe <- ecs.spring$Gruppe

library(Hmisc)

#Dividing data frame into two for each group - c: control, t: treated 
normalized.c <- subset(normalized, Gruppe==0)
normalized.t <- subset(normalized, Gruppe==1)

normalized.cm <- as.matrix(normalized.c)
normalized.tm <- as.matrix(normalized.t)

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

control <- subset(results.cm, cor > 0.8 | cor < -0.8 & p < 0.05)

control.in <- subset(control, column == "H202.ROX" | column == "oxo" | column == "weight")

#Correlation for treated group
test.t <- rcorr(normalized.tm, type="pearson")

results.tm <- results(test.t$r, test.t$P)

treated <- results.tm[which(results.tm$cor > 0.8 | results.tm$cor < -0.8 & results.tm$p < 0.05),]

treated.in <- subset(treated, column == "H202.ROX" | column == "oxo" | column == "weight")
