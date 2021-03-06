#Getting and Cleaning Data
## Week 4 Assignment

### Final Assignment on Wearable Data for JHU Coursera Course

[run_analysis.R](run_analysis.R) does the following:

1. Merges the training and the test sets to create one data set. This is the biggest task and takes several steps, as follows:

  * Load the filenames and paths into a list:
```r
    df_Names <- unzip(temp, list = FALSE, exdir = "data")`
```
  * Load the activity and variable (column) names into their own variables. While we're at it, let's tidy up the column names by making them lowercase and removing non-letter characters:
```r
    activity_labels <- read.table(df_Names[1], header = FALSE, col.names = c("activityID", "label"))
    colNames <- select(read.table(df_Names[2]), names = 2) %>% 
      mutate(names = tolower(names))  %>%
      mutate(names = trimws(gsub("[^a-z]","",names)))
```
  * Next, we get test subjects, data, and activities from separate .txt files and place them into data frames. Note that we pick up the table from the list of filenames we generated while unzipping the downloaded data. Because we will want to group by subject and activity type further down, we have to make sure that subjects and activities are loaded as factors. We use the cleaned up column names when we read in the data.
```r
    testSubj <- read.table(df_Names[14], header = FALSE, colClasses = "factor") 
    test <- read.table(df_Names[15], header = FALSE, col.names = colNames$names) 
    testAct <- read.table(df_Names[16], header = FALSE, colClasses = "factor") 
```

  * We load a similar set of variables for training subjects, data, and activities. 
```r
    trainSubj <- read.table(df_Names[26], header = FALSE, colClasses = "factor") 
    train <- read.table(df_Names[27], header = FALSE, col.names = colNames$names) 
    trainAct <- read.table(df_Names[28], header = FALSE, colClasses = "factor") 
```
  * To make sure we know if a given row is from training or test, we add a column for the data set. (ultimately uneeded) We pull in the subject as a factor and activityID from the variables created above. the `subj` field in both data frames is coerced to 30 levels so that they will merge properly.
```r
    train <- mutate(train, subj = factor(trainSubj$V1, levels = c(1:30)), 
      dataSet = "train", activityID = trainAct[,1])
    test <- mutate(test, subj = factor(testSubj$V1, levels = c(1:30)), 
      dataSet = "test", activityID = testAct[,1])
``` 
  * Finally we can combine the training and test data frames into one, satisfying the first requirement.
```r
    df <- bind_rows(train, test)
```
2. We Extract the measurements on the mean and standard deviation for each measurement with dplyr:select.
```r
    df.f <- select(df, subj, activityID, contains("mean"), contains("std"))`
```
3. We merge the activity_labels table to get our descriptive activity names.
```r
    df.f <- merge(df.f, activity_labels, by = "activityID") %>%
           select(subj, activity = label, 3:89)
```
4. Appropriately labels the data set with descriptive variable names - was done back when we cleaned up our `colNames` data frame.

5. Finally, we use the following code to create a second, independent tidy data set with the average of each variable for each activity and each subject.
```r
  by.subj <- arrange(df.f, subj, activity) %>%
         group_by(subj, activity) %>%
         summarize_all(mean)
```