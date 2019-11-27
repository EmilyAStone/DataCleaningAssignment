---
title: "CodeBook"
author: "Emily Stone"
date: "26/11/2019"
output: html_document
---

##Data used
Download the dataset
Test data
- subject_test: has a list of subject Id's (2947 obs. of  1 variable)
- Y_test: integer numbers 1-6 indexing an activity (2947 obs. of  1 variable)
- X_test: has information on different features (2947 obs. of  561 variables)

Train data
- subject_train: has a list of subject Id's (2947 obs. of  1 variable)
- Y_train: integer numbers 1-6 indexing an activity (2947 obs. of  1 variable)
- X_train: has information (2947 obs. of  561 variables)

Lavels
- features: list of the names of different features in the X_train and Y_train dataset (names of 561 variables)
- activity_labels: table showing which activity each integer number 1-6 represents (6 obs. of 2 variables)

##Transformations to the data
-Merges the training and the test sets to create one data set
-Extracts only the measurements on the mean and standard deviation for each measurement
-Uses descriptive activity names to name the activities in the data set
-Appropriately labels the data set with descriptive variable names
-Creates a second, independent tidy data set with the average of each variable for each activity and each subject

##Variables in transformed data
- Subject
- Activity
- Mean of features


##Further details on features
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


