# Getting And Cleaning_Data
This repository is for a project where data collected from Samsung galaxy S2 for various activities performed by subjects is cleaned and final averages is calculated.

In this project data collected from Samsung galaxy S2 for various activities performed 
by subjects is cleaned and final averages is calculated.

## IMPORTANT PREREQUISITE
Download the following zip file for data-
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Extract the zip and copy the directory 'UCI HAR Dataset' into the same directory as
run_analysis.R location.
This code completely depends on the 'UCI HAR Dataset' folder being in the same location
along side run_analysis.R.

***Developed and tested on Windows Operating System.

## This R code does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Running the script
Please note- the setwd() is just an example. Change it to respective one as applicable for you.

> setwd("C:/Study/Coursera/GettingAndClearningData/Week3/Final_Work/Getting_And_Cleaning_Data")
> source("run_analysis.R")
[1] "reading subject test data."
[1] "reading data from test data."
[1] "reading labels from test data."
[1] "reading subject from training data."
[1] "reading data from training data."
[1] "reading label data from training data."
[1] "PROJECT ASSIGNMENT PART 1- Merging the respective data sets..."
[1] "Part2: Extracting the measurements on the mean and standard deviation..."
[1] "Part3: Applying descriptive activity names..."
[1] "Part4: Writing to a file with appropriate labels..."
[1] "Part5: In the working directory created a tidy data file- final_tidy_dataset_5.txt."
> 

> dir()
[1] "CodeBook.md"                 "final_clean_merged_data.txt"
[3] "final_tidy_dataset_5.txt"    "README.md"                  
[5] "run_analysis.R"              "UCI HAR Dataset"            
> 

You should be able to see "final_clean_merged_data.txt". That is the output from step 5.



