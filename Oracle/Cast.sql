/*
To covert a column to a new data type that might cause an error, use the following 
*/

Select  CAST(Column_as_VARCHAR as DECIMAL(17,2) DEFAULT NULL ON CONVERSION ERROR) as Column_as_DECIMAL
From    DUAL;

/* without the 'on conversion error' the query will end with an error if the conversion fails on a row */