##################
## Dependencies ##
##################
 install.packages("tidyverse")    
 # replace the xxx and remove the comment in the below line to set the working directory to your wd
 
 #setwd(xxx)
 
 require(tidyverse)

 if (!file.exists("data")) {
         dir.create("data")
}

#################
## Download  ####
#################

   fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
   temp <- "data/temp.zip"

if(!file.exists(temp)) {
  download.file(url = fileUrl, destfile = temp)
  date_Downloaded <- date()
  }

## 1) Place each file into a dataframe; add columns for activity labels and directory structure

  #get filenames and paths
  df_Names <- unzip(temp, list = FALSE, exdir = "data")

  #get activity and variable names
  activity_labels <- read.table(df_Names[1], header = FALSE, col.names = c("activityID", "label"))
  
  colNames <- select(read.table(df_Names[2]), names = 2) %>%
          mutate(names = tolower(names))  %>%
          mutate(names = trimws(gsub("[^a-z]","",names)))
  
  #get test subjects, data, and activities
  testSubj <- read.table(df_Names[14], header = FALSE, colClasses = "factor")
  test <- read.table(df_Names[15], header = FALSE, col.names = colNames$names)
  testAct <- read.table(df_Names[16], header = FALSE, colClasses = "factor")

  #get training subjects, data, and activities
  trainSubj <- read.table(df_Names[26], header = FALSE, colClasses = "factor")
  train <- read.table(df_Names[27], header = FALSE, col.names = colNames$names)
  trainAct <- read.table(df_Names[28], header = FALSE, colClasses = "factor")
  
  #add columns for subjects and activityID tables
  train <- mutate(train, subj = factor(trainSubj$V1, levels = c(1:30)), dataSet = "train", activityID = trainAct[,1])
  test <- mutate(test, subj = factor(testSubj$V1, levels = c(1:30)), dataSet = "test", activityID = testAct[,1])
  
# 2) Merge the training and the test sets.
  df <- bind_rows(train, test)

# 3) Extracts only the measurements on the mean and standard deviation for each
# measurement.

 df.f <- select(df, subj, activityID, contains("mean"), contains("std"))
 rm(list = ls(pattern = "test|train"))
 
# 4) Use descriptive activity names to name the activities in the data set
 
 df.f <- merge(df.f, activity_labels, by = "activityID") %>%
         select(subj, activity = label, 3:89)
 
# 5) Appropriately label the data set with descriptive variable names.
## done in step #3)
 
# 6) From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.
         by.subj <- arrange(df.f, subj, activity) %>%
                 group_by(subj, activity) %>%
                 summarize_all(mean)
 
         write.table(by.subj, file = "data/by_subj.txt", row.name = FALSE)
        
         # by.act <- arrange(df.f, activity, subj) %>%
         #         group_by(activity) %>%
         #         summarize_all(mean)

