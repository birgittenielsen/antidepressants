#Loading data
phz.vitro <- read.csv("./data/raw/phz.vitro.csv", header=TRUE, sep=";", dec=",")
oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")
weight <- read.csv("./data/raw/weight.csv", header=TRUE, sep=";", dec=",")

#Reshaping data
re.phz.vitro <- reshape(phz.vitro, timevar="State", idvar=c("ID", "Gruppe"), 
                        direction="wide")
re.phz.vitro <- re.phz.vitro[order(re.phz.vitro$ID),]

# Exclude constant columns[]
re.phz.vitro <- subset(re.phz.vitro, select=-c(FCR.ETS, FPM.ROX, FCR.ROX))

#Subsetting weight dataframe 
weight.phz.vitro <- subset(weight, ID > 38 & ID < 47)
weight.phz.vitro <- weight.phz.vitro[order(weight.phz.vitro),]
weight.phz.vitro <- weight.phz.vitro[1:8,]

stopifnot(all(re.ecs.fall$ID == weight.ecs.fall.o$ID))

#Saving as csv files in data/processed
write.csv(re.phz.vitro, file="./data/processed/re.phz.vitro.csv")


