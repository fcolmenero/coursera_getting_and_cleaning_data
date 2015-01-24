CODEBOOK

In this codebook you can find the list of column names (variables) for the required dataset in the 
Getting & Cleaning Data Course Project.

These variables are a subset of features selection from UCI Har Dataset as 
explained in the features_info.txt from this source, along with information about
subjects and activities carried out during the development of different tests.

All the features come from an accelerometer and a gyroscope from a Samsung Galasy S II
smartphone during the development of different  activities performed by several subjects wearing
this phone on the waist.

From this devices 3-axial acceleration and angular speed signals are captured, filtered and separated in
different components. 

In this way:

* 3-axial acceleration is decomposed into body and gravity component signals.
	
* 3-axial body linear acceleration and angular velocity signals are transformed in Jerk signals.
	
* Magnitude for all these signals (body and gravity acceleration, angular speed and Jerk signals)
  is computed using Euclidean norm.

For some of these signals, a FFT (Fast Fourier Transform) calculation was applied.

The variables for this dataset are a subset only considering the mean and standard deviation 
calculations for each of the earlier features. According to README.txt from dataset source package
feature signals are normalized within [-1,1] interval.

Thus, the construction rules for this dataset variables are:

- 'Time' prefix is used for variables related with time domain signals
- 'Frequency' prefix is used for variables related with frequency domain signals
- 'Mean' field in case of the variable is the mean of the corresponding feature	
- 'STD' field in case  of the variable is the standard deviation of the corresponding feature	
- 'Mag' field in case of the variable is the magnitude of the corresponding signal
- 'Axis[XYZ]' The 3D axis the signal was acquired
- A signal/feature name as substring surrounded by some of the previous fields,prefixes and suffixes:
	BodyAcceleration, GravityAcceleration, BodyAccelerationJerk,BodyGyroscope,BodyGyroscopeJerk

In the 'subject' variable, you can find  the numerical volunteer unique ID who did the activity during the test/training record.

In the 'activity' variable you can find a textual label (factor) describing the activity carried out by the volunteer
in the test record. These are the possible activity values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
	

Variable | Description 
---------|-------------
subject  | The volunteer numerical ID who carried out the monitorized activity for this record    
activity | The activity carried out by the volunteer as string: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING    
TimeBodyAccelerationMeanAxisX | 	Mean of Body acceleration  from X axis as time domain signal 
TimeBodyAccelerationMeanAxisY |  	Mean of Body acceleration  from Y axis as time domain signal 
TimeBodyAccelerationMeanAxisZ | 	Mean of Body acceleration  from Z axis as time domain signal 
TimeBodyAccelerationSTDAxisX | 		Body acceleration standard deviation from X axis as time domain signal 
TimeBodyAccelerationSTDAxisY | 		Body acceleration standard deviation from Y axis as time domain signal 
TimeBodyAccelerationSTDAxisZ | 		Body acceleration standard deviation from Y axis as time domain signal 
TimeGravityAccelerationMeanAxisX | 	Mean of Gravity acceleration  from X axis as time domain signal 
TimeGravityAccelerationMeanAxisY | 	Mean of Gravity acceleration  from Y axis as time domain signal 
TimeGravityAccelerationMeanAxisZ | 	Mean of Gravity acceleration  from Z axis as time domain signal 
TimeGravityAccelerationSTDAxisX |  	Standard deviation of gravity acceleration  from X axis as time domain signal 
TimeGravityAccelerationSTDAxisY | 	Standard deviation of gravity acceleration standard deviation from Y axis as time domain signal 
TimeGravityAccelerationSTDAxisZ | 	Standard deviation of gravity acceleration standard deviation from Z axis as time domain signal 
TimeBodyAccelerationJerkMeanAxisX | Mean of body acceleration derivative (Jerk) from X axis as time domain signal 
TimeBodyAccelerationJerkMeanAxisY | Mean of body acceleration derivative (Jerk) from Y axis as time domain signal 
TimeBodyAccelerationJerkMeanAxisZ | Mean of body acceleration derivative (Jerk) from Z axis as time domain signal 
TimeBodyAccelerationJerkSTDAxisX | 	Standard deviation of body acceleration derivative (Jerk) from X axis as time domain signal 
TimeBodyAccelerationJerkSTDAxisY | 	Standard deviation of body acceleration derivative (Jerk) from Y axis as time domain signal 
TimeBodyAccelerationJerkSTDAxisZ | 	Standard deviation of body acceleration  derivative (Jerk) from Z axis as time domain signal 
TimeBodyGyroscopeMeanAxisX | 		Mean of body angular velocity from X axis as time domain signal
TimeBodyGyroscopeMeanAxisY | 		Mean of body angular velocity from Y axis as time domain signal
TimeBodyGyroscopeMeanAxisZ | 		Mean of body angular velocity from Z axis as time domain signal
TimeBodyGyroscopeSTDAxisX | 		Standard deviation of body angular velocity from X axis as time domain signal
TimeBodyGyroscopeSTDAxisY | 		Standard deviation of body angular velocity from Y axis as time domain signal
TimeBodyGyroscopeSTDAxisZ | 		Standard deviation of body angular velocity from Z axis as time domain signal
TimeBodyGyroscopeJerkMeanAxisX | 	Mean of body angular velocity derivative (Jerk) from X axis as time domain signal
TimeBodyGyroscopeJerkMeanAxisY | 	Mean of body angular velocity derivative (Jerk) from Y axis as time domain signal
TimeBodyGyroscopeJerkMeanAxisZ | 	Mean of body angular velocity derivative (Jerk) from Z axis as time domain signal
TimeBodyGyroscopeJerkSTDAxisX | 	Standard deviation of body angular velocity derivative (Jerk) from X axis as time domain signal
TimeBodyGyroscopeJerkSTDAxisY | 	Standard deviation of body angular velocity derivative (Jerk) from Y axis as time domain signal
TimeBodyGyroscopeJerkSTDAxisZ | 	Standard deviation of body angular velocity derivative (Jerk) from Z axis as time domain signal
TimeBodyAccelerationMagMean | 		Mean of body acceleration vector magnitude as time domain signal
TimeBodyAccelerationMagSTD | 		Standard deviation of body acceleration vector magnitude as time domain signal
TimeGravityAccelerationMagMean | 	Mean of gravity acceleration vector magnitude as time domain signal
TimeGravityAccelerationMagSTD | 	Standard deviation of gravity acceleration vector magnitude as time domain signal
TimeBodyAccelerationJerkMagMean | 	Mean of body acceleration derivative (Jerk) magnitude as time domain signal
TimeBodyAccelerationJerkMagSTD | 	Standard deviation of body acceleration derivative (Jerk) magnitude as time domain signal
TimeBodyGyroscopeMagMean | 			Mean of angular velocity vector magnitude as time domain signal		 
TimeBodyGyroscopeMagSTD | 			Standard deviation of angular velocity vector magnitude	as time domain signal		
TimeBodyGyroscopeJerkMagMean | 		Mean of angular velocity derivate (Jerk) magnitude as time domain signal	 	
TimeBodyGyroscopeJerkMagSTD | 		Standard deviation of angular velocity derivate (Jerk) magnitude as time domain signal		
FreqBodyAccelerationMeanAxisX | 	Mean of Body acceleration  from X axis as frequency domain signal
FreqBodyAccelerationMeanAxisY |     Mean of Body acceleration  from Y axis as frequency domain signal
FreqBodyAccelerationMeanAxisZ |     Mean of Body acceleration  from Z axis as frequency domain signal
FreqBodyAccelerationSTDAxisX | 		Standard deviation of body acceleration  from X axis as frequency domain signal 
FreqBodyAccelerationSTDAxisY |      Standard deviation of body acceleration  from Y axis as frequency domain signal 
FreqBodyAccelerationSTDAxisZ |      Standard deviation of body acceleration  from Z axis as frequency domain signal 
FreqBodyAccelerationJerkMeanAxisX | Mean of body acceleration derivative (Jerk) from X axis as frequency domain signal
FreqBodyAccelerationJerkMeanAxisY | Mean of body acceleration derivative (Jerk) from Y axis as frequency domain signal
FreqBodyAccelerationJerkMeanAxisZ | Mean of body acceleration derivative (Jerk) from Z axis as frequency domain signal
FreqBodyAccelerationJerkSTDAxisX | 	Standard deviation of body acceleration derivative (Jerk) from X axis as frequency domain signal 
FreqBodyAccelerationJerkSTDAxisY | 	Standard deviation of body acceleration derivative (Jerk) from Y axis as frequency domain signal 
FreqBodyAccelerationJerkSTDAxisZ | 	Standard deviation of body acceleration  derivative (Jerk) from Z axis as frequency domain signal
FreqBodyGyroscopeMeanAxisX | 		Mean of body angular velocity from X axis as frequency domain signal
FreqBodyGyroscopeMeanAxisY |        Mean of body angular velocity from Y axis as frequency domain signal
FreqBodyGyroscopeMeanAxisZ |        Mean of body angular velocity from Z axis as frequency domain signal
FreqBodyGyroscopeSTDAxisX | 		Standard deviation of body angular velocity from X axis as frequency domain signal
FreqBodyGyroscopeSTDAxisY |         Standard deviation of body angular velocity from Y axis as frequency domain signal
FreqBodyGyroscopeSTDAxisZ |         Standard deviation of body angular velocity from Z axis as frequency domain signal
FreqBodyAccelerationMagMean | 		Mean of body acceleration vector magnitude as frequency domain signal
FreqBodyAccelerationMagSTD |        Standard deviation of body acceleration vector magnitude as frequency domain signal
FreqBodyAccelerationJerkMagMean |  	Mean of body acceleration derivative (Jerk) magnitude as frequency domain signal
FreqBodyAccelerationJerkMagSTD |   	Standard deviation of body acceleration derivative (Jerk) magnitude as frequency domain signal
FreqBodyGyroscopeMagMean |          Mean of angular velocity vector magnitude as frequency domain signal		
FreqBodyGyroscopeMagSTD |           Standard deviation of angular velocity vector magnitude as frequency domain signal			
FreqBodyGyroscopeJerkMagMean |      Mean of angular velocity derivate (Jerk) magnitude as frequency domain signal		
FreqBodyGyroscopeJerkMagSTD |       Standard deviation of angular velocity derivate (Jerk) magnitude as frequency domain signal	
                                    
                                   