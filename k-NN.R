library(caret)
#k-NN, cross-validation, improve by semi-supervised learning, different k

data <- data.frame(read.csv('data.csv'), stringsAsFactors=FALSE)
data <- data[, 2:ncol(data)]
data$category <- as.character(data$category)
data$category[data$category == 'h'] <- 1
data$category[data$category == 'p'] <- 2
data$category[data$category == 'e'] <- 3

trainData <- rbind(data[1:5,], data[16:20,])
trainData <- rbind(trainData, data[31:35,])
cl <- trainData$category
trainData <- subset(trainData, select=-category)

testData <- subset(data, select=-category)
knn(trainData, testData, cl, k=3)
