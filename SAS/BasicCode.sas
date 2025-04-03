data MyClass; /* This will create a table called MyClass */
    set sashelp.class; /* The data source used to create the new table */
    heightcm=height*2.54; /* add a new column called heightcm (Referred to as the assignment step) */
run;

proc print data=MyClass; /* View the data created by the previous step */
run;

proc means data=myclass; /*  */
    var age heightcm;
run;

