x <-rnorm(5)

#R-specific programming loop
for(i in x){
  print(i)
}

print(x[1])
print(x[2])
print(x[3])
print(x[4])
print(x[5])

#conventional programming loop
for(j in 1:5){
  print(x[j])
}

#---------------2nd part for today

n <- 100
a <- rnorm(n)
b <- rnorm(n)

#Vectorized approach
c <- a* b
#Devectorized approach
d <- rep(NA,n)
for( i in 1:n){
  d[i] <- a[i] *b[i]
}