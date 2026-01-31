-- Returns existing recordnumber if record exists,
-- otherwise generates the next sequential recordnumber
SELECT COALESCE(
    (SELECT TOP 1 recordnumber
     FROM myform
     WHERE primarykey = @input),
    (SELECT ISNULL(MAX(recordnumber), 0) + 1
     FROM myform)
) AS recordnumber;
