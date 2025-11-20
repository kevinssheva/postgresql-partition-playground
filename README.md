# PostgreSQL Partitioning Playground

A learning project demonstrating the performance benefits of table partitioning in PostgreSQL.

## Performance Results

Query: Count events in January 2025 from ~1M rows

| Metric             | Non-Partitioned               | Partitioned                 | Improvement       |
| ------------------ | ----------------------------- | --------------------------- | ----------------- |
| **Execution Time** | 77.753 ms                     | 5.238 ms                    | **14.8x faster**  |
| **Planning Time**  | 0.687 ms                      | 0.319 ms                    | 2.2x faster       |
| **Rows Scanned**   | 333,333 (full table)          | 42,693 (single partition)   | 87% reduction     |
| **Strategy**       | Parallel Seq Scan (3 workers) | Seq Scan (single partition) | Partition pruning |

### Key Takeaways

- **Partition Pruning**: Query only scans relevant partition (`user_events_2025_01`) instead of full table
- **Simpler Execution**: No parallelization needed due to smaller data set
- **Significant Speedup**: 15x faster for date-range queries on large tables

## Project Structure

```
schema/
  base_tables.sql          # Standard user_events table
  partitioned_tables.sql   # Range-partitioned by created_at (monthly)
queries/
  compare_partition.sql    # Performance comparison queries
data/
  seed_data.sql           # Sample data generator
```

## Setup

```bash
# Start PostgreSQL
docker-compose up -d

# Run seed data
psql -h localhost -U postgres -d partition_playground -f data/seed_data.sql

# Copy data to partitioned table
psql -h localhost -U postgres -d partition_playground -f helper/copy_data

# Run comparison query
psql -h localhost -U postgres -d partition_playground -f queries/compare_partition.sql 
```

## Partitioning Strategy

- **Type**: Range partitioning on `created_at` (TIMESTAMPTZ)
- **Granularity**: Monthly partitions
- **Key Point**: Partition key (`created_at`) must be in PRIMARY KEY
