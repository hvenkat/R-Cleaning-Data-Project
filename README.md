##Repository for Coursera Getting and Cleaning Data Project

### run_analysis.R

After sourcing, the build.dataset() function needs to be run.

```r
source('./run_analysis.R')
build.dataset()
```

## Processing steps

1. Check if the dplyr package is available, else install it.
2. Load the dplyr package.
3. Read the test and train files into R. This includes the observations(X_test), the column names of X (Y_test) and the subject_test files for each.
4. Combine the two files into one data frame and label the Activity and Subject columns.
5. Create a new frame with only the Subject, Activity and the mean and standard deviation columns from the original combined dataset.
6. Replace Activity Codes (1-6) with descriptive terms.
7. Create a summary dataset containing only average values for each column broken down by Subject and Activity.
8. Write out the summary dataset in a csv file (summary_data.csv)

