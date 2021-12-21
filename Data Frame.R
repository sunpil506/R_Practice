
#Method 1 : Select the file manaually
  #read.csv(file.choose()) this command will lead you to file explorer to choose the file
stats <- read.csv(file.choose())
stats

# Method 2 : Set WD(Working Directly) and Read Data
getwd() #where I usually get the WD
setwd("C:\\Users\\showa\\Downloads\\") #set up where will I get the WD
getwd()
rm(stats)
stats <- read.csv("P2-Demographic-Data.csv")
stats

#-------Exploring Data----------------
stats-----------
nrow(stats) # it will explain about how many row have
ncol(stats) # it will explain about how many column have
head(stats) # it will show the top 6 row
tail(stats) #it will show the bottom 6 row

head(stats, n=12) #it will show the top 16 row
str(stats) #str is stands for "structure" -> brief informations about the data
summary(stats) # summary about the data

#---Using the $ sign------------
# $ sign ONLY will use on datafram NOT Metrix
stats
head(stats)
stats[3,3]
stats[3,"Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
# upon code will come out with same result as below
stats[,"Internet.users"]
levels(stats$Income.Group)

#---Basic Operations with a DF (Data Frame)---------
stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]
#Remember how the [ ] work:
stats[1,] #will show the first row
is.data.frame(stats[1,]) #result as TRUE
stats[,1]
is.data.frame(stats[,1])#result as FALSE
#if you want to make as data frame then need to do
stats[,1,drop=F]
is.data.frame(stats[,1,drop=F]) # result as TRUE

#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

#add column
head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users

#test of knowledge
stats$xyz <- 1:5 # it actually operate correctly, and will recycle between 1 to 5 until the data end
    # 1:5 is working because total 195 of row 
    #195/5  하면 정수이니깐 가능 소수점이 되거나 나누기가 깔끔하게 안되면 문제가 됨

#remove a column
head(stats)
stats$MyCalc <- NULL
#it will remove
stats$xyz <- NULL
head(stats)

#---Filtering Data Frames---------------
head(stats)
filter <- stats$Internet.users < 2 
stats[filter,]

stats[stats$Birth.rate > 40 & stats$Internet.users <2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]

#---Introduction to qplot()
install.packages("ggplot2")
library(ggplot2)

qplot(data = stats, x=Internet.users)
qplot(data = stats, x=Income.Group, y=Birth.rate)
qplot(data = stats, x=Income.Group, y=Birth.rate, size=I(3))
qplot(data = stats, x=Income.Group, y=Birth.rate, size=I(3), colour=I("purple"))
qplot(data = stats, x=Income.Group, y=Birth.rate, geom="boxplot")

#---Visualizing what we need
qplot(data = stats, x=Internet.users, y=Birth.rate)
qplot(data = stats, x=Internet.users, y=Birth.rate, size=I(4))
qplot(data = stats, x=Internet.users, y=Birth.rate, size=I(4), color=I("red"))
qplot(data = stats, x=Internet.users, y=Birth.rate, size=I(4), color=I("red"))
qplot(data = stats, x=Internet.users, y=Birth.rate, size=I(4), color=Income.Group)

#--- Creating Data Frames
#firstly we download the data vectors 

# this is the one way
mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("Country","Code","Region") #c() the reason of using c() is this is vector
head(mydf)

#this is the another way
mydf <- data.frame(Country = Countries_2012_Dataset,Code = Codes_2012_Dataset,Region = Regions_2012_Dataset)
head(mydf)
tail(mydf)
summary(mydf)

#--- Merging Data Frames
head(mydf)
head(stats)

merged <- merge(stats, mydf, by.x = "Country.Code", by.y = "Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)

#--- Visualizing With new Split

qplot(data = merged, x= Internet.users, y=Birth.rate)
qplot(data = merged, x= Internet.users, y=Birth.rate, color = Region)

#1. Shapes
qplot(data = merged, x= Internet.users, y=Birth.rate, color = Region,size=I(5),
      shape=I(19))

#2.Transparency
qplot(data = merged, x= Internet.users, y=Birth.rate, color = Region,size=I(5),
      shape=I(19),alpha=I(0.1))
  #alpha is the name for transparency.
  #alpha is the number between 0 and 1, 0 is the most transparency, 1 is not the most transparency
qplot(data = merged, x= Internet.users, y=Birth.rate, color = Region,size=I(5),
      shape=I(19),alpha=I(0.7))

#3. Title
qplot(data = merged, x= Internet.users, y=Birth.rate, color = Region,size=I(5),
      shape=I(19),alpha=I(0.7),main = "Birth Rate vs Internet Users")

