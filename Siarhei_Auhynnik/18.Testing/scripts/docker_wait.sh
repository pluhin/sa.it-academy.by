#!/usr/bin/env bash
set -euo pipefail
URL="${1:-http://localhost:5000/}"
TIMEOUT="${2:-60}"

echo "Waiting for ${URL} up to ${TIMEOUT}s..."
end=$((SECONDS + TIMEOUT))
while [ $SECONDS -lt $end ]; do
  if curl -s -o /dev/null -w "%{http_code}" "$URL" | grep -Eq '^(2|3)[0-9][0-9]$'; then
    echo "Ready."
    exit 0
  fi
  sleep 2
done
echo "Timeout waiting for ${URL}"
exit 1
#
