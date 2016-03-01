brush_teeth<-read.table("C:/Users/Mark Schulz/Documents/School/BDA/Lab 3/Code/HMP_Dataset/Brush_teeth/Accelerometer-2011-04-11-13-28-18-brush_teeth-f1.txt")

climb_stairs<-read.table("C:/Users/Mark Schulz/Documents/School/BDA/Lab 3/Code/HMP_Dataset/Climb_stairs/Accelerometer-2011-03-24-10-24-39-climb_stairs-f1.txt")
climb_stairs<-rbind(climb_stairs,read.table("C:/Users/Mark Schulz/Documents/School/BDA/Lab 3/Code/HMP_Dataset/Climb_stairs/Accelerometer-2011-03-24-10-25-44-climb_stairs-f1.txt"))
climb_stairs<-rbind(climb_stairs,read.table("C:/Users/Mark Schulz/Documents/School/BDA/Lab 3/Code/HMP_Dataset/Climb_stairs/Accelerometer-2011-03-29-09-55-46-climb_stairs-f1.txt"))

eat_meat<-read.table("C:/Users/Mark Schulz/Documents/School/BDA/Lab 3/Code/HMP_Dataset/Eat_meat/Accelerometer-2011-03-24-13-06-15-eat_meat-f1.txt")

x<-rbind(brush_teeth,climb_stairs,eat_meat)

km <- kmeans(x, 3, 15)
plot(x, col = km$cluster)
print(km)

d <- dist(x, method = "euclidean")
fit <- hclust(d, method="ward.D")
plot(fit)



testing_teeth<-read.table("C:/Users/Mark Schulz/Documents/School/BDA/Lab 3/Code/HMP_Dataset/Brush_teeth/Accelerometer-2011-04-11-13-29-54-brush_teeth-f1.txt")
testing_stairs<-read.table("C:/Users/Mark Schulz/Documents/School/BDA/Lab 3/Code/HMP_Dataset/Climb_stairs/Accelerometer-2011-06-06-10-59-08-climb_stairs-f1.txt")
testing_meat<-read.table("C:/Users/Mark Schulz/Documents/School/BDA/Lab 3/Code/HMP_Dataset/Eat_meat/Accelerometer-2011-03-24-13-17-42-eat_meat-f1.txt")


plot(testing_stairs,col=fit$cluster)

library(mclust)
x_ = x[,1]          # get the first column of the faithful data set
y_ = x[,2]          # get the second column of the faithful data set
z_ = x[,3]
plot(x_,y_)                 # plot the spread points before the clustering
model <- Mclust(x) # estimate the number of cluster (BIC), initialize (HC) and clusterize (EM)
data = x           # get the data set 
plot(model, x)     # plot the clustering results
model <- Mclust(x)