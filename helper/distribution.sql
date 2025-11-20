SELECT tableoid::regclass AS partition, count(*)
FROM user_events_partitioned
GROUP BY 1
ORDER BY 1;
