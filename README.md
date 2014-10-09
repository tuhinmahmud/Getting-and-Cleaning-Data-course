Getting-and-Cleaning-Data-course
================================
Merge the training and the test sets to create one data set and Extracts only the measurements on the mean and standard deviation for each measurement as follow: 
	read following data files 
		1.1 "feature.txt"
		1.2 "train/subject_train.txt"
		1.3  train/X_train.txt
		1.4  train/Y_train.txt
  From data frame found in 1.1 find the names of the columns that have "-mean" or "-std" in their names
	From data frame from in 1.2 only get the subset of columns that matches the names found in step 1.2 to create the   		smallerTraining df
  Create a "training" combining columns from df above with columns from "train/subject_train.txt" ,"train/Y_train.txt" and the 	selected columns that has "-mean" and "-std" from  "train/X_train.txt" .

 Work with "test/subject_test.txt" , "test/Y_test.txt", test/X_test.txt" similar to above training data sets and create Testing data.

combine the rows of training and testing data frame to get the comprehensive data set.

Appropriately labels the data set with descriptive variable names 
	substitute columen name with "-mean" with ".Mean."
	substitute columen name with "-std" with ".Std."
	remove "()" from around any words in the column names
	

Creates a second, independent tidy data "summary_data" set with the average of each variable for
each activity and each subject use commands from dylpr

Uses descriptive activity names to name the activities in the data set
	read "activity_labels.txt" file for descriptive names of activity and replace them in summary_data$Activiy columns.
	

Finally write the above dataset out to summary.txt
