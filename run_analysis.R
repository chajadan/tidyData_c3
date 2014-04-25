expectedFiles <- c("train/subject_train.txt", "test/subject_test.txt")
expectedFiles <- c(expectedFiles, "train/y_train.txt", "test/y_test.txt")
expectedFiles <- c(expectedFiles, "train/X_train.txt", "test/X_test.txt")
expectedFiles <- c(expectedFiles, "features.txt", "activity_labels.txt")

if (!all(sapply(expectedFiles, file.exists))) {
    print("Could not find all expected files.")
    print("Unzip the data and set your working directory to the 'UCI HAR Dataset' folder")
    print("Your working directory should contain the following:")
    print(expectedFiles)
} else if (is.element("sqldf", installed.packages()[,1]) == FALSE) {
    print("Please install the package named sqldf")
} else if (!exists("grep")) {
    print("Cannot locate the grep function. Please install the necessary package and load it.")
} else {
    
    # read and append the train and test data
    train_subjects <- read.table("train/subject_train.txt")
    test_subjects <- read.table("test/subject_test.txt")
    subjects <- rbind(train_subjects, test_subjects)
    train_subjects <- NULL
    test_subjects <- NULL
    names(subjects) <- "Subject"
    
    train_labels <- read.table("train/y_train.txt")
    test_labels <- read.table("test/y_test.txt")
    labels <- rbind(train_labels, test_labels)
    train_labels <- NULL
    test_labels <- NULL
    names(labels) <- "Activity"
    
    train_set <- read.table("train/X_train.txt")
    test_set <- read.table("test/X_test.txt")
    set <- rbind(train_set, test_set)
    train_set <- NULL
    test_set <- NULL
    
    # set variable/column labels on the set table, as provided in the source
    featureLabels <- read.table("features.txt")
    names(set) <- as.character(featureLabels [,2])
    
    # extract only fields that contain "mean" or "std" as part of their name
    keptCols <- c(grep("mean", featureLabels[,2]), grep("std", featureLabels[,2]))
    set <- set[,keptCols]
    
    # merge the three tables into one set
    data <- cbind(labels, subjects, set)
    
    library(sqldf)
    
    indActivity <- 1:6
    indSubject <- 1:30
    
    # initiate the resulting tidy data set to an empyt data.frame
    ActivityAvgPerUser <- data.frame()
    
    for (i in indSubject) {
        for (j in indActivity) {
            query <- paste("select * from data where Subject =", i, "and Activity =", j)
            # select the subset of observations that match the subject and activity index
            subset <- sqldf(query)
            # take mean of each column and add this to the tidy data
            ActivityAvgPerUser <- rbind(ActivityAvgPerUser, sapply(subset, mean))
        }
    }
    
    subset <- NULL
    
    # preserve names as the base, to be altered later
    names(ActivityAvgPerUser) <- names(data)
    
    # return the first two columns to integer types, from numeric (due to the application of mean)
    ActivityAvgPerUser[,1] <- as.integer(ActivityAvgPerUser[,1])
    ActivityAvgPerUser[,2] <- as.integer(ActivityAvgPerUser[,2])
    
    # duplicate the first column, so we can make a human readable text value representation of the activity
    ActivityAvgPerUser <- cbind(ActivityAvgPerUser[,1], ActivityAvgPerUser[,1], ActivityAvgPerUser[,2:ncol(ActivityAvgPerUser)])
    # set names on the first two columns
    names(ActivityAvgPerUser)[1:2] <- c("ActivityCode", "Activity")

    # read the activity names, as provided by the source data
    activityLabels <- read.table("activity_labels.txt")
    
    # turn the second column into a factor
    ActivityAvgPerUser[,2] <- as.factor(ActivityAvgPerUser[,2])
    # add levels to the factor, which will cause the column to display the text
    levels(ActivityAvgPerUser[,2]) <- activityLabels[,2]
    
    # write out the tidy data
    write.table(ActivityAvgPerUser, "tidyData.txt")

    # let the user know
    print("The tidy data has been written to the file 'tidyData.txt'")
    
}
