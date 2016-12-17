ecs.spring <- read.csv("./data/processed/re.ecs.spring.csv", header=TRUE)

test <- cor(ecs.spring, use="complete.obs", method="pearson")

