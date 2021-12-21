?matplot
matplot(t(FieldGoals/Games), type ="b", pch= 15:18, col=c(1:4,6))
#legend will create the box that describe about the name on each color and shapr on grahp.
legend("bottomleft",inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)
#col mean color NOT COLUMN

# t() mean that change the row and column opposite
t(FieldGoals)

matplot(t(FieldGoals/FieldGoalAttempts), type ="b", pch= 15:18, col=c(1:4,6))
#legend will create the box that describe about the name on each color and shapr on grahp.
legend("bottomleft",inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

#exercise
matplot(t(Points/Salary), type ="b", pch= 15:18, col=c(1:4,6))
#legend will create the box that describe about the name on each color and shapr on grahp.
legend("bottomleft",inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)

