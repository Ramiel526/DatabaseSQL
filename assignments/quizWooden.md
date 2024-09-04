# Q1:

> Load the data in the given Excel csv file to a database table as-is using SQL Developer. Show all steps and the loaded table.

![tableload_success]("C:\dev\sqlDev\assignments\Screenshot 2024-09-03 225912.png)

![testdataTable]("C:\dev\sqlDev\assignments\ScreenshotTable.png)

# Q2:

> From the table in Q1, using SQL create the student table (student_id, name varchar, dob)
    Create the keys using a student table sequence.
    Student name and dob cannot be NULL.
    Test the constraints using SQL and show the results.
    You have to test the primary key constraint, and the null constraint on the 2 columns.

# Q3: 

> From the table in Q1 create a club table (club_id, club_name)

> Club examples are hiking, running and tennis.
> Club_id must be generated using a club sequence and the club-name cannot be null.
> Test the constraints using SQL and show the results.
> You have to test the primary key and constraint, and the null constraint on 1 column.

# Q4: 

> From the table in Q1 create a messages table (message_from, message_to, message)
> Example message is from Mary to Jane and Hello.
> message_from & message_to should be foreign keys to the student table, and the message cannot be null.
> message_from & message_to are student_ids.
> Test the constraints using SQL and show the results.
> You have to test the foreign key and constraint, and the null constraint on 1 column.

>    You will also need to create a table called Club_Time_Spent (student_id, time_in_minutes).
> This table also should have the foreign key constraints and the null constraints.
> You will need to do data wrangling to store the time in minutes.
> You will use this table in an SQL later.

# Q5:

> From the table in Q1 create the phone table (student_id, phone, phone_purpose) Phone_purpose can only be cell, work or home. Test the constraints using SQL and show the results. You have to test the foreign key constraint, and the constraint on the phone_purpose column.

# Q6: 

> For the Student table create a history table that stores the old student row with timestamp (Sysdate in Oracle) on update of student row, using a PL/SQL procedure. Test this by updating a student row and thus creating an entry in the student-history table. Show the before and after of the tables.

# Q7: 

> Create a View that shows the message-from (student), the message-to (student), their dobs, their phone and the message sent, and order by dob of message-from student. dob is a date column and not a string. Do a select from the View to show all the rows. dob should show as MM-DD-YYYY and phone-number should show in the format XXX-XXX-XXXX.

# Q8: 

> Using a Java Metadata program, show the metadata for the Student and Club tables only. There is no need to show the DB metadata, just the information for the 2 tables.

# Q9: 

> Using a Java program SQL inject the Student table and using a Java Prepared statement show that the SQL injection can be prevented. Show your work by running the prograqm and output.


# Q10. 

> Write an SQL query that shows all students, their dob, their cell phone numbers, the clubs they are members of and the total time they spent in the club in minutes. Test it in SQL developer, and then run it in Java and show the ResultSet metadata.


