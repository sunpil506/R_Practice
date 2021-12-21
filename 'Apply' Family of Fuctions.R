#You are working on a project for a meteorology bureau. You have been supplied weather data for 4 cities in the US:
#Chicago, New York, Houston, and San Francisco

#You are required to deliver the following outputs:
  # 1. A table showing the annual averages of each observed metric for every city
  # 2. A table showing by how much temperature fluctuates each month from min to
  #     max (in %). Take min temperature as the base
  # 3. A table showing the annual maximums of each observed metric for every city
  # 4. A table showing the annual minimums of each observed metric for every city
  # 5. A table showing in which months the annual maximums of each metric were
  #     observed in every city (Advanced)
getwd()
#./ it means that current set-up address
setwd(".\\P3-Weather-Data/Weather Data")
getwd()
Chicago <- read.csv("Chicago-F.csv",row.name=1)
#row.name=1 it means that take first row name from the first column
Chicago
NewYork <- read.csv("NewYork-F.csv",row.name=1)
Houston <- read.csv("Houston-F.csv",row.name=1)
SanFrancisco <- read.csv("SanFrancisco-F.csv",row.name=1)

#Check
Chicago
NewYork
Houston
SanFrancisco
#these are dataframes?
is.data.frame(Chicago)
is.data.frame(NewYork)
is.data.frame(Houston)
is.data.frame(SanFrancisco)
# Lets convert to matrices: 
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)
# Check
is.matrix(Chicago) #True
is.data.frame(Chicago)#False

#Lets put all of these into a list:
Weather <- list(Chicago, NewYork,Houston,SanFrancisco)
Weather # this list does not have the name
Weather <- list(Chicago = Chicago, NewYork = NewYork,Houston = Houston,SanFrancisco = SanFrancisco)
Weather
#lets try it out:
Weather[[3]] 
Weather$Houston

#Using apply()
Chicago
#From this Chicago matrix, we want to see the average of each row.
# 1 mean row, 2 mean col
apply(Chicago, 1,mean)
#result :
# AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
# 59.333333       43.250000        3.253333        9.916667      208.666667

#Check
mean(Chicago["DaysWithPrecip",])

#Analyze one city:
Chicago
apply(Chicago,1,max)
#result:
#AvgHigh_F        AvgLow_F  AvgPrecip_inch  DaysWithPrecip HoursOfSunshine 
#84.00           68.00            4.13           11.00          318.00
apply(Chicago, 1, min)

#for practice:
#it will not make sense, but for practice
apply(Chicago, 2, max)
apply(Chicago, 2, min)
#not working but it was good exercise

#Compare the citys:
apply(Chicago,1,mean)
apply(NewYork,1,mean)
apply(Houston,1,mean)
apply(SanFrancisco,1,mean)

# it was able to compare each cities, but there is the faster way
          
              # deliv 1 : but there is a faster way

#----Recreating the apply function with loops (advanced topic)
Chicago
#find the mean of every row:

#1. using loops
output <- NULL # it mean preparing an empty vector
for ( i in 1:5){ # run the cycle
  output[i] <- mean(Chicago[i,]) #whatever i is equal will be so on.
}
output # lets see what we have
  #from top result, we are not able to see the row name.
names(output) <- rownames(Chicago)
output

#2. using apply function
apply(Chicago, 1, mean)


#Using lapply()
?lapply #it returns a list of the same length as x,
        #each element of which is the result of apply FUN(Function) to the corresponding element of x
    # it must be list or vector
Chicago
t(Chicago)
#t() mean ths transpose :: change row and col
Weather

lapply(Weather,t) # this simple code is same as:
#list(t(Weather$Chicago),t(Weather$NewYork),t(Weather$Houston),t(SanFrancisco))
#this code will produce the list.
mynewlist <- lapply(Weather,t)
mynewlist
#Example 2
Chicago
rbind(Chicago, NewRow=1:12)
#what is I want to add new row from 1 to 12 to all my cities?
lapply(Weather, rbind, NewRow=1:12)
#it will add row of 1 to 12
#Example 3
?rowMeans # form row and column sums and mean for numeric arrays(or dataframes).
rowMeans(Chicago) #identical to : apply(Chicago, 1, mean)
#What if I want to mean of each row? and each city?
lapply(Weather, rowMeans)
                  # deliv 2 : it is better than deliv 1 but we can improve further
#rowMeans
#colMeans
#rowSums
#colSums

#Combining lapply with the [ ] operator
Weather
#what if I want to see the only Chicago's January AVGHIGH_F?
Weather[[1]][1,1] #result 32 
Weather$Chicago[1,1] # result 32 same as above
#what if I want to see the each city January AVGHIGH_F?
  Weather$Chicago[1,1] #result 32
  Weather$NewYork[1,1] #result 39
  Weather$Houston[1,1] #result 63
  Weather$SanFrancisco[1,1] # result 57
  #it is the way but!!!!!
lapply(Weather, "[",1,1) #it will show the [1,1] of each city. 
#RESULT : $Chicago [1] 32 $NewYork [1] 39 $Houston [1] 63 $SanFrancisco [1] 57
Weather
lapply(Weather,"[",1,) #This will show the [1,] of each city which is avghigh_f
# What if I only want to see every information at march of every city?
lapply(Weather,"[", ,3)

#Adding your own functions
lapply(Weather, rowMeans)
lapply(Weather, function(x) x[1,]) #showing the every first row
lapply(Weather, function(x) x[5,]) #showing the every 5th row
lapply(Weather, function(x) x[,12]) #showing the information at december of all cities
lapply(Weather, function(z) z[1,] - z[2,]) #it is the showing the avghigh_f - avglow_f
lapply(Weather, function(z) (z[1,]-z[2,])/z[2,]) # it is (avghigt_f - avglow_f) divided by avglow_f
#it comes with a lot of decimals, we need to round of it for clean.
lapply(Weather, function(z) round((z[1,]-z[2,])/z[2,],2)) #round(,2) it means that round with 2 digit.
         #Deliv2: temp fluctuations. will improve

#Practice : lets see AvgPrecip_inch divided by Dayswithprecip
Weather
function(z) round(z[3,] / z[4,],2)
lapply(Weather,function(z) round(z[3,] / z[4,],2))

#Using sapply()
?sapply() #




