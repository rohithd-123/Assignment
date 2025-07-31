CREATE TABLE People (  
    PersonID INT PRIMARY KEY,                  -- Unique ID for each person
    Name NVARCHAR(50),                         -- Person's name
    DOB DATE                                   -- Date of Birth
);  

INSERT INTO People (PersonID, Name, DOB) VALUES  
(1, 'Rohith', '2000-05-15'),                  -- Insert 3 values
(2, 'Vijay', '1990-10-20'),                   
(3, 'Varun', '1985-12-01');                   

SELECT   
    PersonID,                                  
    Name,                                     
    DOB,                                       
    DATEDIFF(YEAR, DOB, GETDATE())             -- Calculate year difference between DOB and today
    - CASE   
        WHEN DATEADD(YEAR, DATEDIFF(YEAR, DOB, GETDATE()), DOB) > GETDATE()   
        THEN 1 ELSE 0                          -- Subtract 1 if birthday has not happened yet this year
      END AS Age                               -- Final age
FROM People;                                   
