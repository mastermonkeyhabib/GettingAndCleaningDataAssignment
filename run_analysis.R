
rm(list=ls(all=TRUE))


library(reshape2)
library(dplyr)

#prepare the workspace

#set variables
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dataDir <- "./data"
zipFile <- "wearable.zip"
zipFileInDir <- paste(dataDir, "/" , zipFile, sep = "")


#create data dir
if(!file.exists(dataDir)){dir.create(dataDir)}
#download the file
if(!file.exists(zipFileInDir)){download.file(fileUrl, destfile = zipFileInDir)}
#unzip the file
unzip(zipFileInDir, exdir = dataDir, overwrite = TRUE) 


#get the feature names
featuresFilename <- paste(dataDir, "/UCI HAR Dataset/features.txt", sep = "")
features <- read.table(featuresFilename, header = FALSE)
cn <- as.array(features$V2) #column names

#get the activities
activityFilename <- paste(dataDir, "/UCI HAR Dataset/activity_labels.txt", sep = "")
activity <- read.table(activityFilename, header = FALSE, col.names = c("activity_id", "activity_name"))


#read data sets
xtrainFilename <- paste(dataDir, "/UCI HAR Dataset/train/X_train.txt", sep = "")
xtrain <- read.table(xtrainFilename, header = FALSE, col.names = cn)
xtrain <- mutate(xtrain, row_number = row_number()) # add row numbers

ytrainFilename <- paste(dataDir, "/UCI HAR Dataset/train/Y_train.txt", sep = "")
ytrain <- read.table(ytrainFilename, header = FALSE, col.names = c("activity_id"))
ytrain <- mutate(ytrain, row_number = row_number()) # add row numbers

subjectTrainFilename <- paste(dataDir, "/UCI HAR Dataset/train/subject_train.txt", sep = "")
subjectTrain <- read.table(subjectTrainFilename, header = FALSE, col.names = c("subject_id"))
subjectTrain <- mutate(subjectTrain, row_number = row_number()) # add row numbers

#join together
train <- inner_join(activity, ytrain, by = c("activity_id" = "activity_id"))
train <- inner_join(subjectTrain, train, by = c("row_number" = "row_number"))
train <- inner_join(xtrain, train, by = c("row_number" = "row_number"))


xtestFilename <- paste(dataDir, "/UCI HAR Dataset/test/X_test.txt", sep = "")
xtest <- read.table(xtestFilename, header = FALSE, col.names = cn)
xtest <- mutate(xtest, row_number = row_number()) # add row numbers

ytestFilename <- paste(dataDir, "/UCI HAR Dataset/test/Y_test.txt", sep = "")
ytest <- read.table(ytestFilename, header = FALSE, col.names = c("activity_id"))
ytest <- mutate(ytest, row_number = row_number()) # add row numbers

subjectTestFilename <- paste(dataDir, "/UCI HAR Dataset/test/subject_test.txt", sep = "")
subjectTest <- read.table(subjectTestFilename, header = FALSE, col.names = c("subject_id"))
subjectTest <- mutate(subjectTest, row_number = row_number()) # add row numbers

#join together
test <- inner_join(activity, ytest, by = c("activity_id" = "activity_id"))
test <- inner_join(subjectTest, test, by = c("row_number" = "row_number"))
test <- inner_join(xtest, test, by = c("row_number" = "row_number"))

# union it all together, only the columns we want
full_data <- union_all(test, train) 
full_data <- select(full_data, "activity_name", "subject_id", contains("mean."), contains("std.") )

#melt the data to tidy up
melted_data <- melt(full_data, id=c("activity_name", "subject_id"))

#set the headers
colnames(melted_data) <- c("activity_name", "subject_id", "feature", "signal_value")

#independent tidy data set with the average of each variable for each activity and each subject.
mean_melted_data <- melted_data %>% group_by(activity_name,subject_id,feature) %>% summarise(mean_signal_value = mean(signal_value))
colnames(mean_melted_data) <- c("activity_name", "subject_id", "feature", "mean_signal_value")

#save raw data outputted
tidyDataFilename <- paste(dataDir, "/tidyData.csv", sep = "")
if(file.exists(tidyDataFilename)){file.remove(tidyDataFilename)}
write.csv(melted_data, file = tidyDataFilename)

#save grouped data output
tidyDataMeanFilename <- paste(dataDir, "/tidyDataMean.csv", sep = "")
if(file.exists(tidyDataMeanFilename)){file.remove(tidyDataMeanFilename)}
write.csv(mean_melted_data, file = tidyDataMeanFilename)


#clean working data sets to free memory
rm(test)
rm(xtest)
rm(ytest)
rm(train)
rm(xtrain)
rm(ytrain)
rm(activity)
rm(features)
rm(full_data)
rm(subjectTest)
rm(subjectTrain)



