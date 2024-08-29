# Java
## Hello World! 

```Java
public class HelloWorld {

    public static void main(String[] args) {
        // Prints "Hello, World" to the terminal window.
        System.out.println("Hello, World!");
    }

}
```
## Powershell commands 
> - compile java source code with javac 
> - follow up with checking for the *.class file 
> - run the java program 

```Powershell
PS C:\dev\javaDev> javac .\HelloWorld.java
PS C:\dev\javaDev> gci

    Directory: C:\dev\javaDev

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---           8/22/2024 10:32 PM            427 HelloWorld.class
-a---           8/22/2024 10:29 PM            191 HelloWorld.java
-a---           8/22/2024  9:41 PM            650 TestDBConnection.java
-a---           8/22/2024  9:41 PM           2054 TestDBSelectQuery.java
-a---           8/22/2024  9:41 PM           2756 TestDBUpdateQuery.java

PS C:\dev\javaDev> java HelloWorld
Hello, World!
PS C:\dev\javaDev>
```
