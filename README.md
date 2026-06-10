# Programming-asignment3
Getting and cleaning Data
# Getting and Cleaning Data - Course Project

## Purpose
Demonstrate ability to collect, work with, and clean a dataset.
Dataset: Human Activity Recognition Using Smartphones (UCI ML Repository).

## Files in this repo
1. `run_analysis.R` – R script that performs all data cleaning steps  
2. `tidy_data.txt` – Final tidy dataset created by the script  
3. `CodeBook.md` – Description of variables and transformations  

## How to run the analysis
1. Make sure R and **dplyr** are installed.  
2. Place `run_analysis.R` in your working directory.  
3. Run: `source("run_analysis.R")`.  
4. The script downloads the dataset if “UCI HAR Dataset” folder doesn’t exist.  
5. Output file `tidy_data.txt` is created in the working directory.

## What `run_analysis.R` does
1. Merges training and test sets into one dataset.  
2. Extracts only measurements on mean and standard deviation.  
3. Uses descriptive activity names (WALKING, WALKING_UPSTAIRS, …).  
4. Labels variables with descriptive names (Time/Frequency, Acceleration/Gyroscope).  
5. Creates a second tidy dataset with the average of each variable for each subject + activity.

## Output
`tidy_data.txt` – 180 rows × 68 columns. Each row = average measurements for 1 subject doing 1 activity.
