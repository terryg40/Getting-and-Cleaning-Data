#Loads the libraries.

library(data.table)
library(dplyr)

#Loads the training data files.

subjectTrain = read.table("train/subject_train.txt",header=FALSE)
xTrain = read.table("train/x_train.txt",header=FALSE)
yTrain = read.table("train/y_train.txt",header=FALSE)

#Loads the test data files.

subjectTest = read.table("test/subject_test.txt",header=FALSE)
xTest = read.table("test/x_test.txt",header=FALSE)
yTest = read.table("test/y_test.txt",header=FALSE)

#1a Merges the training and the test sets to create one data set. Continues after #3.

subjectData <- rbind(subjectTrain, subjectTest)
xData <- rbind(xTrain, xTest)
yData <- rbind(yTrain, yTest)

#2 Extracts only the measurements on the mean and standard deviation for each measurement.

meanStd <- xData[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]
names(meanStd) <- read.table("features.txt") [grep("-(mean|std)\\(\\)", 
                  read.table("features.txt")[, 2]), 2] 

View(meanStd)

#3. Uses descriptive activity names to name the activities in the data set.

yData[, 1] <- read.table("activity_labels.txt")[yData[, 1], 2]

names(yData) <- "Activity"
View(yData)
summary(yData)

names(subjectData) <- "Subject"
View(subjectData)
summary(subjectData)

#1b. Completes the merging of the data set.

mergedDataSet <- cbind(subjectData, meanStd, yData)

#4. Appropriately labels the data set with descriptive variable names.  Two steps to this.  First, look at
# the shortened versions:

names(mergedDataSet)

# Second, change the names to a more descriptive name and look at the new names.

names(mergedDataSet) <- make.names(names(mergedDataSet))
names(mergedDataSet) <- gsub("^t","Time.",names(mergedDataSet))
names(mergedDataSet) <- gsub("Acc","Accelerometer",names(mergedDataSet))
names(mergedDataSet) <- gsub("-mean()", ".Mean",names(mergedDataSet))
names(mergedDataSet) <- gsub("-std()", ".StandardDeviation",names(mergedDataSet))
names(mergedDataSet) <- gsub(".mean()", ".Mean",names(mergedDataSet))
names(mergedDataSet) <- gsub(".std()", ".StandardDeviation",names(mergedDataSet))
names(mergedDataSet) <- gsub("Gyro","Gyroscope",names(mergedDataSet))
names(mergedDataSet) <- gsub("Mag","Magnitude",names(mergedDataSet))
names(mergedDataSet) <- gsub("^f","Frequency.",names(mergedDataSet))
names(mergedDataSet) <- gsub("BodyBody","Body",names(mergedDataSet))

names(mergedDataSet)
View(mergedDataSet)




#5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

TidyData<-aggregate(. ~Subject + Activity, mergedDataSet, mean)
TidyData<-TidyData[order(TidyData$Subject,TidyData$Activity),]
write.table(TidyData, file = "tidydata.txt",row.name=FALSE)
