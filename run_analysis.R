

# Inital file location:
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# There are two data groups: "Test" with 2947 rows, and "Train" with 7352 rows
# Each group contains : 
# (a) The subject list (1-30), 
# (b) the activity list (1-6), file name starts with "y_" 
#     where 1= WALKING 2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING,5=STANDING, 6=LAYING
# (c) The feature results, with 561 features listed on each row of file name starting with "X_"  
#*********************************
#*********************************
#Merging Test and Train Files steps
# (1) Rename the activity list, so instead of numbers the name of the activity is spelled out
# (2) Rename the Feature list, only those with mean and std
# (3) Merge with cbind() the subject, activity, and feature list for Train and Test independently
#(4) Merge with rbind() the two sets of data Train and Test
#(5) Select those features only that include the words "mean" and "stdev"
#****
#Libraries
library(dplyr)
library(stringr)
library(base64)
#Setting working directory path
setwd("https://github.com/Grajales/GettingCleaningData.git")
#*****************************
# Reading all the tables
#****************************
activity_list_train = read.table("y_train.txt")
activity_list_test = read.table("y_test.txt")
subject_train = read.table("subject_train.txt")
subject_test = read.table("subject_test.txt")
activity_list_train = read.table("y_train.txt")
activity_list_test = read.table("y_test.txt")
feature_value_train = read.table("X_train.txt")
feature_value_test = read.table("X_test.txt")
features =read.table("features.txt")
features_length <- nrow(features)
features1 <-as.character(c(1:features_length))
#features1 <-features
# Merging tables rows
activity_list <-rbind(activity_list_train, activity_list_test)
subject_list <-rbind(subject_train, subject_test)
feature_value <-rbind(feature_value_train,feature_value_test)
#Renaming activity list numbers changed to names
nrow_length <-nrow(activity_list)
activity <-as.character(c(1:nrow_length))
for (i in 1:nrow_length) {
  if (activity_list[i,1]== 1) activity[i] <-"Walking"
  else if (activity_list[i,1]== 2) activity[i] <-"Walking_Upstairs"
  else if (activity_list[i,1]== 3) activity[i] <-"Walking_Downstairs"
  else if (activity_list[i,1]== 4) activity[i] <-"Sitting"
  else if (activity_list[i,1]== 5) activity[i] <-"Standing"
  else if (activity_list[i,1]== 6) activity[i] <-"Laying"
}
#Renaming V1 for subject  variable
colnames(subject_list)[colnames(subject_list)=="V1"] <- "subject"
#***************************
#Merging all tables
tidy_data <-cbind(subject_list, activity, feature_value)
#Calculating independent tidy data set with the average of each variable for each activity and each subject
tidy_data_mean <- aggregate(tidy_data[,3:563],list(tidy_data$subject, tidy_data$activity), mean )
#***************************
#Substitutin text on some feature names
features_length <- nrow(features)
for (i in 1:features_length )
{features1[i] <- gsub("tBody", "timeBody", as.character(features[i,2])) #Changing "t" for "time"
features1[i] <- gsub("fBody", "frequencyBody", as.character(features1[i]))#Changing "" for "frequency"
features1[i] <- gsub("tGravity", "timeGravity", as.character(features1[i]))#Changing "t" for "time"
features1[i] <- gsub("BodyBody", "Body", as.character(features1[i]))#Changing "BodyBody" for "Body"
features1[i] <- gsub("Acc", "Acceleration", as.character(features1[i]))}#Changing "Acc" for "Acceleration"

#changing name of V1-V561 variables for the Variables names that contain "mean" and "std" 
#the remaining columns will be labeled "delete"
features_lengthx <- features_length +2
for (i in 3:features_lengthx )
{if (str_detect(as.character(features1[i-2]),"mean")){
  names(tidy_data_mean)[i]<- as.character(features1[i-2])}
 else if (str_detect(as.character(features1[i-2]),"std")){
   names(tidy_data_mean)[i]<- as.character(features1[i-2])}
 else names(tidy_data_mean)[i]<- as.character(paste("delete",i))
}
# Selecting only mean and std variables and deleting all others previous labeled with "delete"
tidy_data_mean_short1<-select(tidy_data_mean, -starts_with("delete"))
#Renaming frist two columns
names(tidy_data_mean_short1)[1]<-"subject"
names(tidy_data_mean_short1)[2]<-"activity"  
#Uploading the tidy data mean into a .txt file with the name "tidy_data_mean.txt" 
write.table(tidy_data_mean_short1,file="tidy_data_mean.txt",row.name=FALSE)
