x = read.csv(file.choose(), header= T) #read in the data file
data = x[1:5]				   #the numeric data in this column
i= x[6]					   #classification data in this file
kmeans(data, centers=4, iter.max = 10, nstart = 1,
       algorithm = c("Hartigan-Wong", "Lloyd", "Forgy",
                     "MacQueen"), trace=FALSE)