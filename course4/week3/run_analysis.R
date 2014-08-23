#Read the Mapping of the Activity Number and Activity Label
activities <- read.table("./data/activity_labels.txt",col.names=c("ACTIVITY_NUMBER","ACTIVITY_NAME"),stringsAsFactors = FALSE)

#Reading the features
features <- read.table("./data/features.txt",col.names=c("NUM","FEATURE_NAME"),stringsAsFactors = FALSE)

#Remove all the special characters from feature names to make decriptive names required for Step 4
features[,2] <- gsub("[[:punct:]]","",features[,2])

#Reading the data for Test----------------------------- 
subject_test <- read.table("./data/test/subject_test.txt",col.names=c("SUBJECT_NUMBER"),stringsAsFactors = FALSE)

activity_test <- read.table("./data/test/y_test.txt",col.names=c("ACTIVITY_NUMBER"),stringsAsFactors = FALSE)

test_data <- read.table("./data/test/X_test.txt",col.names=features$FEATURE_NAME,stringsAsFactors = FALSE)

#End of Reading data for Test--------------------------

#Reading the data for Train----------------------------
subject_train <- read.table("./data/train/subject_train.txt",col.names=c("SUBJECT_NUMBER"),stringsAsFactors = FALSE)

activity_train <- read.table("./data/train/y_train.txt",col.names=c("ACTIVITY_NUMBER"),stringsAsFactors = FALSE)

train_data <- read.table("./data/train/X_train.txt",col.names=features$FEATURE_NAME,stringsAsFactors = FALSE)

#End of Reading data for Train-------------------------

#Bind the column for test data-------------------------
  
 test_data$activity <- cbind(activity_test$ACTIVITY_NUMBER)
   
 test_data$subject  <- cbind(subject_test$SUBJECT_NUMBER)
  
#End 
 
#Bind the column for train data----------------------

train_data$activity <- cbind(activity_train$ACTIVITY_NUMBER)
train_data$subject <-  cbind(subject_train$SUBJECT_NUMBER)
#End
 
#Merge the train data and test data
mergedata <- rbind(test_data,train_data) 

#Select the mean and standard deviations for the merged rows 
 meanStd <- mergedata[,c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,266:271,345:350,424:429,503:504,516:517,529:530,542:543,562,563)]

#aggregate based on the activity and subject calculate mean of these variables
agrData <- aggregate(meanStd,by=list(meanStd$activity,meanStd$subject),FUN=mean,na.rm = TRUE)

#Bind the activities name to activity
agrData$activity <- as.character(activities[agrData$activity,2])

#Remove the first two columns from final agrData since we don't need group information
agrData <- agrData[,3:ncol(agrData)]

#Write the tidy data to the file 
write.table(agrData,file="tidyData.txt",row.names=FALSE)