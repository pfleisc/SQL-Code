/* TO convert a datetime from one timezone to another, and not have to worry if the starting datetime is Daylight or Standard time
use the following*/

Select  FROM_TZ(CURRENT_TIMESTAMP, 'GMT') AT TIME ZONE 'America/Los_Angeles' as GMT_to_PacificTime
From    DUAL;

/* You can use the following if you know if the data is Daylight or Standard time */

Select  NEW_TIME(CURRENT_TIMESTAMP, 'GMT', 'PST') as GMT_to_Pacific_StandardTime
From    DUAL;

Select  NEW_TIME(CURRENT_TIMESTAMP, 'GMT', 'PDT') as GMT_to_Pacific_DaylightTime
From    DUAL;
