Microsoft Windows [Version 10.0.22631.4169]
(c) Microsoft Corporation. All rights reserved.

C:\Users\PC>sqlplus / as sysdba

SQL*Plus: Release 21.0.0.0.0 - Production on Thu Oct 3 19:56:54 2024
Version 21.3.0.0.0

Copyright (c) 1982, 2021, Oracle.  All rights reserved.


Connected to:
Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production
Version 21.3.0.0.0

SQL> SELECT file_name FROM dba_data_files WHERE tablespace_name='SYSTEM';

FILE_NAME
--------------------------------------------------------------------------------
C:\APP\PC\PRODUCT\21C\ORADATA\XE\SYSTEM01.DBF

SQL> CREATE PLUGGABLE DATABASE plsql_class2024db
  2  ADMIN USER <your_username> IDENTIFIED BY <your_password>
  3  FILE_NAME_CONVERT = ('C:\APP\PC\PRODUCT\21C\ORADATA\XE', 'C:\APP\PC\PRODUCT\21C\ORADATA\plsql_class2024db');
ADMIN USER <your_username> IDENTIFIED BY <your_password>
           *
ERROR at line 2:
ORA-65001: missing or invalid administrative user name


SQL> CREATE PLUGGABLE DATABASE plsql_class2024db
  2  ADMIN USER ti_plsqlauca IDENTIFIED BY titus123
  3  FILE_NAME_CONVERT = ('C:\APP\PC\PRODUCT\21C\ORADATA\XE', 'C:\APP\PC\PRODUCT\21C\ORADATA\plsql_class2024db');

Pluggable database created.

SQL>
SQL> ADMIN USER ti_plsqlauca IDENTIFIED BY titus123;
SP2-0734: unknown command beginning "ADMIN USER..." - rest of line ignored.
SQL> CREATE PLUGGABLE DATABASE ti_to_delete_pdb
  2  ADMIN USER ti_plsqlauca IDENTIFIED BY titus123
  3  FILE_NAME_CONVERT = ('C:\APP\PC\PRODUCT\21C\ORADATA\XE', 'C:\APP\PC\PRODUCT\21C\ORADATA\ti_to_delete_pdb');

Pluggable database created.

SQL> ALTER PLUGGABLE DATABASE plsql_class2024db OPEN;

Pluggable database altered.

SQL> CREATE USER ti_plsqlauca IDENTIFIED BY titus123;
CREATE USER ti_plsqlauca IDENTIFIED BY titus123
            *
ERROR at line 1:
ORA-65096: invalid common user or role name


SQL> SHOW PDBS;

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 XEPDB1                         READ WRITE NO
         4 PLSQL_CLASS2024DB              READ WRITE NO
         5 TI_TO_DELETE_PDB               MOUNTED
SQL> ALTER SESSION SET CONTAINER = plsql_class2024db;

Session altered.

SQL> CREATE USER ti_plsqlauca IDENTIFIED BY titus123;
CREATE USER ti_plsqlauca IDENTIFIED BY titus123
            *
ERROR at line 1:
ORA-01920: user name 'TI_PLSQLAUCA' conflicts with another user or role name


SQL> CREATE USER ti_plsqlauca IDENTIFIED BY titus123;
CREATE USER ti_plsqlauca IDENTIFIED BY titus123
            *
ERROR at line 1:
ORA-01920: user name 'TI_PLSQLAUCA' conflicts with another user or role name


SQL> GRANT CONNECT, RESOURCE TO ti_plsqlauca;

Grant succeeded.

SQL> ALTER PLUGGABLE DATABASE ti_to_delete_pdb OPEN;
ALTER PLUGGABLE DATABASE ti_to_delete_pdb OPEN
*
ERROR at line 1:
ORA-65118: operation affecting a pluggable database cannot be performed from
another pluggable database


SQL> ALTER SESSION SET CONTAINER = CDB$ROOT;

Session altered.

SQL> ALTER PLUGGABLE DATABASE ti_to_delete_pdb OPEN;

Pluggable database altered.

SQL> ALTER PLUGGABLE DATABASE ti_to_delete_pdb CLOSE IMMEDIATE;

Pluggable database altered.

SQL> DROP PLUGGABLE DATABASE ti_to_delete_pdb INCLUDING DATAFILES;

Pluggable database dropped.

SQL> emctl status dbconsole
SP2-0734: unknown command beginning "emctl stat..." - rest of line ignored.
SQL> SELECT dbms_xdb_config.gethttpsport() AS https_port FROM dual;

HTTPS_PORT
----------
      5500

SQL> SHOW PDBS;

    CON_ID CON_NAME                       OPEN MODE  RESTRICTED
---------- ------------------------------ ---------- ----------
         2 PDB$SEED                       READ ONLY  NO
         3 XEPDB1                         READ WRITE NO
         4 PLSQL_CLASS2024DB              READ WRITE NO
SQL>