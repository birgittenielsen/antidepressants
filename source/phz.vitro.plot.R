phz.vitro <- read.csv("./data/processed/re.phz.vitro.csv", header=TRUE)

boxplot(H202.ROX ~ Gruppe, 
        data=phz.vitro, 
        ylim=c(0,2), 
        names=c("Control", "0.033 mM PHZ", "0.066 mM PHZ"),
        col=c("olivedrab", "olivedrab1", "olivedrab3"), 
        main="Phenelzine In Vitro
        H202 Flux Non-Electron Transfer System", 
        ylab="H202 Flux (pmol/ml*s)", 
        las=1)

a <- mean(phz.vitro$H202.ROX[which(phz.vitro$Gruppe==0)], na.rm=TRUE)
b <- mean(phz.vitro$H202.ROX[which(phz.vitro$Gruppe==1)], na.rm=TRUE)
c <- mean(phz.vitro$H202.ROX[which(phz.vitro$Gruppe==2)], na.rm=TRUE)
text(1,1.82, sprintf("mean %.1f",round(a,1)))
text(2,1.05, sprintf("mean %.1f",round(b,1)))
text(3,1, sprintf("mean %.1f **", round(c,1)))

title(sub="**:p-value<0.01, n control: 8, n 0.066 mM PHZ: 8, n 0.033 mM PHZ: 8.", adj=0.1)
