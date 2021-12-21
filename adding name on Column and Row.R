#Named Vectors
Charlie <- 1:5
Charlie

#given names
names(Charlie) <- c("a","b","c","d","e") #NULL mean nothing
Charlie
Charlie ["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

#---------------------------

#Naming Matrix Dimensions 1
temp.vec <- rep(c("a","B","zZ"),each=3) #replicate "a","B","zZ" three times
temp.vec

Bravo <- matrix(temp.vec,3,3)
Bravo
#adding row name
rownames(Bravo) <- c("How","are","you?")
Bravo
#adding column name
colnames(Bravo) <- c("x","y","z")
Bravo

#change the one thing to different
Bravo[2,2] <- 0
Bravo
