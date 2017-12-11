Getting and Cleaning Data Course Project CodeBook by S Guauque

The analysis start by downloading and unziping the file "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" that is the Human Activity Recognition Using Smartphones Dataset Version 1.0 by Reyes-Ortiz et al.

==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

==================================================================
For the Getting and Cleaning Data Course Project the files from the downloaded zip that were used are: 
a) X_train.txt : Training set.
b) subject_train.txt : Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. Equivalent description for the subject_test.txt
c) X_test.txt : Test set.
d) subject_test.txt
e) features.txt : List of all features.
f) y_train.txt : Training labels.
g) y_test.txt : Test labels.
h) activity_labels.txt : Links the class labels with their activity name.

Running the script called "run_analysis.R" does the following: 
	a) Merges the training and the test sets to create one data set.
	b) Extracts only the measurements on the mean and standard deviation for each measurement.
	c) Uses descriptive activity names to name the activities in the data set
	d) Appropriately labels the data set with descriptive variable names.
	e) From the data set in step 4, creates a second, independent tidy data set called "tidydataset.txt" with the average of each variable for each activity and each subject.
	
Additional steps in the run_analysis.R includes to bind the subject ID from the subject_*.txt files to the correspondent X_*.txt that contains the measurements.