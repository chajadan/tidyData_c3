CodeBook
=================

To better understand the resulting data set from this script, it is recommended that you read the data description contained in the zip file of the source raw data. The link to that data is in README.md

## The raw data
The true data source is from accelerometer and gyroscope sensors in mobile devices. Those datapoints had aggregate characteristics calculated, such as mean and standard deviation, along with various transformations applied to these values, such as noise filters, formulas, and normalization, generated the raw data with which we begin.

Overall, there are more than 10,000 observation is the raw data set, with each observation being the recording of one subject's activity, and the activity type they are reported as carrying out.

## Transformations applied by this script

The raw observations are first grouped by activity and subject, generally resulting in many observatios of the same subject for any one given activity. The observations that match in both subject and activity are then column-wise averaged, resulting in a single mean observation in the result tidy data. Since there are 30 subjects and 6 activities, that means that the original 10,000+ observations are boiled down to 180 observations of the mean values for each observation scenario.

## The variables

Please refer to the original data set for explicit details of how various fields were generated, since as decribed, this script predominantly adds no variables, and merely takes the mean of existing varibles, by the described grouping.

'[X/Y/Z]' is used to denote three separate variables that correspond to the 3-axial signals in the X, Y and Z directions.

* ActivityCode - an integer between 1 and 6 inclusive that has a one to one mapping to the activity name
* Activity - a text value that serves as the activity name
* Subject - an integer id between 1 and 30 inclusive, with each distinct id mapping to a distinct subject in the world
* avg_tBodyAcc-mean()-[X/Y/Z] - the remaining variables are averages of existing variables decribed in the source data set, with "avg_" appended to them
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

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
