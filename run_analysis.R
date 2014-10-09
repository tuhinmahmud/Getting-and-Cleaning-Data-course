library(dplyr)
features.df = read.csv("features.txt", sep="", header=FALSE)
features <- features.df[,"V2"]
#read  training data into data frames
cols<-grepl(".-mean.*|.*-std.*",features)

#get the subset of columns from X_training that are for std and mean
subTraining <- read.csv("train/subject_train.txt", sep="", header=FALSE)
YTraining <- read.csv("train/Y_train.txt", sep="", header=FALSE)
smallerTraining <- read.csv("train/X_train.txt", sep="", header=FALSE)[,cols]

#build the train data set with subject and activity added as columns
training<-cbind(subTraining,YTraining)
training<-cbind(training,smallerTraining)

#read test datas
#get the subset of columns from X_test that are for std and mean
subTesting <-read.csv("test/subject_test.txt", sep="", header=FALSE)
YTesting <- read.csv("test/Y_test.txt", sep="", header=FALSE)
smallerTesting <- read.csv("test/X_test.txt", sep="", header=FALSE)[cols]

#build the train data set with subject and activity added as columns
testing<-cbind(subTesting,YTesting)
testing<-cbind(testing,smallerTesting)

#combine training and test data sets
tidydata <- rbind(training, testing)


#clean feature names 
sf<-features[cols]
#clean up the feature names
sf <- gsub('\\.', '', sf)
sf <- gsub('-mean', '.Mean.', sf)
sf <- gsub('-std', '.Std.', sf)
sf <- gsub('[-()]', '', sf)
sf <- gsub("(.*)\\.$", "\\1", sf)

#use it to create the column names in the tidydata
colnames(tidydata)<-c("Subject","Activity",sf)
summary_data<-
   tidydata %>% 
     group_by(Subject,Activity) %>% 
     summarise_each(funs(mean))

#use activity_label to update the entries in summary_data for activity_id
activity.df = read.csv("activity_labels.txt", sep="", header=FALSE)
activities<-(V2 <- with(activity.df, V2[match(summary_data$Activity,V1)]))
summary_data$Activity <-activities
write.table(summary_data, "summary.txt", sep="\t")



