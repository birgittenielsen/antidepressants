ecs.fall <- read.csv("./data/processed/re.ecs.fall.csv", header=TRUE)

ecs.fall.ow <- ecs.fall[c(2:3,25:26,28)]

ecs.fall.ow <- na.omit(ecs.fall.ow)

a <- min(ecs.fall.ow$oxo)
b <- max(ecs.fall.ow$oxo)
c <- mean(ecs.fall.ow$oxo)
d <- sd(ecs.fall.ow$oxo)

ecs.fall.ow$norm1 <- (ecs.fall.ow$oxo-a)/b
ecs.fall.ow$norm2 <- (ecs.fall.ow$oxo-c)/d
ecs.fall.ow$norm3 <- (ecs.fall.ow$oxo-c)
ecs.fall.ow$norm4 <- log(ecs.fall.ow$oxo)

ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

ecs.spring.ow <- ecs.spring[c(2:3,25:27)]

ecs.spring.ow <- subset(ecs.spring.ow, oxo != 66.7)

e <- min(ecs.spring.ow$oxo)
f <- max(ecs.spring.ow$oxo)
g <- mean(ecs.spring.ow$oxo)
h <- sd(ecs.spring.ow$oxo)

ecs.spring.ow$norm1 <- (ecs.spring.ow$oxo-e)/f
ecs.spring.ow$norm2 <- (ecs.spring.ow$oxo-g)/h
ecs.spring.ow$norm3 <- ecs.spring.ow$oxo-g
ecs.spring.ow$norm4 <- log(ecs.spring.ow$oxo)

ecs.all.ow <- rbind(ecs.spring.ow, ecs.fall.ow)
ecs.all.ow <- subset(ecs.all.ow, oxo != 14.8)
ecs.all.ow <- subset(ecs.all.ow, oxo != 12.4)

t.test(norm1 ~ Gruppe, data=ecs.all.ow, var.equal=TRUE)

boxplot(norm1 ~ Gruppe, data=ecs.all.ow,
        names=c("Control", "ECS"), 
        col=c(16,11), 
        main="ECS All - Normalized (a) 8-oxoGuo", 
        ylim=c(0,0.8))

i <- mean(ecs.all.ow$norm1[which(ecs.all.ow$Gruppe==0)], na.rm=TRUE)
j <- mean(ecs.all.ow$norm1[which(ecs.all.ow$Gruppe==1)], na.rm=TRUE)
text(1,0.23, sprintf("mean %.1f",round(i,1)))
text(2,0.76, sprintf("mean %.1f",round(j,1)))

title(sub="p-value: 0.02376", adj=0)

t.test(norm2 ~ Gruppe, data=ecs.all.ow, var.equal=TRUE)

boxplot(norm2 ~ Gruppe, data=ecs.all.ow,
        names=c("Control", "ECS"), 
        col=c(16,11), 
        main="ECS All - Normalized (b) 8-oxoGuo",
        ylim=c(-1.2,2.5))

i <- mean(ecs.all.ow$norm2[which(ecs.all.ow$Gruppe==0)], na.rm=TRUE)
j <- mean(ecs.all.ow$norm2[which(ecs.all.ow$Gruppe==1)], na.rm=TRUE)
text(1,-0.1, sprintf("mean %.1f",round(i,1)))
text(2,2.41, sprintf("mean %.1f",round(j,1)))

title(sub="p-value: 0.01732", adj=0)

t.test(norm3 ~ Gruppe, data=ecs.all.ow, var.equal=TRUE)

t.test(norm4 ~ Gruppe, data=ecs.all.ow, var.equal=TRUE)
