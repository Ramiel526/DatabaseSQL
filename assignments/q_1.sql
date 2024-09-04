-- Load data from excel from given *.csv
-- Use sqlDev show all steps

create table testData (name, dob, phone, phone_purpose, club, club_hours_spent, message_to, message);

load data infile 'C:\Database\sqlDev\table_files\TestingData.csv'
into table testData
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
(name, dob, phone, phone_purpose, club, club_hours_spent, message_to, message);
--show loaded table
--select * from testData;

