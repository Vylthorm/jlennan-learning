batting <- read.csv('C:\\Users\\lenna\\Downloads\\Coding\\R-for-Data-Science-and-Machine-Learning\\Training Exercises\\Capstone and Data Viz Projects\\Capstone Project\\Batting.csv')
head(batting)
str(batting)
#at bats column
head(batting$AB)
#doubles column
head(batting$X2B)

#batting average
batting$BA = batting$H / batting$AB
tail(batting$BA,5)



# On Base Percentage
batting$OBP <- (batting$H + batting$BB + batting$HBP)/(batting$AB + batting$BB + batting$HBP + batting$SF)

# Creating X1B (Singles)
batting$X1B <- batting$H - batting$X2B - batting$X3B - batting$HR

# Creating Slugging Average (SLG)
batting$SLG <- ((1 * batting$X1B) + (2 * batting$X2B) + (3 * batting$X3B) + (4 * batting$HR) ) / batting$AB

str(batting)

sal <- read.csv('C:\\Users\\lenna\\Downloads\\Coding\\R-for-Data-Science-and-Machine-Learning\\Training Exercises\\Capstone and Data Viz Projects\\Capstone Project\\Salaries.csv')

summary(batting)


batting <- subset(batting,yearID >= 1985)

summary(batting)

combo <- merge(batting,sal,by=c('playerID','yearID'))

summary(combo)


lost_players <- subset(combo,playerID %in% c('giambja01','damonjo01','saenzol01') )

lost_players
lost_players <- subset(lost_players,yearID == 2001)

lost_players <- lost_players[,c('playerID','H','X2B','X3B','HR','OBP','SLG','BA','AB')]


head(lost_players)



library(dplyr)
avail.players <- filter(combo,yearID==2001)



library(ggplot2)
ggplot(avail.players,aes(x=OBP,y=salary)) + geom_point()

avail.players <- filter(avail.players,salary<8000000,OBP>0)


avail.players <- filter(avail.players,AB >= 500)

possible <- head(arrange(avail.players,desc(OBP)),10)

possible <- possible[,c('playerID','OBP','AB','salary')]
possible

possible[2:4,]

