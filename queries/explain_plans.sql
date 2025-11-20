EXPLAIN ANALYZE
SELECT count(*)
FROM user_events
WHERE created_at >= '2025-01-01'
  AND created_at < '2025-02-01';

EXPLAIN ANALYZE
SELECT count(*)
FROM user_events
WHERE user_id = (SELECT user_id FROM user_events LIMIT 1);
