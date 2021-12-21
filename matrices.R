# matrices
# when you want to see the matrix need to use the term ( row, column)
# when you use a[1,] it means that take whole column on 1st line
# when you use a[.1] it means that take whole row on 1st line
# when you are trying to put charater with number, everything will change to character

Salary
Games

#code of rm is meaning that 'remove'

#matrix() will be adding up the numbers from top to botton and right to left
#rbind() will be adding up the numbers from each row
#cbind() will be adding up the numbers from each column

my.data <- 1:20
my.data

A <- matrix(my.data, nrow= 4, ncol=5)
# it is same as A <- matrix(my.data. 4,5)
A
A[2,3] # it will show the number that located in [2,3]

B <- matrix(my.data, 4,5, byrow = T)
B

#byrow = T is the opposite direction ordering the numbers

B[2,5]

#rbind()

r1 <- c("I","am","happy")
r2 <- c("what","a", "day")
r3 <- c(1,2,3)

C <- rbind(r1,r2,r3)
C

#cbind()
c1 <- 1:5
c2 <- -1:-5
D <- cbind(c1,c2)
D

