#
# This function performs the cleaning and updating of 
# "Human Activity Recognition Using Smartphones Dataset" from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# This script file should be executed in the parent directory of 
# "UCI HAR Dataset" folder in your working directory
# As result of this function a tidy data set (data table) is returned with the
# average of each variable for each subject and activity. 
#
# In 'filteredDF' variable you can find the complete merged dataframe created from
# train and test temporal data frames, with every measurement record for each
# subject and activity performed with the smartphone. Only columns related to average
# and standard deviation are kept as required in the instructions of the course project. These
# columns are renamed to make them more readable and to make possible data table oriented operations 
# later to build up the tidy data set.
#
# You can find a list of the variables used in filteredDF (and in the returned data table), their 
# descriptions, units, ... in CodeBook.md.
# 
# Also, you can find a text file with a dump of the result data table from this script in the file 
#'analysis_summary.txt'
#
smart_analysis<- function()
{
	##Loading script dependencies
	library(data.table)
	library(dplyr)

	#Reading test and train files from UCI HAR Dataset source
	xtestDF<-read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE)
	ytestDF<-read.table("./UCI HAR Dataset/test/Y_test.txt",stringsAsFactors=FALSE)
	
	xtrainDF<-read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE)
	ytrainDF<-read.table("./UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=FALSE)
	
	#Reading test and train subjects IDs
	testSubjectsDF<-read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE)
	trainSubjectsDF<-read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE)
	
	#Reading 'features' labels used as column names in original data set
	features<-read.table("./UCI HAR Dataset/features.txt")
	
	#Reading activities labels to perform code to label translations in 
	#activity column
	activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
	
	#Converting activity labels from string to factors
	fact<-as.factor(activity_labels$V2)

	#Traslating test activities vector from code to activity string label
	ytestDT<-as.data.table(ytestDF)
	ytestDT[,activity:=fact[V1]]
	
	#Traslating train activities vector from code to activity string label
	ytrainDT<-as.data.table(ytrainDF)
	ytrainDT[,activity:=fact[V1]]

	#Setting column names in features DF
	names(features)<-c("featureIndex","featureLabel")

	#Creating a new 'features' vector from scratch because some labels are repeated in the original 'features' file!
	#A prefix with the position of the column in the source record is appended to
	# the name of each column name to ensure there's not possible duplicated
	features_cleared<-mutate(features,featureKey=paste(features$featureIndex,"_",features$featureLabel,sep=""))

	#Setting labels to test and train data frames from features data frame
	names(xtestDF)<-features_cleared$featureKey
	names(xtrainDF)<-features_cleared$featureKey

	#Appending 'subjects' column to test dataframe
	xtestDF<-setDT(xtestDF)
	xtestDF[,subject:=testSubjectsDF$V1]

	#Appending 'activities' column to test dataframe
	xtestDF[,activity:=ytestDT$activity]

	#Appending 'subjects' column to train dataframe
	xtrainDF<-setDT(xtrainDF)
	xtrainDF[,subject:=trainSubjectsDF$V1]

	#Appending 'activities' column to test dataframe
	xtrainDF[,activity:=ytrainDT$activity]

	#Merging train and test data frame
	completeDF<-rbind(xtrainDF,xtestDF)

	##Subsetting mean,standard deviation,subject and activity columns
	##from merged data frame
	mynames<-names(completeDF)
	mycols<-mynames[grep("std\\(|mean\\(|subject|activity",mynames)]
	filteredDF<-completeDF[,mycols,with=FALSE]

	##Renaming original column labels removing "-","_","(", and ")" 
	##characters from them
	filteredDF<-as.data.frame(filteredDF)
	names(filteredDF)<-gsub("^.*?_","",names(filteredDF))
	names(filteredDF)<-gsub("-","",names(filteredDF))
	names(filteredDF)<-gsub("\\)","",names(filteredDF))
	names(filteredDF)<-gsub("\\(","",names(filteredDF))
	
	##Computing independent tidy data set
	filteredDT<-as.data.table(filteredDF)
	groupsDT <- filteredDT[, lapply(.SD,mean),by=list(subject,activity)]
	
	##Sorting the data table in ascending order of subject identifier
	arrange(groupsDT,subject)

}
