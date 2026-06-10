library(dplyr)

# Download & unzip data if not present
if(!file.exists("./UCI HAR Dataset")) {
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                destfile = "dataset.zip", method = "curl")
  unzip("dataset.zip")
}

# Read supporting files
features <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)

# Read & merge train + test data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

subject <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# Extract only mean & std measurements
mean_std_idx <- grep("mean\\(\\)|std\\(\\)", features[,2])
x_data <- x_data[, mean_std_idx]
names(x_data) <- features[mean_std_idx, 2]

# Add descriptive activity names & subject ID
y_data[,1] <- factor(y_data[,1], levels = activity_labels[,1], labels = activity_labels[,2])
names(y_data) <- "activity"
names(subject) <- "subject"
data <- cbind(subject, y_data, x_data)

# Clean variable names
names(data) <- gsub("^t", "Time", names(data))
names(data) <- gsub("^f", "Frequency", names(data))
names(data) <- gsub("Acc", "Acceleration", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("\\(\\)", "", names(data))
names(data) <- gsub("-", "_", names(data))

# Create tidy dataset with averages
tidy_data <- data %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = 'drop')

# Write output
write.table(tidy_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)
