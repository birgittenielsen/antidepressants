#Load data
phz.vivo <- read.csv("./data/raw/phz.vivo.csv", header=TRUE, sep=";", dec=",")
oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")
weight <- read.csv("./data/raw/weight.csv", header=TRUE, sep=";", dec=",")

#Reshaping dataframes
re.phz.vivo <- reshape(phz.vivo, timevar="State", idvar=c("ID", "Gruppe"), 
                       direction="wide")
re.phz.vivo <- re.phz.vivo[order(re.phz.vivo$ID),]

#Excluding constant columns[]
re.phz.vivo <- subset(re.phz.vivo, select=-c(FCR.ETS, FPM.ROX, FCR.ROX))


#PHZ dataframe with all data in group 0 and 1 to obtain oxo and weight data
re.phz.vivo.ow <- subset(re.phz.vivo, Gruppe == 1 | Gruppe == 0)

#Subsetting weight dataframe 
weight.phz.vivo <- subset(weight, ID > 20 & ID < 39)

stopifnot(all(re.phz.vivo.ow$ID == weight.phz.vivo$ID))

#Including weight data into new dataframe 
re.phz.vivo.ow$weight <- weight.phz.vivo

#OXO processing 
#Choosing oxo data 
oxo.phz <- subset(oxo.all, ID > 20 & ID < 39)
oxo.phz <- oxo.phz[order(oxo.phz$ID),]

#Oxo and weight data included in reshape PHZ vivo data
re.phz.vivo.ow$oxo <- oxo.phz$Ratio
re.phz.vivo.ow$weight <- weight.phz.vivo$Weight

#Saving as csv file in data/processed
write.csv(re.phz.vivo, file="./data/processed/re.phz.vivo.csv")
write.csv(re.phz.vivo.ow, file="./data/processed/re.phz.vivo.ow.csv")