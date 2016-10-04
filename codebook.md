Feature Selection 
=================
The features selected for this tidy data set come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ found in the full dataset from UCI. Documentation for the full UCI dataset can be found at the end of this document [1].

subj - subject identifier (factor levels 1-30) 

activity - activity label (Factor, 6 levels)

Variable names with measurements have four components, as detailed by the below table:

Component | Abbreviation | Meaning
|:------------- | ------------- | ----- |
| prefix | t (time) or f (fourier) | Is this a direct observation or a fourier transformation?|
| derivative |  acc, angle, jerk  |  Angular velocity, Acceleration (dy/dx), or Jerk(dy/dy/dx)? |
| Affected| Body or Gravity | Is this signal an effect of gravity or the measured body?|
| Measure | Mean or SD | Which of the requested measurments does this variable show?|
| Axis | x,y, or z| The axis along which the effect is measured.|

The features.txt file within the dataset further specifies: 
>Time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The complete list of variables is:

"1" "subj"
"2" "activity"
"3" "tbodyaccmeanx"
"4" "tbodyaccmeany"
"5" "tbodyaccmeanz"
"6" "tgravityaccmeanx"
"7" "tgravityaccmeany"
"8" "tgravityaccmeanz"
"9" "tbodyaccjerkmeanx"
"10" "tbodyaccjerkmeany"
"11" "tbodyaccjerkmeanz"
"12" "tbodygyromeanx"
"13" "tbodygyromeany"
"14" "tbodygyromeanz"
"15" "tbodygyrojerkmeanx"
"16" "tbodygyrojerkmeany"
"17" "tbodygyrojerkmeanz"
"18" "tbodyaccmagmean"
"19" "tgravityaccmagmean"
"20" "tbodyaccjerkmagmean"
"21" "tbodygyromagmean"
"22" "tbodygyrojerkmagmean"
"23" "fbodyaccmeanx"
"24" "fbodyaccmeany"
"25" "fbodyaccmeanz"
"26" "fbodyaccmeanfreqx"
"27" "fbodyaccmeanfreqy"
"28" "fbodyaccmeanfreqz"
"29" "fbodyaccjerkmeanx"
"30" "fbodyaccjerkmeany"
"31" "fbodyaccjerkmeanz"
"32" "fbodyaccjerkmeanfreqx"
"33" "fbodyaccjerkmeanfreqy"
"34" "fbodyaccjerkmeanfreqz"
"35" "fbodygyromeanx"
"36" "fbodygyromeany"
"37" "fbodygyromeanz"
"38" "fbodygyromeanfreqx"
"39" "fbodygyromeanfreqy"
"40" "fbodygyromeanfreqz"
"41" "fbodyaccmagmean"
"42" "fbodyaccmagmeanfreq"
"43" "fbodybodyaccjerkmagmean"
"44" "fbodybodyaccjerkmagmeanfreq"
"45" "fbodybodygyromagmean"
"46" "fbodybodygyromagmeanfreq"
"47" "fbodybodygyrojerkmagmean"
"48" "fbodybodygyrojerkmagmeanfreq"
"49" "angletbodyaccmeangravity"
"50" "angletbodyaccjerkmeangravitymean"
"51" "angletbodygyromeangravitymean"
"52" "angletbodygyrojerkmeangravitymean"
"53" "anglexgravitymean"
"54" "angleygravitymean"
"55" "anglezgravitymean"
"56" "tbodyaccstdx"
"57" "tbodyaccstdy"
"58" "tbodyaccstdz"
"59" "tgravityaccstdx"
"60" "tgravityaccstdy"
"61" "tgravityaccstdz"
"62" "tbodyaccjerkstdx"
"63" "tbodyaccjerkstdy"
"64" "tbodyaccjerkstdz"
"65" "tbodygyrostdx"
"66" "tbodygyrostdy"
"67" "tbodygyrostdz"
"68" "tbodygyrojerkstdx"
"69" "tbodygyrojerkstdy"
"70" "tbodygyrojerkstdz"
"71" "tbodyaccmagstd"
"72" "tgravityaccmagstd"
"73" "tbodyaccjerkmagstd"
"74" "tbodygyromagstd"
"75" "tbodygyrojerkmagstd"
"76" "fbodyaccstdx"
"77" "fbodyaccstdy"
"78" "fbodyaccstdz"
"79" "fbodyaccjerkstdx"
"80" "fbodyaccjerkstdy"
"81" "fbodyaccjerkstdz"
"82" "fbodygyrostdx"
"83" "fbodygyrostdy"
"84" "fbodygyrostdz"
"85" "fbodyaccmagstd"
"86" "fbodybodyaccjerkmagstd"
"87" "fbodybodygyromagstd"
"88" "fbodybodygyrojerkmagstd"
