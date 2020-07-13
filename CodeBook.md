#### Getting and Cleaning Data - Course Project

##### The researchers collecting the data had 30 volunteers wear a Samsung Galaxy S II smartphone on their waist while performing one of six activities.  The experiments were   
##### video-recorded and the data labeled manually. The volunteers were randomly assigned to a test (30%) or a training (70%) group.

##### The activities were:

#####    1 - Standing
#####    2 - Sitting
#####    3 - Laying
#####    4 - Walking
#####    5 - Walking Downstairs
#####    6 - Walking Upstairs

##### The sensor signals (accelerometer and gyroscope) on the smartphone allowed an array of data (561-feature vetor with time and frequency domain variable). For the purpose
##### of this project, only the following were of interest, as they had Means and Standard Deviations:

#####    tBodyAcc
#####    tGravityAcc
#####    tBodyAccJerk
#####    tBodyGyro
#####    tBodyGyroJerk
#####    tBodyAccMag
#####    tGravityAccMag
#####    tBodyAccJerkMag
#####    tBodyGyroMag
#####    tBodyGyroJerkMag
#####    fBodyAcc
#####    fBodyAccJerk
#####    fBodyGyro
#####    fBodyAccMag
#####    fBodyBodyAccJerkMag
#####    fBodyBodyGyroMag
#####    fBodyBodyGyroJerkMag

##### As part of the cleaning section of the project, the labels, including the previous ones, were cleaned up a bit.  Such that:

#####    t - Time
#####    Acc - Accelerometer
#####    -mean - Mean
#####    -std - StandardDeviation
#####    Gyro - Gyroscope
#####    Mag - Magnitude
#####    f - Frequency
#####    BodyBody - Body

##### Not perfect, but a little more readable.

##### OK, onto a brief explanation of the R script for the project. 

##### 1. Merge the training and test sets to create one data set.
##### -- I read the data tables, using subjectTest, subjectTrain, xTest, xTrain, yTest, yTrain as my data set names. I combined the subject, x, and y into variables called  
##### -- subjectData, xData, and yData using rbind. I then merged these into one data set called mergedDataSet using cbind.

##### 2. Extracts measurements on the mean and standard deviation for each measurement.
##### -- My variable for this is called meanStd.

##### 3. Uses descriptive activity names to name the activities in the data set.
##### -- Just made sure the labels in the table were the activity names, rather than a number.

##### 4. Appropriately labels the data set with descriptive variable names.
##### -- This is where the transformation of the abbreviations was made, as noted above.

##### 5. Lastly, from the data set in 4, creates a second, independent tidy data set with the average of each variable
##### -- for each activity and each subject.  The last line exports this to a file called tidydata.txt.


