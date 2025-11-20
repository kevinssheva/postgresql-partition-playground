DROP TABLE IF EXISTS user_events;

CREATE TABLE user_events (
  id BIGSERIAL PRIMARY KEY,
  user_id UUID NOT NULL,
  event_name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  payload JSONB
)
