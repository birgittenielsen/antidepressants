# Load data
ecs.spring <- read.csv("./data/raw/ecs.spring.csv", header=TRUE, sep=";", dec=",")
ecs.fall <- read.csv("./data/raw/ecs.fall.csv", header=TRUE, sep=";", dec=",")
oxo.all <- read.csv("./data/raw/oxo.all.csv", header=TRUE, sep=";", dec=",")
weight <- read.csv("./data/raw/weight.csv", header=TRUE, sep=";", dec=",")

# Oxo tissue ruined - should not be included
for( id in c(9,4,13,19,12,16,14,11) ) {
  oxo.all[which(oxo.all$ID == id),] = NA
}

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
oxo.ecs.spring <- oxo.all[33:44, ]

oxo.ecs.spring <- oxo.ecs.spring[which(oxo.ecs.spring$ID != 401),]
oxo.ecs.spring <- oxo.ecs.spring[order(oxo.ecs.spring$ID),]

oxo.ecs.fall <- oxo.all[17:32, ]
oxo.ecs.fall <- oxo.ecs.fall[which(oxo.ecs.fall$ID != 13),]
oxo.ecs.fall <- oxo.ecs.fall[which(oxo.ecs.fall$ID != 18),]
oxo.ecs.fall <- oxo.ecs.fall[order(oxo.ecs.fall$ID),]



stopifnot(all(re.ecs.spring$ID == oxo.ecs.spring$ID))
# stopifnot(all(re.ecs.fall$ID == oxo.ecs.fall$ID))

#Oxo data included in reshape data 
re.ecs.spring$oxo <- oxo.ecs.spring$Ratio
re.ecs.fall$oxo <- oxo.ecs.fall$Ratio

#Subsets weight data frames for different trials
weight.ecs.spring <- subset(weight, ID > 100)
weight.ecs.spring <- weight.ecs.spring[order(weight.ecs.spring$ID),]

weight.ecs.fall <- subset(weight, ID < 21)
weight.ecs.fall <- weight.ecs.fall[order(weight.ecs.fall$ID),]

#Include weight data in reshaped dataframes
stopifnot(all(re.ecs.spring$ID == weight.ecs.spring$ID))

# Save as csv files in data/processed
write.csv(re.ecs.spring, file="./data/processed/re.ecs.spring.csv")
write.csv(re.ecs.fall, file="./data/processed/re.ecs.fall.csv")
