#Lists In R

#Deliberable - a list with the following components:
#Character : Machine Name
#Vector : (min, mean, max) Utilization for the month (excluding unknown hours)
#Logical : Has utilization ever fallen below 90%? True / False
#Vector : All hours where utilization is unknown (NA's)
#Dataframe : For this machine
#Plot : For all machine

setwd("C:\\Users\\showa\\Downloads")
getwd()

util <- read.csv("P3-Machine-Utilization.csv")
head(util,12)
str(util)
summary(util)

#if you see the data, percent.idle need to be changed
#Derive utilization column
util$Utilization = 1 - util$Percent.Idle
head(util,12)

#Handling Data-Times in R
head(util)
tail(util)
# timestamp what is month, day?
# day/month/year if you check the tail
?POSIXct
#POSIX is the IEEE Standard 
#ct mean Calendar Time
util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")
head(util,12)
summary(util)

#TIP : how to rearrange column in a df:
util$Timestamp <- NULL
head(util,12)
util <- util[,c(4,1,2,3)]
head(util,12)

#What is a list?
summary(util)
RL1 <- util[util$Machine == "RL1",]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)
summary(RL1)

#Construct list:
#Character : Machine Name
#Vector : (min, mean, max) Utilization for the month (excluding unknown hours)
#Logical : Has utilization ever fallen below 90%? True / False


#Vector : (min, mean, max) Utilization for the month (excluding unknown hours)
util_stats_rl1 <- c(min(RL1$Utilization, na.rm=T),
                    mean(RL1$Utilization, na.rm=T),
                    max(RL1$Utilization, na.rm=T))
util_stats_rl1

#Logical : Has utilization ever fallen below 90%? True / False
which(RL1$Utilization < 0.90)
util_under_90_flag <- length(which(RL1$Utilization < 0.90)) > 0
util_under_90_flag

#create list
list_rl1 <- list("RL1", util_stats_rl1, util_under_90_flag)
list_rl1

#Naming Components of a list
list_rl1
names(list_rl1)
names(list_rl1) <- c("Machine", "Stats", "LowThresholed")
list_rl1
#Another way. like with dataframes:
#rm(list_rl1) to remove the previous names
list_rl1 <- list(Machine="RL1",Stats = util_stats_rl1, LowThresholed=util_under_90_flag)
list_rl1

#Extracting components of a list 
#three ways:
#[] - will always return a list
#[[]] - will always return the actual object
#$ - same as [[]]but prettier

list_rl1 #$Machine [1] "RL1" $Stats [1] 0.8492262 0.9516976 0.9950000 $LowThresholed [1] TRUE

list_rl1[1] # $Machine [1] "RL1"
list_rl1[[1]] # "RL1"
list_rl1$Machine #"RL1"

list_rl1[2] # $Stats [1] 0.8492262 0.9516976 0.9950000
typeof(list_rl1[2]) #result - list
list_rl1[[2]]
typeof(list_rl1[[2]]) #result - double
list_rl1$Stats # [1] 0.8492262 0.9516976 0.9950000
typeof(list_rl1$Stats) #result - double

list_rl1[3] # $LowThresholed [1] TRUE
typeof(list_rl1[3]) # list
list_rl1[[3]] # [1] TRUE
typeof(list_rl1[[3]])# logical
list_rl1$LowThresholed # TRUE
typeof(list_rl1$LowThresholed) # Logical

#how would you access the 3rd element of the vector (max utilization)?
list_rl1[[2]][3] #list_rl1[[2]] it is the vector, and I want to go to 3rd number 
                 #result - 0.995
list_rl1$Stats[3] #it also working # result - 0.995

#Adding and deleting list components
list_rl1 #it has three different component
list_rl1[4] <- "New Information"
list_rl1
# Practice myself : adding the name for "New Information"
list_rl1[4] <- "New Information"
list_rl1 <-list(Machine="RL1",Stats = util_stats_rl1, LowThresholed=util_under_90_flag,Hello="New Information") 
list_rl1 #need to put all names and result on here


#Another way to add a component with $ sign
# we will add:
#Vector: All hours where utilization is unknown(NA's)
list_rl1$UnknownHours <- RL1[is.na(RL1$Utilization),"PosixTime"]
list_rl1

#Remove a component. Use the NULL method:
list_rl1[4] <- NULL
## Notice : numeration has shifted
list_rl1[4] #Even we null of it, we are able to see it.

#Add another component:
#Dataframe : For this machine
list_rl1$Data <- RL1
list_rl1 # it is huge data
summary(list_rl1)
str(list_rl1)

#Subsetting a list
list_rl1
#how to go the data where is unknownhours with 1st valuable
list_rl1$UnknownHours[1]
list_rl1[[5]][1] #might confuse with [[4]][1] it is for NULL value : new information

#Let's proceed...
list_rl1
list_rl1[1:3]
list_rl1[c(1,3,5)]
sublist_rl1 <- list_rl1[c("Machine","Stats")]
sublist_rl1
sublist_rl1[[2]][2]
#single square brackets are for subsetting 
#double square brackets are for accessing elements of a list

#Double Square Brackets Are NOT for Subsetting:
list_rl1[[1:3]] #return with ERROR
#Double Square brackets always accessing specific one.
list_rl1[[4]]

#Building a timeseries plot
library(ggplot2)
p <- ggplot(data = util)
p + geom_line(aes(x=PosixTime, y= Utilization)) # massy hard to see
p + geom_line(aes(x=PosixTime, y= Utilization, color = Machine), size= 1.2) +
  facet_grid(Machine~.) 
#facet_grid() will divide the chart seperately
p + geom_line(aes(x=PosixTime, y= Utilization, color = Machine), size= 1.2) +
  facet_grid(Machine~.) + 
  geom_hline(yintercept = 0.90, color ="Gray", size=1.2,linetype=3)
#geom_hline () mean that putting horizontal line.
#yintercept= it means that where I want to put the horizontal line at.
#linetype= means that type of line at horizontal line. 
  #0-blank,1-solid,2-dashed,3-dotted

#if you see the chart, you are able to see which machine is under 90% operation. 

myplot <- p + geom_line(aes(x=PosixTime, y= Utilization, color = Machine), size= 1.2) +
  facet_grid(Machine~.) + 
  geom_hline(yintercept = 0.90, color ="Gray", size=1.2,linetype=3)
list_rl1$Plot <- myplot
list_rl1
#there are Machine, Stats, LowThresholed, Hello, UnknownHours, Data, Plot
summary(list_rl1)
str(list_rl1)

