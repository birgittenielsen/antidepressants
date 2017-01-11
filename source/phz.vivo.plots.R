phz.vivo <- read.csv("./data/processed/re.phz.vivo.csv", header=TRUE)

#Da H202.ROX var signifikant mellem gruppe 2 og kontrol samt mellem gruppe 2 og 1 
#laves boxplot over det
boxplot(H202.ROX ~ Gruppe, 
        data=phz.vivo, 
        ylim=c(0,2), 
        names=c("Control", "In Vivo", "In Vivo + In Vitro"),
        col=c("olivedrab", "olivedrab1", "olivedrab3"), 
        main="Phenelzine In Vivo
        H202 Flux Non-Electron Transfer System", 
        ylab="H202 Flux (pmol/ml*s", 
        las=1)

a <- mean(phz.vivo$H202.ROX[which(phz.vivo$Gruppe==0)], na.rm=TRUE)
b <- mean(phz.vivo$H202.ROX[which(phz.vivo$Gruppe==1)], na.rm=TRUE)
c <- mean(phz.vivo$H202.ROX[which(phz.vivo$Gruppe==2)], na.rm=TRUE)
text(1,1.7, sprintf("mean %.1f",round(a,1)))
text(2,1.5, sprintf("mean %.1f",round(b,1)))
text(3,1.25, sprintf("mean %.1f *", round(c,1)))

title(sub="*:p-value<0.05, n control: 8, n in vivo: 7, n in vivo+in vitro: 6. 
      In vivo + in vitro 0.33 mM PHZ were added", adj=0.1)

