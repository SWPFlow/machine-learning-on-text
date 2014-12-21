library(e1071)

data <- data.frame(read.csv('data.csv'), stringsAsFactors=FALSE)
data <- data[, 2:ncol(data)]
data$category <- as.character(data$category)
data$category[data$category == 'h'] <- 1
data$category[data$category == 'p'] <- 2
data$category[data$category == 'e'] <- 3
data <- sapply(data, as.numeric)

testData <- subset(data, select=-category)
model <- svm(category ~ ., data = data, cross=10)
pred <- predict(model, testData)
pred
