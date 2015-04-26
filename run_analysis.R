## In this project data collected from Samsung galaxy S2 for various activities performed 
## by subjects is cleaned and final averages is calculated.
## 
## AUTHOR: Phani Tipparaju
## DATE: 24 April 2015

## IMPORTANT PREREQUISITE
## Download the following zip file for data-
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Extract the zip and copy the directory 'UCI HAR Dataset' into the same directory as
## run_analysis.R location.
## This code completely depends on the 'UCI HAR Dataset' folder being in the same location
## along side run_analysis.R.


## In the following section loading of **TEST** data into 3 different tables
## is performed.
##

## Each row identifies the subject who performed the activity 
## for each window sample. Its range is from 1 to 30. 
## Info- Number of rows here is 2946, column is 1

print("reading subject test data.")
subject_test_data <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Info- Number of rows here is 2946 as well, columns are 561
print("reading data from test data.")
test_set_data <- read.table("./UCI HAR Dataset/test/X_test.txt")

## Info- Number of rows here is 2946 as well, column is 1
print("reading labels from test data.")
test_set_labels <- read.table("./UCI HAR Dataset/test/y_test.txt")

##
## In the following section loading of **TRAIN** data into 3 different tables
## is performed.
##

## Each row identifies the subject who performed the activity
## Info- Number of rows here is 7351, column is 1

print("reading subject from training data.")
subject_train_data <- read.table("./UCI HAR Dataset/train/subject_train.txt")

## Info- Number of rows here is 7351 as well, columns are 561
print("reading data from training data.")
train_set_data <- read.table("./UCI HAR Dataset/train/X_train.txt")

## Info- Number of rows here is 7351 as well, column is 1

print("reading label data from training data.")
train_set_labels <- read.table("./UCI HAR Dataset/train/y_train.txt")

#######             PROJECT ASSIGNMENT PART 1                                ##########
########       Merges the training and the test sets to create one data set. ##########
#########   COMBINING THE respective TEST AND TRAIN DATA HERE                ##########
#########   This will be a row bind                                          ##########

print("PROJECT ASSIGNMENT PART 1- Merging the respective data sets...")

## Combining subject data
subject_data <- rbind(subject_train_data, subject_test_data)

## combining data
master_data <- rbind(train_set_data, test_set_data)

## combining label data
label_data <- rbind (train_set_labels, test_set_labels)


#######             PROJECT ASSIGNMENT PART 2                               
#######  Extracts only the measurements on the mean and standard 
#######  deviation for each measurement. 

print("Part2: Extracting the measurements on the mean and standard deviation...")

features <- read.table("./UCI HAR Dataset/features.txt")

meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndices) # 66
master_data <- master_data[, meanStdIndices]
dim(master_data) # 10299*66
names(master_data) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # remove "()"
names(master_data) <- gsub("mean", "Mean", names(master_data)) # capitalize M
names(master_data) <- gsub("std", "Std", names(master_data)) # capitalize S
names(master_data) <- gsub("-", "", names(master_data)) # remove "-" in column names 

### final data set containing just mean and standard deviation

## master_data


#######             PROJECT ASSIGNMENT PART 3                               
#######  Uses descriptive activity names to name the activities in the data set

activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2])) # changing to all lower
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8)) # changing D caps for walking downstairs
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8)) # changing U caps for walking upstairs
activityLabel <- activity[label_data[, 1], 2]
label_data[, 1] <- activityLabel
names(label_data) <- "activity"

print("Part3: Applying descriptive activity names...")

#######             PROJECT ASSIGNMENT PART 4                              
#######  Appropriately labels the data set with descriptive variable names.

names(subject_data) <- "subject"
final_cleanedData <- cbind(subject_data, label_data, master_data)
dim(final_cleanedData) # 10299*68
write.table(final_cleanedData, "final_clean_merged_data.txt") # write out the dataset

print("Part4: Writing to a file with appropriate labels...")

#######             PROJECT ASSIGNMENT PART 5
#######         Average of mean and standard deviation by subject and activity

measurements <- final_cleanedData[, 3:dim(final_cleanedData)[2]]
tidy_dataset <- aggregate(measurements, list(final_cleanedData$subject, final_cleanedData$activity), mean)
names(tidy_dataset)[1:2] <- c('subject', 'activity')
write.table(tidy_dataset, "./final_tidy_dataset_5.txt", row.name=FALSE)

print("Part5: In the working directory created a tidy data file- final_tidy_dataset_5.txt.")


