movies <- read.csv(choose.files())
head(movies)
colnames(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)
str(movies)

#--- Aesthetics
library(ggplot2)
  #Aes is stand for AESTHERICS 
  #it is how your data maps to what you wanna see.
ggplot(data = movies, aes(x=CriticRating, y = AudienceRating))

  #Add Geometry
ggplot(data = movies, aes(x=CriticRating, y = AudienceRating)) + 
         geom_point()
  #Add Color
ggplot(data = movies, aes(x=CriticRating, y = AudienceRating, 
                          color=Genre)) + 
  geom_point()
  #Add Size
ggplot(data = movies, aes(x=CriticRating, y = AudienceRating, 
                          color=Genre,size = Genre)) + 
  geom_point()
  #Add Size -- Better Way
ggplot(data = movies, aes(x=CriticRating, y = AudienceRating, 
                          color=Genre,size = BudgetMillions)) + 
  geom_point()
#>>> This #1 ( we will improve it)

#--- Plotting With Layers
  p <- ggplot(data = movies, aes(x=CriticRating, y = AudienceRating, 
                                 color=Genre,size = BudgetMillions))
  #point
  p + geom_point()
  
  #line
  p + geom_line()
  
  #multiple layer
  p + geom_point() + geom_line()
  p + geom_line() + geom_point()

#--- Overriding Aesthetics
q <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color = Genre, Size = BudgetMillions))

#add geom Layer
q+ geom_point()

#overriding aes
  # Example 1
  q + geom_point(aes(size = CriticRating))
  # Example 2
  q + geom_point(aes(colour= BudgetMillions))
      #q remains the same
      q + geom_point()
  # Example 3
  q + geom_point(aes(x = BudgetMillions)) + 
    xlab("Budget Millions $$$")
  # Example 4
  q + geom_line() + geom_point()
  #REDUCE LINE SIZE
  p + geom_line(size =1) + geom_point()

#--- Mapping vs Setting
r<- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating))
r + geom_point()

#Add Color
#1.Mapping(what we have done so far)
r + geom_point(aes(color=Genre))
#2. Setting ( new Way)
r + geom_point(color = "DarkGreen")
#ERROR : 
r + geom_point(aes(color="DarkGreen")) 
  #it is mapping, so if you want to use the specific color
  #then need to use the setting instead of mapping.

#1.Mapping
r + geom_point(aes(size = BudgetMillions))
#2.Setting
r + geom_point(size=10)
#ERROR:
r + geom_point(aes(size=10))
#Practice
r + geom_point(aes(size = BudgetMillions), color = "Yellow") # it work

#--- Histogram and Density Charts
s <- ggplot(data = movies, aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)
#binwidth is the width of each bar

#add Color
s + geom_histogram(binwidth=10, aes(fill=Genre))
s + geom_histogram(binwidth=10, fill="Blue")

#Add a border
s + geom_histogram(binwidth=10, aes(fill=Genre), colour ="Black")

#>>> Chart Number 3 (we will improve it)
#sometimes you many need density charts:
s+ geom_density(aes(fill=Genre))
#upper graph, it is hard to see
s+ geom_density(aes(fill=Genre), position="stack")
# this will help to see better

#--- Starting Layer Tips

t <- ggplot(data = movies, aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill = "White", color ="Blue")

# Another Way to achieve this :
t<- ggplot(data=movies)
t + geom_histogram(binwidth = 10, 
                   aes(x=AudienceRating),
                   fill = "White", color ="Blue")
#>>>>>>> 4th Chart on PowerPoint
t + geom_histogram(binwidth = 10, 
                   aes(x=CriticRating),
                   fill = "White", color ="Blue")
#>>>>>>> 5th Chart on PowerPoint
t <- ggplot() # we use this when we want to use many different data sets
t + geom_histogram(data = movies, aes(x=CriticRating),binwidth= 10)

#---- Statistical Transformations
?geom_smooth

u <- ggplot(data = movies, aes(x=CriticRating, y=AudienceRating, color = Genre))
u + geom_point() + geom_smooth(fill=NA)

#Boxplots
u <- ggplot(data=movies, aes(x=Genre, y = AudienceRating, color=Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
# tips / hacks
u + geom_boxplot(size=1.2) + geom_jitter()
  #jitter is putting the dots
#Another Way:
u + geom_jitter() + geom_boxplot(size =1.2, alpha=0.6)
  #alpha is stands for transparency
#>>>>>chart number 6


#MINI chanllege
u <- ggplot(data = movies, aes(x=Genre, y = CriticRating, color= Genre))
u + geom_boxplot(size = 1.3)

#---Using Facets

v <- ggplot(data= movies, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill = Genre), color = "black")

#facets:
v + geom_histogram(binwidth = 10, 
                   aes(fill = Genre), color = "black") + 
  facet_grid(Genre~., scales = "free")
# in facet_grid(x~.) it means that x value
v + geom_histogram(binwidth = 10, 
                   aes(fill = Genre), color = "black") + 
  facet_grid(.~Genre, scales = "free")
# in facet_grid(.~x) it means that y value

#scatterplots :

w <- ggplot(data= movies, aes(x=CriticRating, y = AudienceRating, color = Genre))
w + geom_point(size = 3)
#doing facets
w + geom_point(size = 3) +
  facet_grid(Genre~.)
w + geom_point(size = 3) +
  facet_grid(.~Year)
#combing the two thing on top
w + geom_point(size = 3) +
  facet_grid(Genre~Year)

w + geom_point(size = 3) +
  geom_smooth() +
  facet_grid(Genre~Year) 

w + geom_point(aes(size = BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) 
#>>>> 1 ( but still will improve)

#---- Coordinates

m <- ggplot(data = movies, aes(x=CriticRating, y = AudienceRating,
                               size = BudgetMillions, color = Genre))
m + geom_point()
m + geom_point() +
  xlim(50,100) + # x limit is 50 to 100
  ylim(50,100) # y limit is 50 to 100

# this will not work well always

n <- ggplot(data = movies, aes(x =BudgetMillions))
n + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")

n + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="Black") +
                  ylim(0,50) # this will cut the data which mean we are not able to see everything
#Instead - zoom:
n + geom_histogram(binwidth = 10, aes(fill=Genre), 
                   color="Black") + 
                  coord_cartesian(ylim=c(0,50))

#IMPROVE #1 
w + geom_point(aes(size = BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) + 
  coord_cartesian(ylim = c(0,100))

#------Theme
o <- ggplot(data = movies, aes(x=BudgetMillions)) 
h <- o + geom_histogram(binwidth = 10, aes(fill = Genre), color ="Black")
h

#Add axes Labels :

h + xlab("Money Axis") + ylab("Number of Movies")

# Label formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "Red", size = 30))
# tick mark formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "Red", size = 30),
        axis.text.x = element_text(size =20),
        axis.text.y = element_text(size = 20))
#Legend formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "Red", size = 30),
        axis.text.x = element_text(size =20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size =30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1))
#Title formatting
h + xlab("Money Axis") + ylab("Number of Movies") +
  ggtitle("movies Budget Distribution") +
  theme(axis.title.x = element_text(color = "DarkGreen", size = 30),
        axis.title.y = element_text(color = "Red", size = 30),
        axis.text.x = element_text(size =20),
        axis.text.y = element_text(size = 20),
        legend.title = element_text(size =30),
        legend.text = element_text(size = 20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(color="DarkBlue", size = 40,
                                  family ="Courier"))
