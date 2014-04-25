Coursera, Getting and Cleaning Data, Project
============================================

This repository consists of three files:
* README.md (this file, descibes how to run the script)
* CodeBook.md (discusses transformation applied by the script, and the data present in the tidied data)
* run_analysis.R (the script, that processes the raw data, details of which are described below)

## The Data

In case you do not yet have the data, in can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Extract the contents of the zip file, and set your R working directory to be the 'UCI HAR Dataset' folder. The script will read the raw data from there and right out the tidy data to a file named tidyData.txt. The script will not alter any of the existing raw data -- those files may be marked read only.

