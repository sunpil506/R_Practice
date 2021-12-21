# Vector
#c(#,#,#,#,#) C is the funtion for Vector

MyFirstVector <- c(3, 45, 56, 732)
MyFirstVector
#is.numberic() it mean that is it numeric number?
is.numeric(MyFirstVector)
#is.integer() it mean that is it integer number?
is.integer(MyFirstVector) #result - FALSE = integer always 'double' number such as 3.0
is.double(MyFirstVector) #result - true

V2 <- c(3L,12L,243L,0L) # it is the way to create interger number with adding "L" on end.
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <-c("a","b23","Hello",7)
V3
is.character(V3)
is.numeric(V3)
is.double(V3)
#if you add number (7) on here, it automatically turned to charater which is not numeric

#sequence - it is like ':'
seq()

seq(1,15) #it mean that start numbering from 1 to 15.
seq(1,15,2) # it mean that start number from 1 upto 15 with 2 adding
z <- seq(1,15,4)

#replicate
rep()
rep(3,50) # it mean that number of 3 will show up 50 of it.

d<- rep(3,50)
d
rep("a",5) #showing "a" in 5 times

x<-c(80,20)
y<-rep(x,10)
y
