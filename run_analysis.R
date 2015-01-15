smart_analysis<- function()
{
	library(data.table)
	library(dplyr)

	#Reading files
	xtestDF<-read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE)
	ytestDF<-read.table("./UCI HAR Dataset/test/Y_test.txt",stringsAsFactors=FALSE)
	
	xtrainDF<-read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE)
	ytrainDF<-read.table("./UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=FALSE)
	
	testSubjectsDF<-read.table("./UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE)
	trainSubjectsDF<-read.table("./UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE)
	
	features<-read.table("./UCI HAR Dataset/features.txt")
	
	activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")
	
	fact<-as.factor(activity_labels$V2)

	ytestDT<-as.data.table(ytestDF)
	ytestDT[,activity:=fact[V1]]
	
	ytrainDT<-as.data.table(ytrainDF)
	ytrainDT[,activity:=fact[V1]]

	names(features)<-c("featureIndex","featureLabel")

	#Creating a feature key from scratch because some original labels are repeated
	features_cleared<-mutate(features,featureKey=paste(features$featureIndex,"_",features$featureLabel,sep=""))

	#Setting labels to test and train data frames from features data frame
	names(xtestDF)<-features_cleared$featureKey
	names(xtrainDF)<-features_cleared$featureKey

	#Appending subjects to test dataframe
	xtestDF<-setDT(xtestDF)
	xtestDF[,subject:=testSubjectsDF$V1]

	#Appending activities to test dataframe
	xtestDF[,activity:=ytestDT$activity]

	#Appending subjects to train dataframe
	xtrainDF<-setDT(xtrainDF)
	xtrainDF[,subject:=trainSubjectsDF$V1]

	#Appending activities to test dataframe
	xtrainDF[,activity:=ytrainDT$activity]

	#Appending train and test data frame
	completeDF<-rbind(xtrainDF,xtestDF)

	mynames<-names(completeDF)
	mycols<-mynames[grep("std\\(|mean\\(|subject|activity",mynames)]
	filteredDF<-completeDF[,mycols,with=FALSE]

	filteredDF<-as.data.frame(filteredDF)
	names(filteredDF)<-gsub("^.*?_","",names(filteredDF))
	names(filteredDF)<-gsub("-","",names(filteredDF))
	names(filteredDF)<-gsub("\\)","",names(filteredDF))
	names(filteredDF)<-gsub("\\(","",names(filteredDF))
	filteredDT<-as.data.table(filteredDF)
	groupsDT <- filteredDT[, lapply(.SD,mean),by=list(subject,activity)]
	arrange(groupsDT,subject)

}
