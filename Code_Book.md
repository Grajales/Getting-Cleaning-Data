Feature Selection 
=======================================================================
The original data was calculated from: 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
=================================================================================================
After merging the test data with the train data and organizing it by subject and activity, the resulting data was called "tidy_data". These new tidy data set was averaged for each variable for each activity and each subject
The results of the tidy data after averaging was entered in a file called "tidy_data_mean.txt"
=========================================================================================================
timeBodyAccelerationeleration-XYZ
timeGravityAcceleration-XYZ
timeBodyAccelerationJerk-XYZ
timeBodyGyro-XYZ
timeBodyGyroJerk-XYZ
timeBodyAccelerationMag
timeGravityAccelerationMag
timeBodyAccelerationJerkMag
timeBodyGyroMag
timeBodyGyroJerkMag
frequencyBodyAcceleration-XYZ
frequencyBodyAccelerationJerk-XYZ
frequencyBodyGyro-XYZ
frequencyBodyAccelerationMag
frequencyBodyAccelerationJerkMag
frequencyBodyGyroMag
frequencyBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
meanFreq(): Weighted average of the frequency components to obtain a mean frequency

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
timeBodyAccelerationMean
timeBodyAccelerationJerkMean
timeBodyGyroMean
timeBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'
