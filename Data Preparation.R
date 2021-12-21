fin <- read.csv(file.choose(), na.string=c(""))
#na.string=c("") it means that there is blank, chaning into NA
head(fin,20)
tail(fin,10)
str(fin)
summary(fin)
  #need to check each column to fix.
  #if you see the structure of "fin" does ID and Inception are int? 
  #it would be prefer as factor
  #revenue has $ sign which made it as factor

#Changing from non- factor to factor
fin$ID <- factor(fin$ID)
fin$Inception <- factor(fin$Inception)
str(fin)
summary(fin)

#Factor Variable Trap (FVT)
# FVT mean that changing from factor to non-factor
  #practice
  #converting into numerics for characters:
  a<-c("12","13","14","12","12")
  a  
  typeof(a)  # it is character
  b <-as.numeric(a)
  #as.numeric() it is changing numeric from characters
  b 
  typeof(b) # it is double
  #converting into numeric for factors:
    #Wrong
    z <- factor(c("12","13","14","12","12"))
    z
    typeof(z) # it is integer
    y <- as.numeric(z)  
    y  
    typeof(y) #it is double but it show with 1,2,3,1,1
  #correct way
  x<- as.numeric(as.character(z))
  x
  typeof(x)  # it is double

#FVT Example  
head(fin)
str(fin)
#fin$Profit <- factor(fin$Profit) it is dangerous
str(fin)

#sub() and gsub()
#sub is for one thing, gsub() is for whole thing
#gsub("what do yo want to change for","change to", "where can we find")
fin$Expenses <-gsub(" Dollars","",fin$Expenses)
fin$Expenses <-gsub(",","",fin$Expenses)
head(fin)
str(fin)
#if you see the expense, it changed as chr from factor

fin$Revenue <-gsub("\\$","",fin$Revenue) #special signs can't use as itself, need to search on google about escape sequence
fin$Revenue <- gsub(",","",fin$Revenue)
head(fin)
# it changed from factor to char.

fin$Growth <- gsub("%","",fin$Growth)
head(fin)
#it changed from factor to char
#changing from char to numeric is easier

fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)
str(fin)

#factor to numeric
# need to make factor as char and char to numeric


#What is an NA??
?NA #not available / missing values
#it is logical concept like TRUE and FALSE
TRUE  #1
FALSE #0
NA

#Locating Missing Data
head(fin,24)
fin[!complete.cases(fin),]
#! mean not
#when you see <NA> it means that it is factor

#Filtering: using which() for non-missing data
head(fin)
fin[fin$Revenue ==9746272,]
which(fin$Revenue==9746272)

#which() means that picking up the value that exactly same with fin$Revenue == 9746272
fin[which(fin$Revenue==9746272),]
head(fin) 
fin[fin$Employees ==45,] # it will show up with NA values
fin[which(fin$Employees ==45),] # it only show up with employee = 45

#Filtering : using is.na() for missing data
head(fin,24)
fin[fin$Expenses = NA,] # it is now working with NA

#is.na()  it will chekc is there any NA
a <- c(1,23,543,NA,76,45,NA)
is.na(a)

is.na(fin$Expenses)
fin[is.na(fin$Expenses),]

#Removing records with missing data
fin_backup <- fin #to make backup file
fin <- fin_backup
fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),]

fin <- fin[!is.na(fin$Industry),] # to remove the NA column 
fin
fin[!complete.cases(fin),]

#Resetting the datafram index
#when we remove NA on fin$Industry, the row number is also removed. 
fin
rownames(fin) #if you check the row number, there are no 14,15 row name
#so lets make it in order
rownames(fin) <- 1:nrow(fin)
fin
#there is no 14,15 in ID number, but it row number is order including 14,15

#replacing missing data : factual analysis
fin[!complete.cases(fin),]

fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City =="New York",]
fin[is.na(fin$State) & fin$City =="New York","State"] <- "NY"
#check : 
fin[c(11,377),]
fin[!complete.cases(fin),]
#To fix city == San Francisco and state ==<NA>
fin[is.na(fin$State)& fin$City == "San Francisco",]
fin[is.na(fin$State)& fin$City == "San Francisco", "State"] <- "CA"
#Check:
fin[c(82,265),]
fin[!complete.cases(fin),]

#Replacing Missing Data : Median Imputation Methiod (Part 1)
fin[!complete.cases(fin),]
median(fin[fin$Industry == "Retail","Employees"],na.rm=TRUE)
#Total median of employees is 56
#median of retail industry is 28

#For backup
med_empl_retail <-median(fin[fin$Industry == "Retail","Employees"],na.rm=TRUE)
med_empl_retail

fin[is.na(fin$Employees) & fin$Industry == "Retail",]
fin[is.na(fin$Employees) & fin$Industry == "Retail","Employees"] <- med_empl_retail
#Check
fin[3,]

med_empl_finserv <- median(fin[fin$Industry == "Financial Services", "Employees"], na.rm = TRUE)
med_empl_finserv
fin[is.na(fin$Employees) & fin$Industry == "Financial Services",]
fin[is.na(fin$Employees) & fin$Industry == "Financial Services","Employees"] <- med_empl_finserv
med_empl_finserv
fin[330,5] 

#Replacing Missing Data : Median Imputation Method (Part 2)
fin[!complete.cases(fin),]

med_growth_constr <- median(fin[fin$Industry=="Construction","Growth"],na.rm=TRUE)
med_growth_constr
fin[is.na(fin$Growth) & fin$Industry == "Construction",]
fin[is.na(fin$Growth) & fin$Industry == "Construction","Growth"] <- med_growth_constr
#check:
fin[8,]
fin[!complete.cases(fin),]

#NA on Revenue
median(fin[fin$Industry=="Construction","Revenue"], na.rm =TRUE)
med_rev_constr <- median(fin[fin$Industry=="Construction","Revenue"], na.rm =TRUE)
med_rev_constr
fin[is.na(fin$Revenue) & fin$Industry=="Construction",]
fin[is.na(fin$Revenue) & fin$Industry=="Construction","Revenue"] <- med_rev_constr

#NA on Expenses
median(fin[fin$Industry=="Construction", "Expenses"], na.rm =TRUE)
med_exp_constr <- median(fin[fin$Industry=="Construction", "Expenses"], na.rm =TRUE)
med_exp_constr
fin[is.na(fin$Expenses) & fin$Industry =="Construction" & is.na(fin$Profit),]
fin[is.na(fin$Expenses) & fin$Industry =="Construction" & is.na(fin$Profit), "Expenses"] <- med_exp_constr
fin[!complete.cases(fin),]

#Replacing Missing Data : deriving values
#Revenue - Expenses = profit
#Expenses = Revenue- profit
fin[is.na(fin$Profit),"Profit"] <- fin[is.na(fin$Profit),"Revenue"] - fin[is.na(fin$Profit),"Expenses"]
fin[!complete.cases(fin),]

fin[is.na(fin$Expenses),"Expenses"] <- fin[is.na(fin$Expenses),"Revenue"] - fin[is.na(fin$Expenses),"Profit"]
fin[15,]


#Visualization : 
library("ggplot2")
# A scatterplot classified by industry showing revenue, expenses, profit
p <- ggplot(data=fin)
p + geom_point(aes(x = Revenue,y = Expenses, size = Profit,color = Industry))

# A scatterplot that inclues industry trends for the expenses~revenue relationship
d <- ggplot(data = fin, aes(x= Revenue, y= Expenses, color = Industry))
d + geom_point() + geom_smooth(fill=NA, size = 1.2)

# BoxPlots showing growth by industry
f <- ggplot(data=fin, aes(x=Industry, y= Growth, color = Industry))
f + geom_boxplot(size = 1)

#Extra:
f + geom_jitter () + geom_boxplot(size =1, alpha = 0.5, outlier.colour = NA)
