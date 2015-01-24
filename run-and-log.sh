#!/bin/sh
set -e

# -------------------------------------
# Runs a speedtest and saves the result
# with date and time to a log file.
# -------------------------------------

# Init
SCRIPTPATH="$(dirname $0)/speedtest_cli.py"
LOG_FILE=$1

echo "Running speedtest..."
OUTPUT=$(python $SCRIPTPATH --simple)

# Fetch ping, download and upload speeds from output
PING=$(echo "$OUTPUT" | grep Ping | sed 's/[a-zA-Z:]* \([0-9]*\.[0-9]*\) [a-zA-Z/]*/\1/')
DOWNLOAD=$(echo "$OUTPUT" | grep Download | sed 's/[a-zA-Z:]* \([0-9]*\.[0-9]*\) [a-zA-Z/]*/\1/')
UPLOAD=$(echo "$OUTPUT" | grep Upload | sed 's/[a-zA-Z:]* \([0-9]*\.[0-9]*\) [a-zA-Z/]*/\1/')

# Fetch date and time at logging time (not script start time)
DATETIME=$(date '+%Y-%m-%d %H:%M:%S')

# Write data to log file
echo "$DATETIME,$PING,$DOWNLOAD,$UPLOAD" >> $LOG_FILE
echo "...aaand done! :)"
