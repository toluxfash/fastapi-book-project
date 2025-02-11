#!/bin/bash
# Start Nginx in the background. Using "daemon off" ensures it logs to stdout.
nginx -g "daemon off;" &

# Start Uvicorn in the foreground. The 'exec' replaces the shell with uvicorn,
# so that if uvicorn exits, the container stops.
exec uvicorn main:app --host 0.0.0.0 --port 8000
