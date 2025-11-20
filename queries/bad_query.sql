-- Bad query using date() function on partitioned table
EXPLAIN ANALYZE
SELECT count(*)
FROM user_events_partitioned
WHERE date(created_at) = '2025-01-15';

-- Good query without using date() function on partitioned table
EXPLAIN ANALYZE
SELECT count(*)
FROM user_events_partitioned
WHERE created_at >= '2025-01-15'
  AND created_at < '2025-01-16';
