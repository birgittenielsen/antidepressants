# Load data
ecs.spring <- read.csv("./data/raw/ecs.spring.csv", header=TRUE, sep=";", dec=",")
ecs.fall <- read.csv("./data/raw/ecs.fall.csv", header=TRUE, sep=";", dec=",")
oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")
weight <- read.csv("./data/raw/weight.copy.csv", header=TRUE, sep=";", dec=",")

weight <- weight[order(weight$ID),]

# Oxo tissue ruined - should not be included
for( id in c(9,4,13,19,12,16,14,11) ) {
  oxo.all[which(oxo.all$ID == id), c("Ratio")] = NA
}
oxo.all <- oxo.all[order(oxo.all$ID),]

# Reshape
re.ecs.spring <- reshape(ecs.spring, timevar="State", idvar=c("ID", "Gruppe"), 
                         direction="wide")
re.ecs.spring <- re.ecs.spring[order(re.ecs.spring$ID),]
re.ecs.fall <- reshape(ecs.fall, timevar="State", idvar=c("ID", "Gruppe"), 
                       direction="wide")
re.ecs.fall <- re.ecs.fall[order(re.ecs.fall$ID),]

# Exclude constant columns[]
re.ecs.fall <- subset(re.ecs.fall, select=-c(FCR.ETS, FPM.ROX, FCR.ROX))
re.ecs.spring <- subset(re.ecs.spring, select=-c(FCR.ETS, FPM.ROX, FCR.ROX))

# Subset oxo data for including the data into reshaped data frame
oxo.ecs.spring <- subset(oxo.all, ID > 1000)
oxo.ecs.fall <- subset(oxo.all, ID < 21)

#Check if number of observations are the shape before including of oxo data
stopifnot(all(re.ecs.spring$ID == oxo.ecs.spring$ID))
stopifnot(all(re.ecs.fall$ID == oxo.ecs.fall$ID))

#Oxo data included in reshape data 
re.ecs.spring$oxo <- oxo.ecs.spring$Ratio
re.ecs.fall$oxo <- oxo.ecs.fall$Ratio

#Subsets weight dataframes
weight.ecs.spring <- subset(weight, ID > 1000)

weight.ecs.fall <- subset(weight, ID < 21)

weight.ecs.spring.o <- subset(weight.ecs.spring, ID != 2002 & ID != 4001)
weight.ecs.fall.o <- subset(weight.ecs.fall, ID != 13 & ID != 18)

stopifnot(all(re.ecs.spring$ID == weight.ecs.spring$ID))
stopifnot(all(re.ecs.fall$ID == weight.ecs.fall$ID))

#Include weight data in reshaped dataframes
re.ecs.spring$weight <- weight.ecs.spring$Weight
re.ecs.fall$weight <- weight.ecs.fall$Weight

#Include new vector - OXPHOS CAPACITY-CII
re.ecs.fall$OXCA.CII <- re.ecs.fall$FPM.CI.CII-re.ecs.fall$FPM.CII

# Save as csv files in data/processed
write.csv(re.ecs.spring, file="./data/processed/re.ecs.spring.csv")
write.csv(re.ecs.fall, file="./data/processed/re.ecs.fall.csv")
