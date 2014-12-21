library(caret)
library(class)
#k-NN, cross-validation, improve by semi-supervised learning, different k

data <- data.frame(read.csv('data.csv'), stringsAsFactors=FALSE)
data <- data[, 2:ncol(data)]
data$category <- as.character(data$category)
data$category[data$category == 'h'] <- 1
data$category[data$category == 'p'] <- 2
data$category[data$category == 'e'] <- 3

cl <- data$category
trainData <- subset(data, select=-category)
testData <- subset(data, select=-category)
myknn <- knn(trainData, testData, cl, k=8)

#cross validation
myknn.cv <- knn.cv(data, data[,9], k=3)
