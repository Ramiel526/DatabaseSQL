# PowerShell Commands and Symbolic Links Summary

## Directory Structure and Goal

You have the following directory structure:
- `C:\Database\sqlDev\DatabaseSQL`: Contains your SQL development work and is linked to a Git repository.
- `C:\dev\`: Contains various development folders including `cDev`, `javaDev`, `pythonDev`, and you want to link `sqlDev` here.

## Goal
You want to create a symbolic link from `C:\dev\sqlDev` to `C:\Database\sqlDev\DatabaseSQL` without disrupting your Git repository or filesystem.

## Steps and Commands

### 1. Remove the Existing `sqlDev` Directory
If the `sqlDev` directory already exists in `C:\dev`, it needs to be removed before creating the symbolic link.

```powershell
cd C:\dev
Remove-Item -Recurse -Force .\sqlDev
```

### 2\. Create a Symbolic Link Run the following command to create a symbolic link from `C:\dev\sqlDev` to `C:\Database\sqlDev\DatabaseSQL`.

```powershell 
New-Item -ItemType SymbolicLink -Path ".\sqlDev" -Target "C:\Database\sqlDev\DatabaseSQL"
```
### 3\. Administrator Privileges If you encounter an error requiring administrator privileges, you need to open PowerShell as an administrator: 1. Search for "PowerShell" in the Start menu. 2. Right-click on "Windows PowerShell" and select "Run as administrator." 3. Navigate to the `C:\dev` directory and create the symbolic link:

```powershell 
cd C:\dev
New-Item -ItemType SymbolicLink -Path ".\sqlDev" -Target "C:\Database\sqlDev\DatabaseSQL"
```

### 4\. Understanding the Use of `.` as the Path Using `.` as the path refers to the current directory, but when creating a symbolic link, you must specify the exact name of the symbolic link, not just `.`.


```powershell 
New-Item -ItemType SymbolicLink -Path ".\sqlDev" -Target "C:\Database\sqlDev\DatabaseSQL"
```

Final Structure --------------- After creating the symbolic link, `C:\dev\sqlDev` now points to `C:\Database\sqlDev\DatabaseSQL`. You can access your SQL development files from both paths without duplicating data or disrupting your Git repository. Notes ----- * **Symbolic Link vs. Hard Link**: Symbolic links are like shortcuts and can point to directories or files. Hard links are for files and cannot be created 
