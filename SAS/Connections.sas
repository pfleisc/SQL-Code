/*
    First encrypt your password by running the following command: 
    PROC PWENCODE IN='YourPasswordHere' METHOD=sasenc;run;

    Check your Log tab for a line that starts with {SASENC} and will have a long string of characters ex. {SASENC}35A5DF2106485D4602604860360CB3B60D0B47621A34A83E313EBB33
    Copy this line of text to use in the variable below.

    Setup your username and password in Options > SAS Programs > Submit SAS code when server is connected; add the following
    %LET LAN_user="your_lan_id"
    %LET oracle_password="%STR({SASENC}35A5DF2106485D4602604860360CB3B60D0B47621A34A83E313EBB33)";
*/
proc sql;
    CONNECT TO ORACLE (
        path="(
            DESCRIPTION=
                (ADDRESS =      (PROTOCOL = TCP) 
                                (HOST = subdomain.domain.com) 
                                (PORT = 3202))
                (CONNECT_DATA = (SERVICE_NAME=enter_service_name)))"
        user=&LAN_user 
        password=&oracle_password
    );

    CREATE TABLE WORK.TableName AS SELECT * FROM CONNECTION TO ORACLE (
        Select  *
        From    OracleTableName
    ); 
    
    DISCONNECT FROM ORACLE;
QUIT;