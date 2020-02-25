setwd("C:/Users/Scot/OneDrive/Courses/Coursera_DataScience/Getting_and_Cleaning_Data/UCI HAR Dataset")

library(dplyr)

# retrieve labels for columns
features <- read.table(file="features.txt", header=FALSE, stringsAsFactors=FALSE)

# retrieve test and training set data
testset <- read.table(file="./test/X_test.txt", header=FALSE, colClasses = "numeric")
testactiv <- read.delim(file="./test/y_test.txt", header=FALSE)
testsubj <- read.delim(file="./test/subject_test.txt", header=FALSE)
colnames(testset) <- features[,2]
testset$activ <- testactiv[,1]
testset$subj <- testsubj[,1]

trainset <- read.table(file="./train/X_train.txt", header=FALSE, colClasses = "numeric")
trainactiv <- read.delim(file="./train/y_train.txt", header=FALSE)
trainsubj <- read.delim(file="./train/subject_train.txt", header=FALSE)
colnames(trainset) <- features[,2]
trainset$activ <- trainactiv[,1]
trainset$subj <- trainsubj[,1]

# merge the annotated test and training data sets
mergeset <- rbind(testset, trainset)

# add activity data labels to the large training+test dataset
activ_labels <- read.delim(file="activity_labels.txt", sep=" ", header=FALSE, stringsAsFactors = FALSE)
colnames(activ_labels) <- c("activ","activ_desc")
mergeset <- merge(mergeset, activ_labels)

# remove the column that previousy described activity by an integer only
mergeset$activ <- NULL

# convert to tibble, and fix duplicate column name issue
mergeset_tb <- as_tibble(mergeset, .name_repair = "universal")

# re-order large training+test dataset variables to bring subject and activity variables first, and delete activity number column
# the 'select' function used in this way will also attach 'subj' and 'activ_desc' to subsequent subsetting activities
mergeset_tb <- select(mergeset_tb, activ_desc, subj, everything())

# select only those variables that represent mean or std, according to the presence of mean() or std() in their column names. The subject and activ_desc columns will be retained for future grouping
means <- mergeset_tb[,grep("mean..",colnames(mergeset_tb),fixed=TRUE)]
stds <- mergeset_tb[,grep("std..",colnames(mergeset_tb),fixed=TRUE)]
means_stds <- cbind(means, stds)

# group the limited data set according to activity and subject, then calculate averages of variables in the limited data set according to activity and subhect
means_stds_avgs <- means_stds %>% group_by(activ_desc, subj) %>% summarize_all(mean)

# export column names to assist in preparing the assignment CodeBook
codebook_cols <- colnames(means_stds_avgs)

# write text data files for assignment
write.table(means_stds_avgs, file="final_assignment_tidy_data.txt", row.names=FALSE)
write.table(codebook_cols, file="final_assignment_table_column_names.txt")
