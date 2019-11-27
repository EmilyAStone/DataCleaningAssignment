features <- read.table('C:/Users/EAStone/Documents/Getting and Cleaning data/Week 4/Assignment/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

data.train.x <- read.table('C:/Users/EAStone/Documents/Getting and Cleaning data/Week 4/Assignment/train/X_train.txt')
data.train.activity <- read.csv('C:/Users/EAStone/Documents/Getting and Cleaning data/Week 4/Assignment/train/y_train.txt', header = FALSE, sep = ' ')
data.train.subject <- read.csv('C:/Users/EAStone/Documents/Getting and Cleaning data/Week 4/Assignment/train/subject_train.txt',header = FALSE, sep = ' ')
data.train <-  data.frame(data.train.subject, data.train.activity, data.train.x)
names(data.train) <- c(c('subject', 'activity'), features)

data.test.x <- read.table('C:/Users/EAStone/Documents/Getting and Cleaning data/Week 4/Assignment/test/X_test.txt')
data.test.activity <- read.csv('C:/Users/EAStone/Documents/Getting and Cleaning data/Week 4/Assignment/test/y_test.txt', header = FALSE, sep = ' ')
data.test.subject <- read.csv('C:/Users/EAStone/Documents/Getting and Cleaning data/Week 4/Assignment/test/subject_test.txt', header = FALSE, sep = ' ')
data.test <-  data.frame(data.test.subject, data.test.activity, data.test.x)
names(data.test) <- c(c('subject', 'activity'), features)

#Merges the training and the test sets to create one data set.
data.all <- rbind(data.train, data.test)

#Extracts only the measurements on the mean and standard deviation for each measurement.
mean_std.select <- grep("mean\\(\\)|std\\(\\)", names(data.all))
data.sub <- cbind(data.all[,c(1,2,mean_std.select)])

#Uses descriptive activity names to name the activities in the data set
activity.labels <- read.table('C:/Users/EAStone/Documents/Getting and Cleaning data/Week 4/Assignment/activity_labels.txt', header = FALSE)
activity.labels <- as.character(activity.labels[,2])
data.sub$activity <- activity.labels[data.sub$activity]

#Appropriately labels the data set with descriptive variable names
DescriptiveNames <- names(data.sub)
DescriptiveNames <- gsub("^t", "TimeDomain_", DescriptiveNames)
DescriptiveNames <- gsub("^f", "FrequencyDomain_", DescriptiveNames)
DescriptiveNames <- gsub("BodyAcc", "BodyAccelerationSignal_", DescriptiveNames)
DescriptiveNames <- gsub("BodyGyro", "BodyGyroscopeSignal_", DescriptiveNames)
DescriptiveNames <- gsub("GravityAcc", "GravityAccelerationSignal_", DescriptiveNames)
DescriptiveNames <- gsub("Jerk", "JerkSignal_", DescriptiveNames)
DescriptiveNames <- gsub("Mag", "MagnitudeofSignal_", DescriptiveNames)
DescriptiveNames <- gsub("mean[(][)]", "MeanValue_", DescriptiveNames)
DescriptiveNames <- gsub("std[(][)]", "StandardDeviation_", DescriptiveNames)
DescriptiveNames <- gsub("-", "", DescriptiveNames)
DescriptiveNames <- gsub("X", "AxisX",DescriptiveNames)
DescriptiveNames <- gsub("Y", "AxisY", DescriptiveNames)
DescriptiveNames <- gsub("Z", "AxisZ", DescriptiveNames)
DescriptiveNames <- gsub("^t", "TimeDomain_", DescriptiveNames)
DescriptiveNames <- gsub("BodyBody", "Body", DescriptiveNames)
DescriptiveNames <- gsub("_$", "_TotalBody", DescriptiveNames)
names(data.sub) <- DescriptiveNames

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
SubjectandActivityGroups<- group_by(data.sub, subject, activity)
MeanSummarydata<- summarise_all(SubjectandActivityGroups,mean)
