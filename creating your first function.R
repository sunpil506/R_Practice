Data <- MinutesPlayed[1,,drop=F]
matplot(t(Data), type ="b", pch= 15:18, col=c(1:4,6))
legend("bottomleft",inset=0.01, legend=Players[1], col=c(1:4,6), pch=15:18, horiz=F)

myplot <- function(data,rows=1:10){
  Data <- data[rows,,drop=F]
  matplot(t(Data), type ="b", pch= 15:18, col=c(1:4,6))
  legend("bottomleft",inset=0.01, legend=Players[rows], col=c(1:4,6), pch=15:18, horiz=F)
}
myplot(Games)
