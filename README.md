readme.txt for Assignment: Getting and Cleaning Data

**********************************************************

Introduction: The purpose of this readme is to describe the files used in the course assignment for "Getting and Cleaning Data". There are two files connected with this project:
1. R script file named run_analysis.R
2. Code book file named CodeBook.md

**********************************************************

1. run_analysis.R: This file begins with the raw data files provided (X_test, X_train, Y_test, Y_train, subject_test, subject_train) as well as the features data (features.txt) and does the following:
	-imports the data
	-updates the activity names to be more descriptive
	-adds column names
	-keeps only features relating to the mean or standard deviation
	-merges all the data into one data frame
	-creates a "tidy" data set containing the mean value for all combinations of subject and activity
	-updates the column names to be more descriptive (i.e. "mean(...)"

More details and comments are noted in the R script itself.

**********************************************************

2. CodeBook.md: This markdown file describes the data and transformations in further detail.
