#Loading data
phz.vivo <- read.csv("./data/raw/phz.vivo.csv", header=TRUE, sep=";", dec=",")
phz.vitro <- read.csv("./data/raw/phz.vitro.csv", header=TRUE, sep=";", dec=",")
oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")
weight <- read.csv("./data/raw/weight.csv", header=TRUE, sep=";", dec=",")

#Reshaping data
re.phz.vivo <- reshape(phz.vivo, timevar="State", idvar=c("ID", "Gruppe"), 
                       direction="wide")
re.phz.vivo <- re.phz.vivo[order(re.phz.vivo$ID),]

re.phz.vitro <- reshape(phz.vitro, timevar="State", idvar=c("ID", "Gruppe"), 
                        direction="wide")
re.phz.vitro <- re.phz.vitro[order(re.phz.vitro$ID),]

# Exclude constant columns[]
re.phz.vivo <- subset(re.phz.vivo, select=-c(FCR.ETS, FPM.ROX, FCR.ROX))
re.phz.vitro <- subset(re.phz.vitro, select=-c(FCR.ETS, FPM.ROX, FCR.ROX))

#Choosing oxo data 
oxo.phz <- oxo.all[1:16, ]
oxo.phz <- oxo.phz[order(oxo.phz$ID),]

#New PHZ data frame with all data in group 0 and 1
re.phz.vivo.oxo <- re.phz.vivo[which(re.phz.vivo$Gruppe == 0 | re.phz.vivo$Gruppe == 1),]
#Oxo data included in reshape PHZ vivo data
re.phz.vivo.oxo$oxo <- oxo.phz[which(oxo.phz$ID != 23),]$Ratio

#Choosing weight data 
weight.phz.vivo <- subset(weight, ID > 20 & ID < 39)
weight.phz.vivo <- weight.phz.vivo[order(weight.phz.vivo),]

weight.phz.vitro <- subset(weight, ID > 38 & ID < 47)
weight.phz.vitro <- weight.phz.vitro[1:8,]
weight.phz.vitro <- weight.phz.vitro[order(weight.phz.vitro),]

#Saving as csv files in data/processed
write.csv(re.phz.vivo.oxo, file="./data/processed/re.phz.vivo.oxo.csv")
write.csv(re.phz.vitro, file="./data/processed/re.phz.vitro.csv")
write.csv(re.phz.vivo, file="./data/processed/re.phz.vivo.csv")


