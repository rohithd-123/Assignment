-- Declare input string with mixed characters
DECLARE @input NVARCHAR(100) = 'YRY8308HVYG7T4';

-- Declare output variable to store extracted numbers
DECLARE @ans NVARCHAR(100) = '';

-- Declare loop counter starting at 1
DECLARE @i INT = 1;

-- Get length of input string
DECLARE @len INT = LEN(@input);

-- Variable to hold each character
DECLARE @char NCHAR(1);

-- Loop through each character in the input string
WHILE @i <= @len
BEGIN
    -- Get the current character
    SET @char = SUBSTRING(@input, @i, 1);

    -- If the character is a digit, add it to the output
    IF @char LIKE '[0-9]'
        SET @ans = @ans + @char;

    -- Move to the next character
    SET @i = @i + 1;
END

-- Output the final extracted numbers
SELECT @ans;
