data <- read.csv('data.csv')
data <- data[, 3:ncol(data)-1]

d <- dist(data, method = "euclidean") 
clust.hy <- hclust(d)
clust.hy <- cutree(clust.hy, k=3)
