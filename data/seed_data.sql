INSERT INTO user_events (user_id, event_name, created_at, payload)
SELECT
  gen_random_uuid(),
  ('event_' || (1 + (random() * 10)::int))::text,
  timestamp '2024-01-01' + (random() * interval '730 days'),
  jsonb_build_object('meta', gen_random_uuid()::text)
FROM generate_series(1, 1_000_000) AS s(i);
