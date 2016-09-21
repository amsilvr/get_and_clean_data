##################
## Dependencies ##
##################

require(dplyr)
require(tidyr)

if (!file.exists("data")) {
        dir.create("data")
}

#################
## Download  ####
#################

# fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# temp <- "data/temp.zip"

# download.file(url = fileUrl, destfile = temp)
# date_Downloaded <- date()

df_Names <- unzip(temp, exdir = "data", list = TRUE )

which <- c("body", "body", "total")
sensor <- c("acc", "gyro")
measure <- c("body_acc_", "body_gyro_", "total_acc_")
axes <- c("x", "y", "z") 
sets <- c("test", "train")


# 1) Download the data and place into files


# 2) Merge the training and the test sets.
 
# 3) Extracts only the measurements on the mean and standard deviation for each
# measurement.
# 
# 4) Use descriptive activity names to name the activities in the data set
# 
# 5) Appropriately labels the data set with descriptive variable names.
# 
# 6) From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
