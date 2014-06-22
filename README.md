G-CProject
==========
#Scripts
The R script needed to transform the data into a tidy data set is 'run_analysis.R'. This is the only script needed to perform the data cleanup.

This script accomplishes 5 things:
1. merges the test and training data into one data set
2. extracts the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. labels the data with descriptive variable names
5. creates a second, independent tidy data set with the average of each variable for each activity and each subject

This script makes use of the sqldf package. Please install using install.packages("sqldf")

