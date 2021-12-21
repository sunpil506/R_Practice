x <- c("a",'b','c','d','e')
x
x[c(1,3,5)]


Games
Games[1:3,6:10] # At y-value pick the row from 1 to 3, X value pick the column from 6 to 10
Games[c(1,10),] # at only y-value, pick the whole x values in 1 and 10
Games[,c("2008","2009")] # at x-value, pick the whole numbers in 2008 and 2009
#on below, these two will represent the values as vectors
Games[1,]
Games[1,5]
#if you want to see as the mactrix, need to follow as below
Games[1,,drop=F]
Games[1,5,drop=F]
#drop will delete the dimensions of array which have only one level.
Games[1,,drop=T]
Games[1,5,drop=T]
#If you use drop as true, it will show without y-value, 
#drop = t will not show the y-value
#drop = f will show the y-value
