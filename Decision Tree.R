mydata <- read.csv("E:/Rassign/binary.csv")
mydata$admitss <- as.factor(mydata$admit)
library(party)
mytree <- ctree(admit~gpa+gre, mydata, controls=ctree_control(mincriterion = 0.9, minsplit = 50))
plot(mytree, type="simple")
tab <-table(predict(mytree), mydata$admit)
1-sum(diag(tab)) /sum(tab)