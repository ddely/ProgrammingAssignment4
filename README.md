# Getting and Cleaning Data Course Project 



### About run_analysis.R:

The R script performs the following actions:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names.
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Instructions for using the script

1. Download and unzip the data set to your working directory.  The dataset can be found at: 

   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

2. In the same folder as the data, load the script using source("run_analysis.R")

3. Run run_analysis.R

4. The script will create two files named tidy_dataset.csv and tidy_dataset.txt. These are tidy versions of the original data with the      average of each variable for each activity and subject. 
