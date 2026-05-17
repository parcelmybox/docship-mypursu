#!/usr/bin/env bash
set -euo pipefail

# Run from services/docship/
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

VENV_DIR="./env"

if [ ! -d "$VENV_DIR" ]; then
  python3 -m venv "$VENV_DIR"
fi

# shellcheck source=/dev/null
source "$VENV_DIR/bin/activate"

pip install --upgrade pip
pip install -r requirements.txt

LOG="server.log"
python app.py > "$LOG" 2>&1 &
PID=$!
echo "Started flask server (PID: $PID), logging to $LOG"

# wait for server to respond
MAX_TRIES=15
for i in $(seq 1 $MAX_TRIES); do
  sleep 1
  HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Content-Type: application/json" -d '{"shipment":"PING-000"}' http://127.0.0.1:5000/ship_validate || echo "000")
  if [ "$HTTP_CODE" = "200" ]; then
    echo "Server is ready"
    break
  fi
  echo "Waiting for server... ($i/$MAX_TRIES)"
  if [ "$i" -eq "$MAX_TRIES" ]; then
    echo "Server failed to start in time. See $LOG"
    kill "$PID" || true
    exit 1
  fi
done

# run tests
pytest -q tests
TEST_EXIT=$?

# teardown
kill "$PID" || true
exit $TEST_EXIT