Login to SQL*Plus:

The command sqlplus sys as sysdba is used to log into SQL*Plus as a user with DBA privileges (SYS). This is essential when managing Oracle databases, including tasks like creating or deleting PDBs.
![image](https://github.com/user-attachments/assets/9af3bdee-834e-4196-b7a0-caa15360afa8)
Create a PDB:Open the PDB:

The command CREATE PLUGGABLE DATABASE plsql_class2024db ... creates a new pluggable database (PDB) named plsql_class2024db. Key components of the command include:
ADMIN USER ti_plsqlauca IDENTIFIED BY titus123: Specifies the creation of an administrative user named ti_plsqlauca with the password titus123 for managing the PDB.
FILE_NAME_CONVERT: This parameter specifies how to convert the file paths of the data files for the new PDB. The first path is the source (template) file, and the second is the destination file for the new PDB.
![image](https://github.com/user-attachments/assets/d48bb171-eb5b-41d1-950f-a3c3617ff023)

Open the PDB:

The command ALTER PLUGGABLE DATABASE plsql_class2024db OPEN is used to open the newly created PDB, making it accessible for use.
![image](https://github.com/user-attachments/assets/e4a5574f-2984-4dc6-8df4-ec7e381e4b61)

Create a User:

CREATE USER ti_plsqlauca IDENTIFIED BY titus123; creates a new user in the pluggable database.
The GRANT CONNECT, RESOURCE TO ti_plsqlauca; command grants basic privileges to the user. The CONNECT role allows login, while RESOURCE provides limited object creation privileges.
![image](https://github.com/user-attachments/assets/6f0b9d76-c703-406b-8df2-1cd60bf3aa3a)
![image](https://github.com/user-attachments/assets/62ef84a5-6925-4025-8470-7371f5e9d0a3)


Here's the description of the commands and tasks you've shared:

Task 1: Create a New Pluggable Database (PDB)
Login to SQL*Plus:

The command sqlplus sys as sysdba is used to log into SQL*Plus as a user with DBA privileges (SYS). This is essential when managing Oracle databases, including tasks like creating or deleting PDBs.
Create a PDB:

The command CREATE PLUGGABLE DATABASE plsql_class2024db ... creates a new pluggable database (PDB) named plsql_class2024db. Key components of the command include:
ADMIN USER ti_plsqlauca IDENTIFIED BY titus123: Specifies the creation of an administrative user named ti_plsqlauca with the password titus123 for managing the PDB.
FILE_NAME_CONVERT: This parameter specifies how to convert the file paths of the data files for the new PDB. The first path is the source (template) file, and the second is the destination file for the new PDB.
Open the PDB:

The command ALTER PLUGGABLE DATABASE plsql_class2024db OPEN is used to open the newly created PDB, making it accessible for use.
Create a User:

CREATE USER ti_plsqlauca IDENTIFIED BY titus123; creates a new user in the pluggable database.
The GRANT CONNECT, RESOURCE TO ti_plsqlauca; command grants basic privileges to the user. The CONNECT role allows login, while RESOURCE provides limited object creation privileges.
Task 2: Create and Delete a Pluggable Database (PDB)
Create another PDB:

Similar to Task 1, the command CREATE PLUGGABLE DATABASE ti_to_delete_pdb creates another PDB named ti_to_delete_pdb with the same administrative user (ti_plsqlauca) and password (titus123). This PDB is intended to be deleted later.
![image](https://github.com/user-attachments/assets/3cf2d4ef-ca31-4789-bf92-07e7987848c5)

Open the PDB:

The command ALTER PLUGGABLE DATABASE ti_to_delete_pdb OPEN opens the new PDB, making it available for use.
![image](https://github.com/user-attachments/assets/e761eb14-4ae4-48cd-8ad2-af91cb951461)
Delete the PDB:

The command ALTER PLUGGABLE DATABASE ti_to_delete_pdb CLOSE IMMEDIATE closes the PDB immediately, disconnecting any sessions connected to it.
DROP PLUGGABLE DATABASE ti_to_delete_pdb INCLUDING DATAFILES completely removes the PDB and its associated data files from the Oracle environment.
![image](https://github.com/user-attachments/assets/935a9734-c135-4046-857e-21334e46903b)

Task 3: Configure Oracle Enterprise Manager (OEM)
Launch OEM:

Oracle Enterprise Manager (OEM) is a graphical management tool used to monitor and administer Oracle databases. Launching OEM will allow you to interact with and manage your databases via a user-friendly interface.
Navigate to the PDBs section:

Once in OEM, navigate to the section that lists the available PDBs. Before deletion, both plsql_class2024db and ti_to_delete_pdb should be visible in the list.
screenshots:

![image](https://github.com/user-attachments/assets/f0390ea2-e566-4f60-b17a-660f342324d1)
![image](https://github.com/user-attachments/assets/091b4718-93eb-4894-9381-2231f499bbf5)





