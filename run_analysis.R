#run_analysis.R

#Set directory and import feature labels

setwd("C:/Users/cmilbank/Documents/UCI HAR Dataset/")
features <- read.table("features.txt")

#Set directory and import training data

setwd("C:/Users/cmilbank/Documents/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")
X_train <- read.table("X_train.txt")
Y_train <- read.table("Y_train.txt")

#Set directory and import testing data

setwd("C:/Users/cmilbank/Documents/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")
X_test <- read.table("X_test.txt")
Y_test <- read.table("Y_test.txt")

#Update activity names to be more descriptive
activitymapping <- c("1" = "walking", "2" = "walking upstairs", "3" = "walking downstairs", "4" = "sitting", "5" = "standing", "6" = "laying")
Y_train$V1 <- activitymapping[as.character(Y_train$V1)]
Y_test$V1 <- activitymapping[as.character(Y_test$V1)]

#Add column names to data frames
colnames(X_train) <- features$V2
colnames(X_test) <- features$V2
colnames(Y_train) <- "activity"
colnames(Y_test) <- "activity"
colnames(subject_train) <- "subject_no"
colnames(subject_test) <- "subject_no"

#Identify and keep features relating only to mean or standard deviation
features$keep <- grepl(paste(c("mean()", "std()"), collapse = "|"), features$V2)
X_train <- X_train[,which(features$keep == TRUE)]
X_test <- X_test[,which(features$keep == TRUE)]

#Combine X, Y, and subject data frames into one training set and one test set

train <- cbind(subject_train, Y_train, X_train)
test <- cbind(subject_test, Y_test, X_test)

#Append training and test sets into one data frame

alldata <- rbind(train, test)

#Create tidy data set that contains mean value for all combinations of subject/activity

tidy <- aggregate(. ~ subject_no + activity, mean, data = alldata)

#Create descriptive names on columns 3-81 of tidy data (i.e. "mean(...)")

tidytemp <- tidy[,3:81]
colnames(tidytemp) <- paste("mean(", colnames(tidytemp), ")", sep = "")
tidy <- cbind(tidy[,1:2], tidytemp)
remove(tidytemp)