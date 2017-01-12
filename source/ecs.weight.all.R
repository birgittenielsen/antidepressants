weight <- read.csv("./data/raw/weight.copy.csv", header=TRUE, sep=";", dec=",")

weight <- weight[order(weight$ID),]

weight.ecs <- subset(weight, ID < 21 | ID > 1000)

weight.ecs$Gruppe <- c(1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1)

t.test(Weight ~ Gruppe, data=weight.ecs)

boxplot(Weight ~ Gruppe, data=weight.ecs,
        las=1,
        names=c("Control", "ECS"), 
        col=c(16,11), 
        main="ECS All Weight", 
        ylab="Gram", 
        ylim=c(300,465))

a <- mean(weight.ecs$Weight[which(weight.ecs$Gruppe==0)], na.rm=TRUE)
b <- mean(weight.ecs$Weight[which(weight.ecs$Gruppe==1)], na.rm=TRUE)
text(1,451, sprintf("mean %.1f",round(a,1)))
text(2,432, sprintf("mean %.1f **",round(b,1)))

title(sub="**: p-value < 0.01", adj=0)

