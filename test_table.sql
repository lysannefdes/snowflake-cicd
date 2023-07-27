-- test_table.sql
-- Test if the 'test_table' exists
SELECT COUNT(*) AS table_exists
FROM information_schema.tables
WHERE table_schema = 'SNOWFLAKE_CICD'
  AND table_name = 'test_new_table';

-- Test if the 'test_table' has the expected columns
SELECT
  CASE
    WHEN COUNT(*) = 2 THEN 'PASSED'
    ELSE 'FAILED'
  END AS column_count
FROM information_schema.columns
WHERE table_schema = 'SNOWFLAKE_CICD'
  AND table_name = 'test_new_table'
  AND column_name IN ('id', 'name');
