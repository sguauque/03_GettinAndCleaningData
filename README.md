Getting and Cleaning Data Course Project README by S Guauque

This submission contains: 
1) A tidy data set called "tidydataset.txt"
2) A code book that describes the variables, the data, and any transformations or work that I performed to clean up the data called "CodeBook.md"
3) This README.md that explains the analysis.
4) The script called "run_analysis.R".

	
###########

The analysis start by downloading and unziping the file "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip". 

The files from the downloaded zip to use for the analysis are: 
a) X_train.txt
b) subject_train.txt
c) X_test.txt
d) subject_test.txt
e) features.txt
f) y_train.txt
g) y_test.txt
h) activity_labels.txt

Run the script called "run_analysis.R" that does the following: 
	a) Merges the training and the test sets to create one data set.
	b) Extracts only the measurements on the mean and standard deviation for each measurement.
	c) Uses descriptive activity names to name the activities in the data set
	d) Appropriately labels the data set with descriptive variable names.
	e) From the data set in step 4, creates a second, independent tidy data set called "tidydataset.txt" with the average of each variable for each activity and each subject.
	
Additional steps in the run_analysis.R includes to bind the subject ID from the subject_*.txt files to the correspondent X_*.txt that contains the measurements.

