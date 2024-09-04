# Importing Data in SQL 

> To import data compatible of comparable data formats (e.g. CSV, excel(.xls), etc...) or otherwise compatible with SQL database import capabilities
> data importing involves transferring data from external files into a SQL database. This evoles a file spreadsheet into a managable seed for starting a database. 

## First steps 

1. Prepare data
    - check data for consistency, correctness, and completeness.
    - check format can be imported into SQL database
2. Create target table
   - Define the schema; the resulting table in the SQL database where the data will be imported must be created with the appropriate cloumns and data types that match the structure of the incoming data. 

```SQL
CREATE TABLE USER_TABLE (
first_name VARCHAR2(50),
last_name VARCHAR2(50),
weight FLOAT,
age INTEGER 
);
```

### Using LOAD DATA INFILE
```SQL
LOAD DATA INFILE '<path/to/your/file>.csv'
INTO TABLE your_table
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(first_name, last_name, weight, age);
```

### Using a GUI (SQL Developer):

    File Selection: Choose your CSV file to be imported.
    Mapping Columns: Match the CSV columns with the table columns.
    Final Import: Review and execute the import process.

### Using SQL Commands 

> Load data with SQLLDR
> SQL*Loader in Oracle
>   - SQL*Loader is a utility for build loading data into an Oracle databases
>   - create a control file that describes how to load the dtak then run the SQL*Loader command.

### Handling Common Issues

> Data type mismatch: Ensure that the data types in the file match those in the table schema
> Missing Values Hanldle 'NULL' values properly if your file conntains missing data
> Encodeing Issues: Make sure the file enocdig (UTF-8 etc...) is compatiple with the database

