if(!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                destfile = "getdata_projectfiles_UCI HAR Dataset.zip", method = "curl")
}
if(!file.exists("UCI HAR Dataset")){
  unzip("getdata_projectfiles_UCI HAR Dataset.zip")
}

activities = read.table("UCI HAR Dataset/activity_labels.txt")
colnames(activities) = c("id", "activity_label")
features = read.table("UCI HAR Dataset/features.txt")
colToUse =  as.character(features$V2[grepl("mean", features$V2) | grepl("std", features$V2) ])


testDataX = read.table("UCI HAR Dataset/test/X_test.txt")
testDataY = read.table("UCI HAR Dataset/test/y_test.txt")
testDataSubject = read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(testDataX) = features$V2
colnames(testDataY) = "labels"
colnames(testDataSubject) = "subject"
testDataX = testDataX[ colToUse]
colnames(testDataX) = gsub("\\(\\)", "", colnames(testDataX))

trainDataX = read.table("UCI HAR Dataset/train/X_train.txt")
trainDataY = read.table("UCI HAR Dataset/train/y_train.txt")
trainDataSubject = read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(trainDataX) = features$V2
colnames(trainDataY) = "labels"
colnames(trainDataSubject) = "subject"
trainDataX = trainDataX[ colToUse]
colnames(trainDataX) = gsub("\\(\\)", "", colnames(trainDataX))

testDF = data.frame(testDataSubject, testDataY, testDataX)
trainDF = data.frame(trainDataSubject, trainDataY, trainDataX)

df = rbind(trainDF, testDF)
df$labels =  with(activities,  activity_label[match(df$labels, id)])


ag = aggregate(df[, -2:-1], list(df$subject, df$labels), mean)

write.table(ag, row.names = FALSE, file = "tidy_data.txt")
