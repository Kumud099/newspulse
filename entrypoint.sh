#!/bin/sh

set -e

echo "Waiting for PostgreSQL..."

until pg_isready -h postgres -p 5432 -U "$POSTGRES_USER"; do
  sleep 1
done

echo "PostgreSQL started"

if [ "$RUN_MIGRATIONS" = "true" ]; then
  echo "Running migrations..."
  uv run alembic upgrade head
fi

echo "Starting application..."

exec "$@"