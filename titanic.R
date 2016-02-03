trainData <- read.csv("E:\\DATA\\tutorials\\Data Science\\project\\titanic\\data\\train.csv", header = TRUE, stringsAsFactors = FALSE)
testData <- read.csv("E:\\DATA\\tutorials\\Data Science\\project\\titanic\\data\\test.csv", header = TRUE, stringsAsFactors = FALSE)

head(trainData)

plot(density(trainData$Age, na.rm = TRUE))
plot(density(trainData$Fare, na.rm = TRUE))

#sURVIVAL RATE BY SEX PLOT
counts <- table(trainData$Survived, trainData$Sex)
barplot(counts, xlab = "Gender", ylab = "Number of People", main = "survived and deceased between male and female", col=trainData$Survived)
counts[2] / (counts[1] + counts[2])
counts[4] / (counts[3] + counts[4])

#SURVIVAL RATE BY PASSENGER CLASS
Pclass_survival <- table(trainData$Survived, trainData$Pclass)
barplot(Pclass_survival, xlab = "Cabin Class", ylab = "Number of People",
        main = "survived and deceased between male and female", col=trainData$Survived)
Pclass_survival[2] / (Pclass_survival[1] + Pclass_survival[2])
Pclass_survival[4] / (Pclass_survival[3] + Pclass_survival[4])
Pclass_survival[6] / (Pclass_survival[5] + Pclass_survival[6])

#Removing variable that we dont need
trainData = trainData[-c(1,9:12)]
names(trainData)

#Replacing gender variable; gsub() which will replace any text with a value of our choosing.
trainData$Sex = gsub("female", 1, trainData$Sex)
trainData$Sex = gsub("^male", 0, trainData$Sex)

#Making Inference on missing age values;  grep() function which will return a vector of row numbers which have a specified surname.

master_vector = grep("Master.",trainData$Name, fixed=TRUE)
miss_vector = grep("Miss.", trainData$Name, fixed=TRUE)
mrs_vector = grep("Mrs.", trainData$Name, fixed=TRUE)
mr_vector = grep("Mr.", trainData$Name, fixed=TRUE)
dr_vector = grep("Dr.", trainData$Name, fixed=TRUE)

#we rename each name with a shortened tag
for(i in master_vector) {
  trainData$Name[i] = "Master"
}
for(i in miss_vector) {
  trainData$Name[i] = "Miss"
}
for(i in mrs_vector) {
  trainData$Name[i] = "Mrs"
}
for(i in mr_vector) {
  trainData$Name[i] = "Mr"
}
for(i in dr_vector) {
  trainData$Name[i] = "Dr"
}


#Making Inference on Missing Age Values: Inputting Title-group averages

master_age = round(mean(trainData$Age[trainData$Name == "Master"], na.rm = TRUE), digits = 2)
miss_age = round(mean(trainData$Age[trainData$Name == "Miss"], na.rm = TRUE), digits =2)
mrs_age = round(mean(trainData$Age[trainData$Name == "Mrs"], na.rm = TRUE), digits = 2)
mr_age = round(mean(trainData$Age[trainData$Name == "Mr"], na.rm = TRUE), digits = 2)
dr_age = round(mean(trainData$Age[trainData$Name == "Dr"], na.rm = TRUE), digits = 2)

for (i in 1:nrow(trainData)) {
  if (is.na(trainData[i,5])) {
    if (trainData$Name[i] == "Master") {
      trainData$Age[i] = master_age
    } else if (trainData$Name[i] == "Miss") {
      trainData$Age[i] = miss_age
    } else if (trainData$Name[i] == "Mrs") {
      trainData$Age[i] = mrs_age
    } else if (trainData$Name[i] == "Mr") {
      trainData$Age[i] = mr_age
    } else if (trainData$Name[i] == "Dr") {
      trainData$Age[i] = dr_age
    } else {
      print("Uncaught Title")
    }
  }
}

