# Tidy Data Set

The tidy data set can be found in data/tidyData.txt
The data set contains 4 columns

1. Activity name, one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
2. Subject number identifying the being recorded
3. Feature for the recording.  The full list of all possible values is found at the end of this document.
4. The measurement value.

The following steps were taken to produce a tidy data set
1. The source data from the files were merged by line numbers: subject_test.txt, X_test.txt, y_test.txt
2. The source data from the files were merged by line numbers: subject_train.txt, X_train.txt, y_train.txt
3. The data sets were merged togeteher, applying the appropriate label to the activity
4. The data set was reduced to include only the desired features
5. The data set was melted to have one observation per row

# Mean tidy data set
The mean tidy data set can be found in data/tidyDataMean.txt
The data set contains 5 columns

1. Activity name, one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
2. Subject number identifying the being recorded
3. Feature for the recording.  The full list of all possible values is found at the end of this document.
4. The mean measurement value.

The following steps were taken to produce a tidy data set
1. Group all the tidy data by activity, subject and feature, then take the mean value for all the elements.


## List of Features
* tBodyAcc.mean...X
* tBodyAcc.mean...Y
* tBodyAcc.mean...Z
* tGravityAcc.mean...X
* tGravityAcc.mean...Y
* tGravityAcc.mean...Z
* tBodyAccJerk.mean...X
* tBodyAccJerk.mean...Y
* tBodyAccJerk.mean...Z
* tBodyGyro.mean...X
* tBodyGyro.mean...Y
* tBodyGyro.mean...Z
* tBodyGyroJerk.mean...X
* tBodyGyroJerk.mean...Y
* tBodyGyroJerk.mean...Z
* tBodyAccMag.mean..
* tGravityAccMag.mean..
* tBodyAccJerkMag.mean..
* tBodyGyroMag.mean..
* tBodyGyroJerkMag.mean..
* fBodyAcc.mean...X
* fBodyAcc.mean...Y
* fBodyAcc.mean...Z
* fBodyAccJerk.mean...X
* fBodyAccJerk.mean...Y
* fBodyAccJerk.mean...Z
* fBodyGyro.mean...X
* fBodyGyro.mean...Y
* fBodyGyro.mean...Z
* fBodyAccMag.mean..
* fBodyBodyAccJerkMag.mean..
* fBodyBodyGyroMag.mean..
* fBodyBodyGyroJerkMag.mean..
* angle.tBodyAccMean.gravity.
* angle.tBodyAccJerkMean..gravityMean.
* angle.tBodyGyroMean.gravityMean.
* angle.tBodyGyroJerkMean.gravityMean.
* angle.X.gravityMean.
* angle.Y.gravityMean.
* angle.Z.gravityMean.
* tBodyAcc.std...X
* tBodyAcc.std...Y
* tBodyAcc.std...Z
* tGravityAcc.std...X
* tGravityAcc.std...Y
* tGravityAcc.std...Z
* tBodyAccJerk.std...X
* tBodyAccJerk.std...Y
* tBodyAccJerk.std...Z
* tBodyGyro.std...X
* tBodyGyro.std...Y
* tBodyGyro.std...Z
* tBodyGyroJerk.std...X
* tBodyGyroJerk.std...Y
* tBodyGyroJerk.std...Z
* tBodyAccMag.std..
* tGravityAccMag.std..
* tBodyAccJerkMag.std..
* tBodyGyroMag.std..
* tBodyGyroJerkMag.std..
* fBodyAcc.std...X
* fBodyAcc.std...Y
* fBodyAcc.std...Z
* fBodyAccJerk.std...X
* fBodyAccJerk.std...Y
* fBodyAccJerk.std...Z
* fBodyGyro.std...X
* fBodyGyro.std...Y
* fBodyGyro.std...Z
* fBodyAccMag.std..
* fBodyBodyAccJerkMag.std..
* fBodyBodyGyroMag.std..
* fBodyBodyGyroJerkMag.std..

