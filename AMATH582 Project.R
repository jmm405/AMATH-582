install.packages("devtools")
devtools::install_github("abresler/nbastatR")
install.packages("car")
install.packages("caret")
install.packages("e1071")
install.packages("alr4")
install.packages("brglm2")
library(alr4)
library(car)
library(nbastatR)
library(caret)

assign_nba_players() #built in function for package


players <- players_careers(players = c("Ja Morant", "Kendrick Nunn",
              "Zion Williamson", "Brandon Clarke", "Coby White", 
              "Eric Paschall", "Terrence Davis II", "RJ Barrett",
              "Luka Doncic", "Trae Young", "Deandre Ayton",
              "Collin Sexton", "Shai Gilgeous-Alexander",
              "Marvin Bagley", "Josh Okogie", "Mitchell Robinson",
              "Ben Simmons", "Donovan Mitchell", "Jayson Tatum",
              "Kyle Kuzma", "Dennis Smith", "Malcolm Brogdon", "Dario Saric",
              "Joel Embiid", "Buddy Hield", "Willy Hernangomez",
              "Jamal Murray", "Marquese Chriss", "Jaylen Brown", "Yogi Ferrell",
              "Rodney McGruder", "Karl-Anthony Towns", "Nikola Jokic",
              "Devin Booker", "Jahlil Okafor", "Justise Winslow", 
              "Emmanuel Mudiay", "Myles Turner", "D'Angelo Russell",
              "Andrew Wiggins", "Nikola Mirotic", "Nerlens Noel", "Elfrid Payton",
              "Marcus Smart", "Jusuf Nurkic", "Jordan Clarkson",
              "Michael Carter-Williams", "Victor Oladipo", "Trey Burke",
              "Mason Plumlee", "Tim Hardaway Jr.", "Gorgui Dieng", "Steven Adams",
              "Giannis Antetokounmpo", "Nick Calathes", "Damian Lillard",
              "Anthony Davis", "Bradley Beal", "Andre Drummond", "Dion Waiters",
              "Harrison Barnes", "Chris Copeland", "Michael Kidd-Gilchrist",
              "Jonas Valanciunas", "John Jenkins", "Kyrie Irving", 
              "Ricky Rubio", "Kenneth Faried", "Kawhi Leonard", 
              "Iman Shumpert", "Klay Thompson", "Isaiah Thomas",
              "Brandon Knight", "Chandler Parsons", "MarShon Brooks",
              "Kemba Walker", "Josh Selby", "Blake Griffin", 
              "DeMarcus Cousins", "Landry Fields", 
              "Gary Neal", "Greg Monroe", "Tyreke Evans", 
              "Stephen Curry", "Brandon Jennings", "Darren Collison",
              "Jonny Flynn", "Taj Gibson", "Derrick Rose", 
              "O.J. Mayo", "Brook Lopez", "Russell Westbrook", "Eric Gordon",
              "Kevin Love", "Michael Beasley", "Marc Gasol", "Rudy Fernandez",
              "Robin Lopez", "Mario Chalmers", "Courtney Lee", "Nicolas Batum",
              "Kevin Durant", "Al Horford", "Luis Scola", "Al Thornton",
              "Jamario Moon", "Juan Carlos Navarro", "Thaddeus Young",
              "Mike Conley", "Carl Landry", "Brandon Roy", "Andrea Bargnani",
              "Rudy Gay", "Adam Morrison", "Randy Foye", "Paul Millsap",
              "LaMarcus Aldridge", "Jorge Garbajosa", "Tyrus Thomas", 
              "Walter Herrmann", "Craig Smith", "Rajon Rondo", "Chris Paul", 
              "Charlie Villanueva", "Andrew Bogut", "Raymond Felton",
              "Channing Frye", "Deron Williams", "Danny Granger", "Luther Head",
              "Ryan Gomes", "Emeka Okafor", "Ben Gordon", "Dwight Howard",
              "Andre Iguodala", "Luol Deng", "J.R. Smith", "LeBron James", 
              "Carmelo Anthony", "Dwayne Wade", "Chris Bosh", "Marquis Daniels",
              "Amar'e Stoudamire", "Yao Ming", "Caron Butler", "Manu Ginobili",
             "Drew Gooden", "Nene Hilario", "Carlos Boozer", "Pau Gasol",
             "Richard Jefferson", "Andrei Kirilenko", "Jason Richardson",
             "Jamaal Tinsley", "Mike Miller", "Marc Jackson",
             "Darius Miles", "Morris Peterson", "Elton Brand", "Steve Francis",
             "Lamar Odom", "Andre Miller", "Vince Carter", "Jason Williams",
             "Paul Pierce", "Tim Duncan", "Keith Van Horn", "Allen Iverson",
             "Stephon Marbury", "Shareef Abdur-Rahim", "Antoine Walker",
             "Kerry Kittles", "Damon Stoudamire", "Arvydas Sabonis", 
             "Joe Smith", "Michael Finley", "Jerry Stackhouse", "Kevin Garnett",
             "Grant Hill", "Jason Kidd", "Eddie Jones", 
             "Brian Grant", "Juwan Howard", "Chris Webber", "Anfernee Hardaway",
             "Jamal Mashburn", "Shaquille O'Neal", "Alonzo Mourning",
              "Dikembe Mutombo", "Billy Ownes",
             "Derrick Coleman", "Lionel Simmons", "Dennis Scott",
             "David Robinson", "Mitch Richmond", "Willie Anderson",
             "Chris Morris", "Mark Jackson", "Greg Anderson", "Winston Garland",
             "Kenny Smith", "Chuck Person", "Ron Harper",
             "Xavier McDaniel", "Karl Malone", "Spud Webb", "Manute Bol", 
             "Charles Oakley", "Benoit Benjamin", "Michael Jordan", 
             "Hakeem Olajuwon", "Ralph Sampson", "Terry Cummings",
             "Clark Kellogg", "James Worthy", "Buck Williams", "Kelly Tripucka",
             "Jay Vincent", "Darrel Griffith", "Kelvin Ransey", "Larry Smith",
             "Kevin McHale", "Joe Barry Carroll", "Michael Brooks",
             "Mike O'Koren", "Andrew Toney", "LaMelo Ball",
             "Tyrese Haliburton", "James Wiseman", "Anthony Edwards",
             "Immanuel Quickley"), player_ids = c("121", "244", 
              "913", "299", "2030", "202322", "1628991"),
                  modes = ("PerGame"))

winners <- c("Ja Morant", "Luka Doncic", "Ben Simmons", "Malcolm Brogdon",
             "Karl-Anthony Towns", "Andrew Wiggins", "Michael Carter-Williams",
             "Damian Lillard", "Kyrie Irving", "Blake Griffin", "Tyreke Evans",
             "Derrick Rose", "Kevin Durant", "Brandon Roy", "Chris Paul", 
             "Emeka Okafor", "LeBron James", "Amar'e Stoudamire",
             "Steve Francis", "Vince Carter", "Tim Duncan", "Allen Iverson",
             "Damon Stoudamire", "Grant Hill", "Jason Kidd", "Chris Webber",
             "Shaquille O'Neal", "Larry Johnson", "Derrick Coleman",
             "David Robinson", "Mitch Richmond", "Mark Jackson",
             "Chuck Person", "Partick Ewing", "Michael Jordan",
             "Ralph Sampson", "Terry Cummings", "Buck Williams",
             "Darrell Griffith")

runnerup <- c("Kendrick Nunn", "Trae Young", "Donovan Mitchell",
              "Dario Saric", "Kristaps Porzingis", "Nikola Mirotic",
              "Victor Oladipo", "Anthony Davis", "Ricky Rubio",
              "John Wall", "Stephen Curry", "O.J. Mayo",
              "Al Horford", "Andrea Bargnani", "Charlie Villanueva",
              "Ben Gordon", "Carmelo Anthony", "Yao Ming",
              "Richard Jefferson", "Kenyon Martin", "Jason Williams",
              "Keith Van Horn", "Stephon Marbury","Arvydas Sabonis",
              "Anfernee Hardaway", "Alonzo Mourning", "Dikembe Mutombo",
              "Lionel Simmons", "Willie Anderson", "Greg Anderson",
              "Winston Garland", "Kenny Smith", "Ron Harper",
              "Xavier McDaniel", "Hakeem Olajuwon", "Clark Kellogg",
              "Kelly Tripucka")

isRookie <- dataPlayerSeasonTotalsRegularSeason$isRookie
gp <- dataPlayerSeasonTotalsRegularSeason$gp
mins <- dataPlayerSeasonTotalsRegularSeason$minutesPerGame
pts <- dataPlayerSeasonTotalsRegularSeason$ptsPerGame
ast <- dataPlayerSeasonTotalsRegularSeason$astPerGame
reb <- dataPlayerSeasonTotalsRegularSeason$trebPerGame
stl <- dataPlayerSeasonTotalsRegularSeason$stlPerGame
blk <- dataPlayerSeasonTotalsRegularSeason$blkPerGame
oreb <- dataPlayerSeasonTotalsRegularSeason$orebPerGame
dreb <- dataPlayerSeasonTotalsRegularSeason$drebPerGame
tov <- dataPlayerSeasonTotalsRegularSeason$tovPerGame
pf <- dataPlayerSeasonTotalsRegularSeason$pfPerGame
names <- dataPlayerSeasonTotalsRegularSeason$namePlayer
season <- dataPlayerSeasonTotalsRegularSeason$slugSeason
id <- dataPlayerCareerTotalsRegularSeason$idPlayer


rookieseason <- ifelse(isRookie == TRUE, TRUE, NA)

ROY <- ifelse(names[1:2593] %in% winners == TRUE, 1, 0)

PlayerData <- data.frame(names, rookieseason, season, ROY, pts, 
                         ast, reb, stl, blk, oreb, dreb,
                         tov, pf, mins, gp )

RookieData <- na.omit(PlayerData[-c(313:314, 335:336, 1699:1700),])

nonewrookies <- RookieData[-c(54:58), ]


## 70% of the sample size
samp_size <- floor(0.7 * nrow(nonewrookies))

## set the seed to make your partition reproducible
set.seed(70)
train_ind <- sample(seq_len(nrow(nonewrookies)), size = samp_size)

trainset <- nonewrookies[train_ind, ]
testset <- nonewrookies[-train_ind, ]

## Finding Best Model

full <- glm(ROY ~ gp + pts + ast + reb
             + blk + stl + oreb + dreb + tov + pf + mins,
            data=trainset, family=binomial)

library(alr4)
vif(full)

## Removed Terms with high collinearity
full2 <- glm(ROY ~ gp + pts + ast + reb
            + blk + stl + tov + pf + mins,
            data=trainset, family=binomial)

vif(full2)
summary(full2)

## Test to see which variables are needed
minmodel <- glm(ROY~1, data=trainset, family=binomial)
formod <- step(minmodel, direction = 'forward', list(lower = minmodel, 
                                           upper = full2))
backmod <- step(full2, direction = 'backward')

loocv.lm <- function(mdl) {
  return(mean((residuals(mdl)/(1-hatvalues(mdl)))^2))
}
loocv.lm(backmod)
loocv.lm(formod)

## Make reduced from step-wise conclusion
summary(backmod)

## Check if model is better than full
anova(backmod,full2, test = "LRT")

##Intuitive Model
intuitive <- glm(ROY~ gp + pts + ast + reb + stl + blk + mins, data=trainset,
                 family = binomial)

## Make predictions on train set
prediction = predict(backmod, type = 'response', 
                     newdata=trainset)
trainset$percent <- format(round(prediction,3))

cutoffs <- seq(0.1,0.9,0.1)
accuracy <- NULL
for (i in seq(along = cutoffs)){
  cutoff_prediction <- ifelse(trainset$percent >= cutoffs[i], 1, 0) #Predicting for cut-off
  accuracy <- c(accuracy,length(which(trainset$ROY ==cutoff_prediction))/length(cutoff_prediction)*100)
}

plot(cutoffs, accuracy, pch =19,type='b',col= "purple",
     main ="Logistic Regression", xlab="Cutoff Level", ylab = "Accuracy %")


class_prediction <- ifelse(trainset$percent > .7,
                           1,0)
pred <- factor(class_prediction)
roywin <- factor(trainset$ROY)

confusionMatrix(pred,roywin)
ctabletrain <- as.table(matrix(c(133, 11, 2, 12), nrow = 2, byrow = TRUE))
fourfoldplot(ctabletrain, color = c("red3", "limegreen"),
             conf.level = 0, margin = 1, main = "Confusion Matrix Train")

## Make predictions on train set Intuitive
prediction = predict(intuitive, type = 'response', 
                     newdata=trainset)
trainset$percent2 <- format(round(prediction,3))
class_predictionint <- ifelse(trainset$percent2 > .7,
                           1,0)
predint <- factor(class_predictionint)
roywinint <- factor(trainset$ROY)
confusionMatrix(predint,roywinint)
ctabletrain <- as.table(matrix(c(134, 15, 1, 8), nrow = 2, byrow = TRUE))
fourfoldplot(ctabletrain, color = c("red3", "limegreen"),
             conf.level = 0, margin = 1, main = "Confusion Matrix Train Intuitive")

## Make predictions on test set
prediction = predict(backmod, type = 'response', 
                     newdata=testset)
testset$percent <- format(round(prediction,3))
class_prediction2 <- ifelse(testset$percent > .7,
                           1,0)
pred2 <- factor(class_prediction2)
roywin2 <- factor(testset$ROY)
confusionMatrix(pred2,roywin2)
ctabletrain2 <- as.table(matrix(c(53, 5, 2, 8), nrow = 2, byrow = TRUE))
fourfoldplot(ctabletrain2, color = c("red3", "limegreen"),
             conf.level = 0, margin = 1, main = "Confusion Matrix")

## Make predictions on test set Intuitive
prediction = predict(intuitive, type = 'response', 
                     newdata=testset)
testset$percent2 <- format(round(prediction,3))
class_predictionint <- ifelse(testset$percent2 > .7,
                              1,0)
predint <- factor(class_predictionint)
roywinint <- factor(testset$ROY)

confusionMatrix(predint,roywinint)
ctabletrain <- as.table(matrix(c(53, 7, 2, 6), nrow = 2, byrow = TRUE))
fourfoldplot(ctabletrain, color = c("red3", "limegreen"),
             conf.level = 0, margin = 1, main = "Confusion Matrix Intuitive")

FullData <- rbind(trainset,testset)

## Interaction
library(brglm2)
interactivefull <- glm(ROY ~ (gp + pts + ast + reb
                    + blk + stl + tov + pf)^2, data=trainset, family = binomial, 
                  method = "brglmFit", maxit = 10000)
summary(interactivefull)
interactivebackmod <- step(interactivefull, direction = "backward")
interactiveformod <- step(minmodel, direction = 'forward', list(lower = minmodel,
                                                              upper = interactivefull))

loocv.lm(interactivebackmod)
loocv.lm(interactiveformod)

anova(interactiveformod,interactivefull, test = 'LRT')

## Make predictions on interaction train set
prediction = predict(interactiveformod, type = 'response', 
                     newdata=trainset)
trainset$percentinteraction <- format(round(prediction,3))

cutoffs2 <- seq(0.1,0.9,0.1)
accuracy2 <- NULL
for (i in seq(along = cutoffs)){
  cutoff_prediction2 <- ifelse(trainset$percentinteraction >= cutoffs2[i], 1, 0) #Predicting for cut-off
  accuracy2 <- c(accuracy2,length(which(trainset$ROY ==cutoff_prediction2))/length(prediction)*100)
}

plot(cutoffs2, accuracy2,
     main ="Cutoff Levels for Interaction Model", xlab="Cutoff Level", ylab = "Accuracy %")

class_predictioninteraction <- ifelse(trainset$percentint > .70,
                              1,0)
predinteraction <- factor(class_predictioninteraction)
ROYinteraction <- factor(trainset$ROY)
library(caret)
confusionMatrix(predinteraction,ROYinteraction)

## Make predictions on interaction test set
prediction = predict(interactiveformod, type = 'response', 
                     newdata=testset)
testset$percentinteraction <- format(round(prediction,3))
class_predictioninteraction2 <- ifelse(testset$percentinteraction > .70,
                               1,0)
predinteraction2 <- factor(class_predictioninteraction2)
ROYinteraction2 <- factor(testset$ROY)
library(caret)
confusionMatrix(predinteraction2,ROYinteraction2)
ctabletrain <- as.table(matrix(c(50, 4, 5, 9), nrow = 2, byrow = TRUE))
fourfoldplot(ctabletrain, color = c("red3", "limegreen"),
             conf.level = 0, margin = 1, main = "Confusion Matrix Interaction")

## Yearly Races
#2019
rookies19 <- c("Luka Doncic", "Trae Young", "Deandre Ayton",
               "Collin Sexton", "Shai Gilgeous-Alexander",
               "Marvin Bagley III", "Josh Okogie", "Mitchell Robinson",
               "Jaren Jackson Jr.")
dummy19 <- ifelse(names %in% rookies19 == TRUE, 1, NA)
data19 <- data.frame(PlayerData, dummy19)
candidates19 <- na.omit(data19)
prediction = predict(backmod, type = 'response', 
                     newdata=candidates19)

candidates19$percent <- (format(round(prediction,3)))

ggplot(candidates19, aes(names, (percent),
                         fill = as.factor(percent)))+ 
  geom_bar(stat="identity") + scale_x_discrete(limits =c("Luka Doncic", 
  "Trae Young", "Deandre Ayton", "Jaren Jackson Jr.", "Collin Sexton", 
  "Shai Gilgeous-Alexander","Marvin Bagley III", "Josh Okogie",
  "Mitchell Robinson")) + labs(x='\nPlayer', y = 'Win Probability\n',
  title = "Rookie of the Year 2019 Base Model Prediction"  ) + guides(fill=guide_legend(title="Legend"))+
  theme(plot.title = element_text(hjust = 0.5))

##Intuitive Prediction
prediction = predict(intuitive, type = 'response', 
                     newdata=candidates19)

candidates19$percent2 <- (format(round(prediction,3)))

ggplot(candidates19, aes(names, (percent2),
                         fill = as.factor(percent2)))+ 
  geom_bar(stat="identity") + scale_x_discrete(limits =c("Luka Doncic", 
  "Trae Young", "Deandre Ayton", "Jaren Jackson Jr.", "Collin Sexton", 
  "Shai Gilgeous-Alexander","Marvin Bagley III", "Josh Okogie",
  "Mitchell Robinson")) + labs(x='\nPlayer', y = 'Win Probability\n',
  title = "Rookie of the Year 2019 Intuitive Model Prediction"  ) + guides(fill=guide_legend(title="Legend"))+
  theme(plot.title = element_text(hjust = 0.5))

## Interaction
prediction = predict(interactiveformod, type = 'response', 
                     newdata=candidates19)

candidates19$percent3 <- (format(round(prediction,3)))

ggplot(candidates19, aes(names, (percent3),
                         fill = as.factor(percent3)))+ 
  geom_bar(stat="identity") + scale_x_discrete(limits =c("Luka Doncic", 
              "Trae Young", "Deandre Ayton", "Jaren Jackson Jr.", "Collin Sexton", 
              "Shai Gilgeous-Alexander","Marvin Bagley III", "Josh Okogie",
      "Mitchell Robinson")) + labs(x='\nPlayer', y = 'Win Probability\n',
  title = "Rookie of the Year 2019 Interaction Model Prediction"  ) + guides(fill=guide_legend(title="Legend"))+
  theme(plot.title = element_text(hjust = 0.5))


##2021 (Current)
rookies21 <- c("LaMelo Ball",
               "Tyrese Haliburton", "James Wiseman", "Anthony Edwards",
               "Immanuel Quickley")
dummy21 <- ifelse(names %in% rookies21 == TRUE, 1, NA)
data21 <- data.frame(PlayerData, dummy21)
candidates21 <- na.omit(data21)
prediction = predict(backmod, type = 'response', 
                     newdata=candidates21)
candidates21$percent <- (format(round(prediction,3)))

ggplot(candidates21, aes(names, (percent),
                         fill = as.factor(percent)))+ 
  geom_bar(stat="identity") + scale_x_discrete(limits =
          c("LaMelo Ball",
          "Tyrese Haliburton", "James Wiseman", "Anthony Edwards",
        "Immanuel Quickley")) + labs(x='\nPlayer', y = 'Win Probability\n',
title = "Rookie of the Year 2021 Base Model"  ) + guides(fill=guide_legend(title="Legend"))+
  theme(plot.title = element_text(hjust = 0.5))

##Intuitive Prediction
prediction = predict(intuitive, type = 'response', 
                     newdata=candidates21)

candidates21$percent2 <- (format(round(prediction,3)))

ggplot(candidates21, aes(names, (percent2),
                         fill = as.factor(percent2)))+ 
  geom_bar(stat="identity") + scale_x_discrete(limits =c("LaMelo Ball",
    "Tyrese Haliburton", "James Wiseman", "Anthony Edwards",
    "Immanuel Quickley")) + labs(x='\nPlayer', y = 'Win Probability\n',
  title = "Rookie of the Year 2021 Intuitive Model"  ) + guides(fill=guide_legend(title="Legend"))+
  theme(plot.title = element_text(hjust = 0.5))

# Interaction
prediction = predict(interactiveformod, type = 'response', 
                     newdata=candidates21)

candidates21$percent3 <- (format(round(prediction,3)))

ggplot(candidates21, aes(names, (percent3),
                         fill = as.factor(percent3)))+ 
  geom_bar(stat="identity") + scale_x_discrete(limits =c("LaMelo Ball",
  "Tyrese Haliburton", "James Wiseman", "Anthony Edwards",
  "Immanuel Quickley")) + labs(x='\nPlayer', y = 'Win Probability\n',
                 title = "Rookie of the Year 2021 Interaction Model"  ) + guides(fill=guide_legend(title="Legend"))+
  theme(plot.title = element_text(hjust = 0.5))

win <- ifelse(names[1:2593] %in% winners == TRUE, 1, NA)
PlayerData2 <- data.frame(names, rookieseason, season, win, pts, 
                         ast, reb, stl, blk, oreb, dreb,
                         tov, pf, mins, gp )

runup <- ifelse(names[1:2593] %in% runnerup == TRUE, 1, NA)
PlayerData3 <- data.frame(names, rookieseason, season, runup, pts, 
                          ast, reb, stl, blk, oreb, dreb,
                          tov, pf, mins, gp )

winnerData <- na.omit(PlayerData2)
runnerData <- na.omit(PlayerData3)

winnerData$total <- winnerData$pts + winnerData$ast + winnerData$reb + 
  winnerData$stl + winnerData$blk

runnerData$total <- runnerData$pts + runnerData$ast + runnerData$reb + 
  runnerData$stl + runnerData$blk

X1 <- mean(winnerData$total)
X2 <- mean(runnerData$total)
sig1 <- sd(winnerData$total)
sig2 <- sd(runnerData$total)

Z <- (X1 - X2)/((sig1^2/36) + (sig2^2/35))
pnorm(Z, mean = 0, sd = 1)
