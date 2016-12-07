# Load data
ecs.spring <- read.csv("./data/raw/ecs.spring.csv", header=TRUE, sep=";", dec=",")
ecs.fall <- read.csv("./data/raw/ecs.fall.csv", header=TRUE, sep=";", dec=",")
phz.vivo <- read.csv("./data/raw/phz.vivo.csv", header=TRUE, sep=";", dec=",")
phz.vitro <- read.csv("./data/raw/phz.vitro.csv", header=TRUE, sep=";", dec=",")
oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")

# Reshape
re.ecs.spring <- reshape(ecs.spring, timevar="State", idvar=c("ID", "Gruppe"), 
                         direction="wide")
re.ecs.spring <- re.ecs.spring[order(re.ecs.spring$ID),]

re.ecs.fall <- reshape(ecs.fall, timevar="State", idvar=c("ID", "Gruppe"), 
                       direction="wide")
re.ecs.fall <- re.ecs.fall[order(re.ecs.fall$ID),]

re.phz.vivo <- reshape(phz.vivo, timevar="State", idvar=c("ID", "Gruppe"), 
                       direction="wide")
re.phz.vivo <- re.phz.vivo[order(re.phz.vivo$ID),]

re.phz.vitro <- reshape(phz.vitro, timevar="State", idvar=c("ID", "Gruppe"), 
                        direction="wide")
re.phz.vitro <- re.phz.vitro[order(re.phz.vitro$ID),]

# Include oxo
oxo.ecs.spring <- oxo.all[33:44, ]

oxo.ecs.spring <- oxo.ecs.spring[which(oxo.ecs.spring$ID != 401),]
oxo.ecs.spring <- oxo.ecs.spring[order(oxo.ecs.spring$ID),]


oxo.ecs.fall <- oxo.all[17:32, ]
oxo.ecs.fall <- oxo.ecs.fall[which(oxo.ecs.fall$ID != 13),]
oxo.ecs.fall <- oxo.ecs.fall[which(oxo.ecs.fall$ID != 18),]
oxo.ecs.fall <- oxo.ecs.fall[order(oxo.ecs.fall$ID),]

# Tissue ruined - should not be included
for( id in c(9,4,13,19,12,16,14,11) ) {
  oxo.ecs.fall[which(oxo.ecs.fall$ID == id),] = NA
}

oxo.phz <- oxo.all[1:16, ]
oxo.phz <- oxo.phz[order(oxo.phz$ID),]

stopifnot(all(re.ecs.spring$ID == oxo.ecs.spring$ID))
# stopifnot(all(re.ecs.fall$ID == oxo.ecs.fall$ID))

#Oxo data included in reshape data 
re.ecs.spring$oxo <- oxo.ecs.spring$Ratio
re.ecs.fall$oxo <- oxo.ecs.fall$Ratio

#New PHZ data frame with all data in group 1 and 2
re.phz.vivo.oxo <- re.phz.vivo[which(re.phz.vivo$Gruppe == 0 | re.phz.vivo$Gruppe == 1),]

re.phz.vivo.oxo$oxo <- oxo.phz[which(oxo.phz$ID != 23),]$Ratio

# Save as csv files in data/processed
write.csv(re.ecs.spring, file="./data/processed/re.ecs.spring.csv")
write.csv(re.ecs.fall, file="./data/processed/re.ecs.fall.csv")
write.csv(re.phz.vivo.oxo, file="./data/processed/re.phz.vivo.oxo.csv")