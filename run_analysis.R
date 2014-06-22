##run_analysis.R


##This script produces a tidy dataset based on the test and training datasets from the
        #wearable computing dataset.

##This dataset accomplishes 5 things:
        #1. merges the test and training data into one data set
        #2. extracts the measurements on the mean and standard deviation for each 
                #measurement
        #3. Uses descriptive activity names to name the activities in the data set
        #4. labels the data with descriptive variable names
        #5. creates a second, independent tidy data set with the average of each variable
                #for each activity and each subject

##This script makes use of the sqldf package. Please install using
        # install.packages("sqldf")


##Require sqldf library
library(sqldf)


#pull in data sets and labels
x_test <- read.table("X_test.txt")
y_test <- read.table("Y_test.txt")
x_train <- read.table("X_train.txt")
y_train <- read.table("Y_train.txt")

#Add column names
x_col <- read.table("features.txt")
colnames(x_test) <- x_col[,2]
colnames(x_train) <- x_col[,2]
colnames(y_test) <- "act_num"
colnames(y_train) <- "act_num"

#pull in label activities
act_num <- 1:6
act_class <- c("Walking", "Walking_upstairs", "Walking_downstairs", "Sitting", "Standing", "Laying")
act_frame <- as.data.frame(cbind(act_num, act_class))

#Add activity labels to y_test and y_train
y_test <- sqldf("select * from y_test join act_frame on y_test.act_num = act_frame.act_num")
y_train <- sqldf("select* from y_train join act_frame on y_train.act_num = act_frame.act_num")

#Subset and Add column names
y_test1 <- y_test[,2:3]
y_train1 <- y_train[,2:3]
col_names <- c("act_num", "act_class")
colnames(y_test1) <- col_names
colnames(y_train1) <- col_names

#Combine x_test and y_test data sets
test_data <- as.data.frame(cbind(y_test1, x_test))

#Combine x_train and y_train data sets
train_data <- as.data.frame(cbind(y_train1, x_train))

#Combine x_train and x_test data sets
comb_data <- as.data.frame(rbind(test_data, train_data))

#Extract mean and std columns from comb_data
col_filter <- c(grep("mean", colnames(comb_data)), grep("mean", colnames(comb_data)))
MeanStd_data <- comb_data[, col_filter]
 
#Split comb_data by activity
s <- split(comb_data, comb_data$act_num)

#Compute column means by activity type
mean_table <- sapply(s, function(comb_data) colMeans(comb_data[,3:563]), simplify = TRUE)

#Transpose mean_table so activity numbers are rows
mean_table2 <- t(mean_table)

#Write tidy data set to file in working directory
write.table(mean_table2, file = "tidy_data.txt", sep = ",", row.names = TRUE, col.names = TRUE)

        
        
        
