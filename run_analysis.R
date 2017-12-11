# Getting and Cleaning Data Course Project Script by S Guauque

# This script does the following: 
# a) Merges the training and the test sets to create one data set.
# b) Extracts only the measurements on the mean and standard deviation for each measurement.
# c) Uses descriptive activity names to name the activities in the data set
# d) Appropriately labels the data set with descriptive variable names.
# e) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

dir = getwd()
setwd(dir)

if(!file.exists("project")){dir.create("project")} ##if directory "data" does not exist, create it

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ## set the URL from which to download the data

download.file(fileUrl, destfile = "./project/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip") #Download the data for the project:
# trying URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
# Content type 'application/zip' length 62556944 bytes (59.7 MB)
# downloaded 59.7 MB

unzip("./project/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", files = NULL, list = TRUE, exdir = "./project") #unzip the file

trainset <- read.table(paste(dir, "/project/UCI HAR Dataset/train/X_train.txt", sep = "")) # read measurements of training set
head(trainset)
subjtrainset <- read.table(paste(dir, "/project/UCI HAR Dataset/train/subject_train.txt", sep = ""))
colnames(subjtrainset)[1] <- "ID" # rename column of ID
mergetrainset <- cbind(trainset, subjtrainset) # bind information of subject ID and measurement for the training set
head(mergetrainset)

testset <- read.table(paste(dir, "/project/UCI HAR Dataset/test/X_test.txt", sep = "")) # read measurements of test set
head(testset)
subjtestset <- read.table(paste(dir, "/project/UCI HAR Dataset/test/subject_test.txt", sep = ""))
colnames(subjtestset)[1] <- "ID" # rename column of ID
mergetestset <- cbind(testset, subjtestset) # bind information of subject ID and measurement for the test set
head(mergetestset)

mergeFiles <- rbind(mergetrainset, mergetestset) # Merges the training and the test sets to create one data set.
head(mergeFiles)
nrow(mergeFiles)
# [1] 10299
ncol(mergeFiles)
# [1] 562

fileNames = read.table(paste(dir, "/project/UCI HAR Dataset/features.txt", sep = ""), header = FALSE)
head(fileNames)
fileNamesUse <- fileNames[,2]
names(mergeFiles) <- fileNamesUse # # Appropriately labels the data set with descriptive variable names. add names to variables using the file "feature.txt"
colnames(mergeFiles)[562] <- "ID"


list <- grep(c("mean|std"), names(mergeFiles), value = TRUE) # Extracts only the measurements on the mean and standard deviation for each measurement.
newdata <- mergeFiles[list]
head(newdata)
nrow(newdata)
# [1] 10299
ncol(newdata)
# [1] 79

# Uses descriptive activity names to name the activities in the data set
ytrainset <- read.table(paste(dir, "/project/UCI HAR Dataset/train/y_train.txt", sep = "")) #read Test labels for training set
head(ytrainset)
nrow(ytrainset)
# [1] 7352
ytestset <- read.table(paste(dir, "/project/UCI HAR Dataset/test/y_test.txt", sep = "")) #read Test labels for test set
nrow(ytestset)
# [1] 2947
mergey <- rbind(ytrainset, ytestset) # merge test labels for training and test sets
head(mergey)
nrow(mergey)
# [1] 10299

activitylabels <- read.table(paste(dir, "/project/UCI HAR Dataset/activity_labels.txt", sep = "")) # replace number by activity name
head(activitylabels)
mergey$activityname <- activitylabels$V2[match(mergey$V1, activitylabels$V1)] # replace number of activity by its name

# bind activity name column to training + test merged dataset
finaldataset <- cbind(newdata, mergey$activityname)
head(finaldataset)
nrow(finaldataset)
# [1] 10299
ncol(finaldataset)
# [1] 80

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
finaldataset <- cbind(finaldataset, mergeFiles$ID) # bind subject ID
head(finaldataset)
nrow(finaldataset)
# [1] 10299
ncol(finaldataset)
# [1] 81

tidydataset <- aggregate(finaldataset[,-c(80,81)],
          by=list(finaldataset$"mergey$activityname",finaldataset$"mergeFiles$ID"),
          FUN=mean) # calculate average of each variable for each activity and each subject.

nrow(tidydataset)
# [1] 180
ncol(tidydataset)
# [1] 83
head(tidydataset)
colnames(tidydataset)[1] <- "activityName"
colnames(tidydataset)[2] <- "ID"

write.table(tidydataset, file = paste(dir, "/project/tidydataset.txt", sep = ""), sep = " ",  row.names = FALSE) # write final tidy data to text file



