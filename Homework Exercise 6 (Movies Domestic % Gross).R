#import the data
mov <- read.csv(choose.files())
#Checking data exploration
head(mov)
tail(mov)
summary(mov)
str(mov)

#activate ggplot
library(ggplot2)

#filter #1 data frame 
filt <- (mov$Genre =="action") | (mov$Genre =="adventure") | (mov$Genre =="animation") | (mov$Genre =="comedy") | (mov$Genre =="drama")
#filter #2 data frame
filt2 <- mov$Studio %in% c("Buena Vista Studios","Fox","Paramount Pictures","Sony","Universal","WB")

mov2 <- mov[filt & filt2,]
mov2

#prepare the plot's data and aes layers:
p <- ggplot(data = mov2, aes(x = Genre, y= Gross...US))
# Add geometries
q <- p + geom_jitter(aes(size = Budget...mill.,color=Studio)) +
  geom_boxplot(alpha =0.5,outlier.color=NA) 
q  

#non-data ink
q <- q +
  xlab("Genre") +
  ylab("Gross % US")+
  ggtitle("Domestic Gross % by Genre")
q

#fix the theme
q <- q + theme(
  axis.title.x = element_text(color ="Blue", size = 30),
  axis.title.y = element_text(color = "Blue", size = 30),
  axis.text.x = element_text(size=20),
  axis.text.y = element_text(size=20),
  plot.title = element_text(size = 40),
  legend.title = element_text(size = 20),
  legend.text = element_text(size =20),
  text = element_text(family ="Comic Sans MS")
  )
q

# Final touch
q$labels$size <- "Budget $M"
q
