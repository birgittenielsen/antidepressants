ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

ecs.spring <- ecs.spring[,2:27]

library(Hmisc)

#Dividing data frame into two for each group - c: control, t: treated 
ecs.spring.c <- subset(ecs.spring, Gruppe==0)
ecs.spring.t <- subset(ecs.spring, Gruppe==1)

ecs.spring.cm <- as.matrix(ecs.spring.c)
ecs.spring.tm <- as.matrix(ecs.spring.t)

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
test.c <- rcorr(ecs.spring.cm, type="pearson")

results.cm <- results(test.c$r, test.c$P)

control <- subset(results.cm, cor > 0.8 | cor < -0.8 & p < 0.05)
  
control.in <- subset(control, column == "cs" | column == "H202.ROX" | column == "oxo" | column == "weight")

#Correlation for treated group
test.t <- rcorr(ecs.spring.tm, type="pearson")

results.tm <- results(test.t$r, test.t$P)

treated <- results.tm[which(results.tm$cor > 0.8 | results.tm$cor < -0.8 & results.tm$p < 0.05),]

treated.in <- subset(treated, column == "cs" | column == "H202.ROX" | column == "oxo" | column == "weight")
