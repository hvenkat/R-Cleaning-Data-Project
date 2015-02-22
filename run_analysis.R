build.dataset <- function() {
  
    if(!require("dplyr")) install.packages("dplyr")
    library("dplyr")
  
    #Read test observations, activites, subjects 
    print("Reading test files...")
    x.test <- read.csv("./UCI HAR Dataset/test/X_test.txt", sep = "", header = F)
    y.test <- read.csv("./UCI HAR Dataset/test/y_test.txt", sep = "", header = F)
    subject.test <- read.csv("./UCI HAR Dataset/test/subject_test.txt", 
                              sep = "", header = F)

    
    
    #Read train observations, activites, subjects 
    print("Reading train files...")
    x.train <- read.csv("./UCI HAR Dataset/train/X_train.txt", sep = "", header = F)
    y.train <- read.csv("./UCI HAR Dataset/train/y_train.txt", sep = "", header = F)
    subject.train <- read.csv("./UCI HAR Dataset/train/subject_train.txt", 
                              sep = "", header = F)

    

    #Read observation (X Variable) column names
    features <- read.csv("./UCI HAR Dataset/features.txt", sep = "", header = F)
    features <- as.vector(features[,2])
    

    #Build and merge test and train datasets
    print("Building dataset...")  
    test.frame <- data.frame(x.test,y.test,subject.test)
    colnames(test.frame) <- c(features,"Activity","Subject")
    train.frame <- data.frame(x.train,y.train,subject.train)
    colnames(train.frame) <- c(features,"Activity","Subject")
    temp.frame <- rbind(test.frame,train.frame)
    remove(x.test,y.test,subject.test, x.train, y.train, subject.train,
            test.frame, train.frame)  
    print("Dataset construction complete.")
    
    
    intercols <- grep("mean()|meanFreq()|std()", features)
    interframe <- temp.frame[,intercols]
    
    finalcols <- names(interframe)
    final.frame <- cbind(interframe,temp.frame[,"Activity"],temp.frame[,"Subject"])
    colnames(final.frame) <- c(finalcols,"Activity","Subject")
    remove(intercols,interframe,temp.frame,finalcols)
    
    
    #Replace Activity values with descriptions
    activity.desc <- c("Walking","Walking Upstairs", "Walking Downstairs", "Sitting",
                       "Standing","Laying")
    for(i in 1:6) {
      final.frame[final.frame$Activity == i,"Activity"] <- activity.desc[i]
    }

    #Write out summary frame into a new CSV file
    summary.frame <- final.frame %>% group_by(Activity, Subject) %>% 
                        summarise_each(funs(mean))
    
    write.csv(summary.frame, file = 'summary_data.csv',row.names = FALSE)
}
