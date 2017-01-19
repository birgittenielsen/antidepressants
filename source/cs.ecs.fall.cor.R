ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

normalized <- ecs.fall[4:27]

for(i in names(normalized)) {
  normalized[i] <- normalized[i]/ecs.fall$cs
}

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

control <- results.cm[which(results.cm$cor > 0.8 | results.cm$cor < -0.8 & results.cm$p < 0.05),]

control.in <- subset(control, row=="weight" | 
                       row=="OXCA.CII" | row=="H202.ROX" | row=="FPM.CII" | 
                       row=="FPM.ETS" | row=="FPM.CI.CII" | column=="weight" | 
                       column=="OXCA.CII" | column=="H202.ROX" | 
                       column=="FPM.CII" | column=="FPM.ETS" | 
                       column=="FPM.CI.CII" | column=="oxo")

#Correlation for treated group
test.t <- rcorr(normalized.tm, type="pearson")

results.tm <- results(test.t$r, test.t$P)

treated <- results.tm[which(results.tm$cor > 0.8 | results.tm$cor < -0.8 & results.tm$p < 0.05),]

treated.in <- subset(treated, row=="weight" | 
                       row=="OXCA.CII" | row=="H202.ROX" | row=="FPM.CII" | 
                       row=="FPM.ETS" | row=="FPM.CI.CII" | column=="weight" | 
                       column=="OXCA.CII" | column=="H202.ROX" | 
                       column=="FPM.CII" | column=="FPM.ETS" | 
                       column=="FPM.CI.CII" | column=="oxo")

