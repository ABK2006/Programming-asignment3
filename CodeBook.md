# Code Book

## Original Dataset
Human Activity Recognition Using Smartphones Dataset  
Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  
Data from 30 subjects performing 6 activities with smartphone accelerometer & gyroscope.

## Tidy Dataset: `tidy_data.txt`
- **Dimensions**: 180 rows × 68 columns.  
- **Structure**: Each row = average of measurements for 1 subject + 1 activity.

### 1. Identifier variables
- **subject**: Subject ID (1–30).  
- **activity**: Activity factor with 6 levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

### 2. Measurement variables (66 columns)
Averages of time/frequency domain signals. Units: **g** (acceleration), **rad/s** (gyroscope).  

Naming convention: `[Domain][Sensor][Measurement]_`
- **Domain**: Time (time domain), Frequency (frequency domain).  
- **Sensor**: BodyAcceleration, GravityAcceleration, BodyGyroscope.  
- **Measurement**: mean (average), std (standard deviation).  
- **Axis**: X, Y, Z.

Examples:  
- `TimeBodyAcceleration_mean_X` – mean body acceleration X‑axis (time).  
- `FrequencyBodyGyroscope_std_Z` – std dev gyroscope Z‑axis (frequency).

### 3. Transformations
1. Merge train/test data with `rbind`.  
2. Extract columns with “mean()” or “std()” using `grep`.  
3. Replace activity numbers with descriptive labels.  
4. Clean variable names: `t→Time`, `f→Frequency`, `Acc→Acceleration`, etc.  
5. Summarise: `group_by(subject, activity)` → `summarise_all(mean)` with dplyr.
