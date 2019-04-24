--Execute each chunk as it's own standalone demonstration.
--Creates a scalar value function with one input parameter
CREATE OR ALTER FUNCTION foo (@bar int)
RETURNS numeric 
AS 
	BEGIN
	RETURN
	(SELECT @bar + 1)
	END

DECLARE @bar AS INT = 1
SELECT dbo.foo(@bar)

DECLARE @bar INT = 1
DECLARE @plusone INT
SELECT @plusone = dbo.foo(@bar)
SELECT @plusone

-- EXEC & store result in variable
DECLARE @plusone AS numeric
EXEC @plusone = dbo.foo @bar = 1
SELECT 'Foo Results:', @plusone

--Look at the function to see if it's deterministic(1) or nondeterministic(0)
SELECT OBJECTPROPERTY(OBJECT_ID('[dbo].[foo]'),'IsDeterministic')

--*************
--Creates a scalar value function with two input parameters
CREATE FUNCTION [dbo].[MyScalarFunction]
  ( @param1 int, @param2 int )
RETURNS INT
AS
BEGIN
    RETURN @param1 + @param2
END

DECLARE @param1 INT
DECLARE @param2 INT
SET @param1 = 1
SET @param2 = 2
SELECT dbo.MyScalarFunction(@param1, @param2)

--Create a table value UDF
CREATE FUNCTION TableFunction(@StartDate AS datetime)
-- Specify return data type
RETURNS TABLE
AS
RETURN
SELECT
	StartStation,
    -- Use COUNT() to select RideCount
	COUNT(ID) AS RideCount,
    -- Use SUM() to calculate TotalDuration
    SUM(DURATION) AS TotalDuration
FROM CapitalBikeShare
WHERE CAST(StartDate as Date) = @StartDate
-- Group by StartStation
GROUP BY StartStation;