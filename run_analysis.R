## first I set the directory
setwd("~/Desktop/test/UCI HAR Dataset")

## read the test data 

test_feat <- read.csv("test/X_test.txt", sep = "", header = FALSE)
test_actv   <-  read.csv("test/y_test.txt", header = FALSE)
test_ident <- read.csv("test/subject_test.txt", header = FALSE)

## cobine  all variable for test toghether
test_data<- cbind(test_actv,test_ident,test_feat)

## read the train data 

train_feat <- read.csv("train/X_train.txt", sep = "", header = FALSE)
train_actv  <-  read.csv("train/y_train.txt", header = FALSE)
train_ident <- read.csv("train/subject_train.txt", header = FALSE)

## cobine  all variable for test toghether
train_data<- cbind(train_actv,train_ident,train_feat)


## 1. merge train data with text data to have full data set

fulldata <-rbind(train_data,test_data)
## 2. Extracts only the measurements on the mean and standard deviation for each measurement

## to subset full data  set I need  to name the variables

# a. read  the  feature variables
features <- read.table("features.txt", header = FALSE)
functions<-make.unique(as.character(features[,2]))
#  b. name  a unique name for  variables
colnames(fulldata)<- c("LableActivities","identifier")
colnames(fulldata)[3:563]<-functions

#c. subset the data set that has mean and std

library(dplyr)
teadydata <- select(fulldata,LableActivities,identifier,contains("mean"),contains("std"))

## 3.Uses descriptive activity names to name the activities in the data set

##  a. read the activity variable

activities <- read.table("activity_labels.txt", header = FALSE)

##  b. substitue the name in the  file 

teadydata$LableActivities<-activities[teadydata$LableActivities,2]

## 4. Appropriately labels the data set with descriptive variable names.
names(teadydata)<- gsub("^t","Time",names(teadydata))
names(teadydata)<- gsub("Acc","Accelerometer",names(teadydata))
names(teadydata)<- gsub("Gyro","Gyroscope",names(teadydata))
names(teadydata)<- gsub("Jerk","JerkSignals",names(teadydata))
names(teadydata)<- gsub("Mag","Magnitude",names(teadydata))
names(teadydata)<- gsub("^f","frequency",names(teadydata))
names(teadydata)<- gsub("mean()","MeanValue",names(teadydata))
names(teadydata)<- gsub("Std()","StandarDeviation",names(teadydata))
names(fulldata)<- gsub("meanFreq()","Weightedaverageoffrequency",names(fulldata))

##  5.  creates a 2  tidy data set with the average of variable for each activity and each subject.

teadydata2<-teadydata

grouped_data<-teadydata2 %>% group_by(LableActivities, identifier) %>%  summarise_all(funs(mean))

## write a table 
write.csv(grouped_data, "FinalData.csv", row.names = FALSE)
