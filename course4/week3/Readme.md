##Explaination for Week3 Course Project

1. The code reads activity lables from the text file into a data frame called **activities**

2. The features are read from features text into a data frame known as **features**.

3. Then it removes the special characters such as '(',')','-','.' from the feature name so that we can use those names for describing the lables in the data frame.

4. We read test data set.This is done in 3 steps, first the subject who have performed for test data is read into **subject_test** , then the activities performed by the subject are read into **activity_test** data frame, finally the test data is read into **test_data**

5. We read train data set.This is done in 3 steps, first the subject who have performed for train data is read into **subject_train** , then the activities performed by the subject are read into **activity_train** data frame, finally the train data is read into **train_data**

6. We bind the **subject_test** and **activity_test** columns to the **test_data** column wise.

7. We bind the **subject_train** and **activity_train** columns to the **train_data** column wise.

8. We merge the **test_data** and **train_data** row wise into **merge_data** data frame

9. Then from **merge_data** data frame we select only the mean and standard deviation intp **meanStd** data frame

10. Then we split **meanStd** data frame based on activity and subject and calculate the mean of all the variables into **agrData** data frame

11. We replace the activities number with name

12. We take out the group by column names since we don't need them in final result.

13. We write **agrData** data frame into file.