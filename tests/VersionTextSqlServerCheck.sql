-- Run against a test database after applying the new migrations.
SET NOCOUNT ON;
DECLARE @Cases TABLE (A nvarchar(max), B nvarchar(max), Expected int);
INSERT INTO @Cases VALUES
(N'1.9', N'1.10', -1), (N'9', N'10', -1),
(N'1.10', N'1.9', 1), (N'1.1', N'1.1', 0),
(N'1.1.9', N'1.1.10', -1), (N'2', N'1.9999', 1);
IF EXISTS (SELECT 1 FROM @Cases WHERE duimp.CompararVersoes(A, B) <> Expected)
    THROW 51000, 'Version comparison regression.', 1;
IF duimp.CompararVersoes(REPLICATE(CONVERT(nvarchar(max), N'9'), 9999), N'10') <> 1
    THROW 51001, 'Long numeric version comparison regression.', 1;
PRINT 'PASS: dotted and 9999-character version comparisons';