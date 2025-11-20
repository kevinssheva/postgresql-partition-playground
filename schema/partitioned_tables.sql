CREATE TABLE user_events_partitioned (
  id BIGSERIAL,
  user_id UUID NOT NULL,
  event_name TEXT NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  payload JSONB,
  PRIMARY KEY (id, created_at)
) PARTITION BY RANGE (created_at);

CREATE TABLE user_events_2024_01
  PARTITION OF user_events_partitioned
  FOR VALUES FROM ('2024-01-01') TO ('2024-02-01');

CREATE TABLE user_events_2024_02
  PARTITION OF user_events_partitioned
  FOR VALUES FROM ('2024-02-01') TO ('2024-03-01');

CREATE TABLE user_events_2025_01
  PARTITION OF user_events_partitioned
  FOR VALUES FROM ('2025-01-01') TO ('2025-02-01');

CREATE TABLE user_events_2025_02
  PARTITION OF user_events_partitioned
  FOR VALUES FROM ('2025-02-01') TO ('2025-03-01');

CREATE TABLE user_events_default
  PARTITION OF user_events_partitioned
  DEFAULT;
