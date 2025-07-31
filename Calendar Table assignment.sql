CREATE TABLE Calendar (  
    Cnt INT IDENTITY(0,1),                      -- Identity column starting at 0, incrementing by 1 for each row
    CalDate AS DATEADD(DAY, Cnt, '2017-01-01'),  -- Computed column: adds Cnt days to base date to get calendar date
    CalDOY AS DATEPART(DAYOFYEAR, DATEADD(DAY, Cnt, '2017-01-01')), -- Day of year for CalDate
    CalWeek AS DATEPART(WEEK, DATEADD(DAY, Cnt, '2017-01-01')),     -- Week number for CalDate
    CalDOW AS DATEPART(WEEKDAY, DATEADD(DAY, Cnt, '2017-01-01')),   -- Day of week for CalDate
    CalMonth AS DATEPART(MONTH, DATEADD(DAY, Cnt, '2017-01-01')),   -- Month number for CalDate
    CalDOM AS DATEPART(DAY, DATEADD(DAY, Cnt, '2017-01-01'))        -- Day of month for CalDate
);  

DECLARE @StartDate DATE = '2017-01-01';        -- Define start date of calendar
DECLARE @EndDate DATE = '2018-01-01';          -- Define end date of calendar

DECLARE @Days INT = DATEDIFF(DAY, @StartDate, @EndDate); -- Calculate number of days between start and end date

DECLARE @Cnt INT = 0;                           -- Initialize counter to 0

WHILE @Cnt < @Days                              -- Loop until counter reaches total number of days
BEGIN
    INSERT INTO Calendar DEFAULT VALUES;        -- Insert row (Cnt auto-increments), computed columns generate date parts
    SET @Cnt += 1;                              -- Increment counter
END

Select * from Calendar;                         -- Display all rows in Calendar table