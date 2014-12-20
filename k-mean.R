data <- read.csv('data.csv')
data <- data[, 3:ncol(data)-1]
clust.kmeans <-  kmeans(data, 3)
clust.kmeans$cluster
