INSERT INTO user_events_partitioned (id, user_id, event_name, created_at, payload)
SELECT id, user_id, event_name, created_at, payload
FROM user_events;
