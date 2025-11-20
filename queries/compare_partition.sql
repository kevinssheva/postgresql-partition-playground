-- Non partitioned
EXPLAIN ANALYZE
SELECT count(*)
FROM user_events
WHERE created_at >= '2025-01-01'
  AND created_at < '2025-02-01';

-- Partitioned
EXPLAIN ANALYZE
SELECT count(*)
FROM user_events_partitioned
WHERE created_at >= '2025-01-01'
  AND created_at < '2025-02-01';
