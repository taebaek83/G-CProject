run_analysis.MD

#Overview

This R script imports two data sets of accelerometer data and accomplishes 5 objectives:
1. Merges the test and train data sets into one data set
2. extracts the measurements for mean and standard deviation for each measurement
3. uses descriptive activity names to name the activities in the data set
4. labels the data with descriptive variable names
5. creates a second, tidy data set with the average of each variable for each activity and each subject

This script makes use of the sqldf package. Please install using install.packages("sqldf")

This script writes a text file called tidy_data.txt to your working directory



#Variables
Variables are divided into three categories:
1. Variables used to import data into R
2. Variables used to assign labels such as column names and activity types
3. Variables used to transform data

##Variables used to import data into R
*x_test: imports the x_test.txt file into R, represents the control group of observations
*y_test: imports the y_test.txt file into R, this variable will be used later for activity numbers
*x_train: imports the x_train.txt file into R, represents the experiment observations
*y_train: imports the y_train.txt file into R, this variable will be used later for activity numbers



##Variables used to assign labels
*x_col: imports the features.txt file which is used to assign column lables to x_test and x_train
*act_class: adds text names to activity numbers imported from y_test and y_train these will become row names

##Variables used to transform data
*y_test1: eliminates the duplicate column name in y_test 
*y_train1: eliminates the duplicate column name in y_train 
*test_data: combines the x_test and y_test1 data frames to marry up the activity labels with the observations
*train_data: combines the x_train and y_train1 data frames to marry up the activity labels with the observations
*comb_data: merges the test_data and train_data into one data set
*MeanSTD_data: extracts the mean and standard deviation variables
*mean_table: computes the column means for each variable and puts them in a table with row names equal to variables and column names equal to activity numbers
*mean_table2: transposes mean_table to put row names equal to activity numbers and column names equal to variables
