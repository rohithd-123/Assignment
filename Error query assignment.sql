-- Create a table named ETest with three columns
CREATE TABLE ETest (
    ID INT,                                   -- Regular integer column
    Name VARCHAR(50),                         -- Name column with up to 50 characters
    ErrorCol AS (ID/0)                        -- Computed column that divides ID by zero (will cause error if selected)
);

-- Insert two rows into ETest table
INSERT INTO ETest (ID, Name) VALUES (1, 'Rohith'),(2,'Vijay');

-- Safe: Select only ID and Name columns (does not access ErrorCol)
SELECT ID, Name FROM ETest;

-- Will fail: SELECT * includes ErrorCol, so this throws divide by zero error
SELECT * FROM ETest;

-- Will fail: Directly selecting ErrorCol also throws divide by zero error
SELECT ErrorCol FROM ETest;
