# Getting-and-Cleaning-Data
Coursera Project on Getting and Cleaning Data
---
title: "README"
output: README
---

 Course project for the Getting and Cleaning Data Coursera course. The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 
 
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone
 
 he R script, run_analysis.R, does the following:

Data download and unziped, directory been set to where the data been downloaded then 

1.Merges the training and the test sets to create one data set.

name the variable in the merged data set with unique name then using the dplyr package 
2.Extracts only the measurements on the mean and standard deviation for each measurement.

Change the labele for activity to the acitvity name.

3.Uses descriptive activity names to name the activities in the data set

Changing the variable name to be easier to read using gsub

4.Appropriately labels the data set with descriptive variable names.

Again using group by command from dpylr package calculate the avergae for each variable

5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
