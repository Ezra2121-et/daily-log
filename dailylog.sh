#!/bin/bash

# Define the directory where logs will be stored
LOG_DIR="$HOME/daily-logs"
mkdir -p "$LOG_DIR"

# Get today's date in YYYY-MM-DD format
TODAY=$(date +"%Y-%m-%d")
LOG_FILE="$LOG_DIR/$TODAY.md"

# Check if today's log already exists
if [ -f "$LOG_FILE" ]; then
    echo "Log for today already exists at: $LOG_FILE"
else
    # Create the log file with a nice template
    cat << EOF > "$LOG_FILE"
# Daily Log - $TODAY

## 🕒 Created At
$(date +"%Y-%m-%d %H:%M:%S")

## 🚀 Today's Goals & Tasks
- [ ] Task 1
- [ ] Task 2

## 📝 Notes & Thoughts
- 

## 🚧 Blockers / Issues
- None

## ✨ Wins / Accomplishments
- 
EOF
    echo "Created new daily log at: $LOG_FILE"
fi

# Open the file in your default editor (optional, works on macOS and Linux)
if command -v code &> /dev/null; then
    code "$LOG_FILE"
elif command -v nano &> /dev/null; then
    nano "$LOG_FILE"
fi
