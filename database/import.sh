#!/bin/bash
# script for automatic import for docker container (docker-entrypoint-initdb.d)

set -e

echo "▶ Import schema..."
for f in /docker-entrypoint-initdb.d/schema/*.sql; do
  echo "  -> $f"
  mysql "$MYSQL_DATABASE" < "$f"
done

echo "▶ Import data..."
for f in /docker-entrypoint-initdb.d/data/*.sql; do
  echo "  -> $f"
  mysql "$MYSQL_DATABASE" < "$f"
done

echo "✅ Import done"
