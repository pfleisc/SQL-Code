/* Basic commands */
SELECT  column1, TRY_PARSE(VARCHAR_column2 as BIGINT) as VARCHAR_to_BIGINT
FROM    schema.tablename
WHERE   column1 = 'some text'
ORDER BY column2