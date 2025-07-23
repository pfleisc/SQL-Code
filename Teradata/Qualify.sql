/* Use qualify to limit a result set based on a windowed function */
Create multiset volatile table tmp (
    ID INT,
    DataValue VARCHAR(20),
    DataTime TIMESTAMP
) ON COMMIT PRESERVE ROWS;

INSERT INTO tmp Values(1, 'A', '2025-01-15 13:45:00');
INSERT INTO tmp Values(2, 'A', '2025-01-16 13:45:00');
INSERT INTO tmp Values(3, 'A', '2025-01-17 13:45:00');
INSERT INTO tmp Values(4, 'B', '2025-01-18 13:45:00');
INSERT INTO tmp Values(5, 'B', '2025-01-19 13:45:00');
INSERT INTO tmp Values(6, 'B', '2025-01-20 13:45:00');

Select  ID, DataValue, DataTime, ROW_NUMBER() OVER(Partition By DataValue ORDER BY DataTime DESC) as MostRecent
From    tmp
Qualify MostRecent = 1;
/* Returns the following
ID  DataValue   DataTime            MostRecent
3   A           2025-01-17 13:45:00 1
6   B           2025-01-20 13:45:00 1
*/