# Final assignment for Coursera course Getting and Cleaning Data

Students were asked to complete the exercise described below.  This GitHub repository contains a file titled run_analysis.R that performs the requested steps. The R script requires that the files and folder structure from the UCI HAR Dataset zip archive, listed in the original assignment instructions below, have been unpacked and are present in the R working directory. There should be four text files (README.txt, activity_labels.txt, features.txt, features_info.txt), and two folders titled 'test' and 'train'. Upon execution, the R script will produce a tidy data set titled 'final_assignment_tidy_data.txt'. In accordance with the assignment directions, the tidy data set is comprised of 180 observations of 79 variables. These observations are averages of the 66 UCI HAR Dataset variables containing 'mean()' or 'std()' in their titles, for each of 30 subjects, multiplied by 6 possible activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). This same tidy data set has been uploaded to the Coursera website and can be downloaded and evaluated in R as follows:

> fileURL = "https://coursera-assessments.s3.amazonaws.com/assessments/1582595185607/d995ac91-0a6b-4533-9bb6-717f730f00f1/final_assignment_tidy_data.txt"
> download.file(fileURL, destfile="SJM_final_assignment_tidy_data.txt", method="curl")
> data <- read.table(file="SJM_final_assignment_tidy_data.txt", header=TRUE)
> View(data)


## Original assignment instructions

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.