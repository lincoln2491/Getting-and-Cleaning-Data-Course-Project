What script run_analisys do:

1. Downloading data
2. Extracting data from zip archive
3. Loading activity labels into "activities" table and seting column names for this table
4. Loading features into "features" table
5. Selecting list of features to use (all with "mean" or "std" in name) into "colToUse" list
6. Loading all features for test data into "testDataX" table
7. Loading all activities for test data into "testDataY" table
8. Loading all subjects for test data into "testDataSubject" table
9. Seting names of features as column names of "testDataX" table 
10. Seting "labels" as column name of "trainDataY" table
11. Seting "subject" as column name of "trainDataSubject" table
12. Removing unused columns from "testDataX" table (columns which names are in "colToUse" list are preserved)
13. Removing "(" and ")" chars in column names of "testDataX" table
14. Repeating steps 6 to 13 for training data (corresponding tables have "train" instead "test" in name)
15. Creating "testDF" data frame from "testDataSubject", "testDataY" and "testDataX"
16. Creating "trainDF" data frame from "trainDataSubject", "trainDataY" and "trainDataX"
17. Creating "df" data frame from "testDF" and "trainDF"
18. Changing "labels" column of "df" data frame into names of acitivity from "activities" table
19. Creating a second, independent tidy "ag" data frame with the average of each variable for each activity and each subject
20. Renaming columns "Group.1" and "Group.2" into "person" and "activity"
21. Saving "ag" data frame into "tidy_data.txt" file