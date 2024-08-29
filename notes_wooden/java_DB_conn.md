# Test DB Connection
--- 

## Setup
- set class vars to include 'PATH' to JAR file

### Java 
> - Change Oracle DB username and password in *.java file
```Java
import java.sql.*;

public class TestDBConnection {

// Java program to test a connection to a database

	public static void main (String[] args) {


		try {

			Class.forName("oracle.jdbc.OracleDriver");
			System.out.println("Driver loaded");

    		        String url="jdbc:oracle:thin:@localhost:1521:xe";
    		        String user = "testuser";
    		        String pwd = "win11";

			Connection DB_mobile_conn = DriverManager.getConnection(url,user,pwd);
			System.out.println("Database Connect ok");

			DB_mobile_conn.close();

        	} catch (Exception exp){
			System.out.println("Exception = "+exp);
		}
	}
}
```
### Run!
> Compile and Execute...
```Powershell
PS C:\dev\javaDev> javac TestDBConnection1.java
# check for creation of *.class file
PS C:\dev\javaDev> gci .\TestDBConnection1.class

    Directory: C:\dev\javaDev

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---           8/22/2024 11:50 PM           1438 TestDBConnection1.class

# Set classpath and run java file
PS C:\dev\javaDev> java -cp ".;C:\dev\javaDev\ojdbc7.jar" TestDBConnection1
Driver loaded
Database Connect ok
```


