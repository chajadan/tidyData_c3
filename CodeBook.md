CodeBook
=================

To better understand the resulting data set from this script, it is recommended that you read the data descriptions contained in the zip file of the source raw data. The link to that data is in README.md

## The raw data
The true data source is from accelerometer and gyroscope sensors in mobile devices. Those datapoints had aggregate characteristics calculated, such as mean and standard deviation, along with various transformations applied to these values, such as noise filters, formulas, and normalization, generated the raw dataset with which we begin.

Overall, there are more than 10,000 observation is the raw data set, with each observation relating to the recording of one subject's activity, and the activity type they are reported as carrying out.

## Transformations applied by this script

The raw observations are first grouped by activity and subject, generally resulting in many observations of the same subject for any one given activity. The observations that match in both subject and activity are then column-wise averaged, resulting in a single mean observation in the resulting tidy data. Since there are 30 subjects and 6 activities, that means that the original 10,000+ observations are boiled down to 180 observations of the mean values for each observation scenario.

## The variables

Please refer to the original data set for explicit details of how various fields were generated, since as decribed, this script predominantly adds no variables, and merely takes the mean of existing varibles, by the described grouping.

The variables of the resulting tidy data, as represented in order by columns, are:

* ActivityCode - an integer between 1 and 6 inclusive that has a one to one mapping to the activity name
* Activity - a text value that serves as the activity name
* Subject - an integer id between 1 and 30 inclusive, with each distinct id mapping to a distinct subject in the world

The remaining variables that follow are averages of existing variables decribed in the source data set, with "avg_" appended to them to designate the change made by this script. '[X/Y/Z]' is used to denote three separate variables that correspond to the 3-axial signals in the X, Y and Z directions, which in the original are denoted -XYZ.

* avg_tBodyAcc-mean()-[X/Y/Z]
* avg_tGravityAcc-mean()-[X/Y/Z]
* avg_tBodyAccJerk-mean()-[X/Y/Z]
* avg_tBodyGyro-mean()-[X/Y/Z]
* avg_tBodyGyroJerk-mean()-[X/Y/Z]
* avg_tBodyAccMag-mean()
* avg_tGravityAccMag-mean()
* avg_tBodyAccJerkMag-mean()
* avg_tBodyGyroMag-mean()
* avg_tBodyGyroJerkMag-mean()
* avg_fBodyAcc-mean()-[X/Y/Z]
* avg_fBodyAcc-meanFreq()-[X/Y/Z]
* avg_fBodyAccJerk-mean()-[X/Y/Z]
* avg_fBodyAccJerk-meanFreq()-[X/Y/Z]
* avg_fBodyGyro-mean()-[X/Y/Z]
* avg_fBodyGyro-meanFreq()-[X/Y/Z]
* avg_fBodyAccMag-mean()
* avg_fBodyAccMag-meanFreq()
* avg_fBodyBodyAccJerkMag-mean()
* avg_fBodyBodyAccJerkMag-meanFreq()
* avg_fBodyBodyGyroMag-mean()
* avg_fBodyBodyGyroMag-meanFreq()
* avg_fBodyBodyGyroJerkMag-mean()
* avg_fBodyBodyGyroJerkMag-meanFreq()
* avg_tBodyAcc-std()-[X/Y/Z]
* avg_tGravityAcc-std()-[X/Y/Z]
* avg_tBodyAccJerk-std()-[X/Y/Z]
* avg_tBodyGyro-std()-[X/Y/Z]
* avg_tBodyGyroJerk-std()-[X/Y/Z]
* avg_tBodyAccMag-std()
* avg_tGravityAccMag-std()
* avg_tBodyAccJerkMag-std()
* avg_tBodyGyroMag-std()
* avg_tBodyGyroJerkMag-std()
* avg_fBodyAcc-std()-[X/Y/Z]
* avg_fBodyAccJerk-std()-[X/Y/Z]
* avg_fBodyGyro-std()-[X/Y/Z]
* avg_fBodyAccMag-std()
* avg_fBodyBodyAccJerkMag-std()
* avg_fBodyBodyGyroMag-std()
* avg_fBodyBodyGyroJerkMag-std()
