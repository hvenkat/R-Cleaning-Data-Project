Getting and Cleaning Data - Code Book
==============================================================

The original data was acquired in raw text form.

 * [Original Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
 * [Abstract](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The X_test, Y_test, subject_test and features files were combined into a single set for processing. 


subject_label and activity_label were renamed to Subject and Activity respectively.


 Original dataset    | Summary dataset 
 --------------------|--------------
 `subject_label`     | `Subject`
 `activity_label`    | `Activity`
 



The activity labels from features_info were used to replace the activity codes in the dataset.

 
  activity           | activity_label
 --------------------|--------------
 `1`                 | `Walking`
 `2`                 | `Walking Upstairs`
 `3`                 | `Walking Downstairs`
 `4`                 | `Sitting`
 `5`                 | `Standing`
 `6`                 | `Laying`
 
 
Only variables containing "mean" or "std" in their names were extracted for the final dataset.
