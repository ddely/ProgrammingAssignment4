

## The first part of the script merges the training and the test sets to create one data set.

subject <- function() {
      s_test <- read.table('subject_test.txt')
      s_train <- read.table('subject_train.txt')
      s_merged <- rbind(s_train, s_test)
            names(s_merged) <- "subject"
    s_merged
}

x_dataset <- function() {
      x_test <- read.table('x_test.txt')
      x_train <- read.table('x_train.txt')
      x_merged  <- rbind(x_train, x_test)
}

y_dataset <- function() {
      y_test <- read.table('y_test.txt')
      y_train <- read.table('y_train.txt')
      y_merged  <- rbind(y_train, y_test)
}

    subject <- subject()
    x_dataset <- x_dataset()
    y_dataset <- y_dataset()


## The second part of the script extracts only the measurements on the mean and standard deviation for each measurement. 

extract_mean_sd <- function() {
      features <- read.table('features.txt', header=FALSE, col.names=c('id', 'name'))
      selected_columns <- grep('mean\\(\\)|std\\(\\)', features$name)
      filter <- x_dataset[, selected_columns]
      names(filter) <- features[features$id %in% selected_columns, 2]
      filter
}

  x_filter <- extract_mean_sd()

## The third part of the script uses descriptive activity names to name the activities in the data set

activity <- read.table('activity_labels.txt', header=FALSE, col.names=c('id', 'name'))


## The fourth part of the script appropriately labels the data set with descriptive activity names. 

    y_dataset[, 1] = activity[y_dataset[, 1], 2]
    names(y_dataset) <- "activity"


## The fifth part of the script creates the final, independent tidy data set with the average of each variable for each activity and each subject.

    all_in <- cbind(subject, y_dataset, x_filter)
    measurements <- all_in[, 3:dim(all_in)[2]]
    tidy <- aggregate(measurements, list(all_in$subject, all_in$activity), mean)
    names(tidy)[1:2] <- c('subject', 'activity')
    
    write.csv(tidy, "tidy_dataset.csv")
    write.table(tidy, "tidy_dataset.txt")
   