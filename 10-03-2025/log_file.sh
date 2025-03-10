#!/bin/bash

# Log file to store memory usage
LOG_FILE="memory-log.txt"

# Function to check memory usage
check_memory() {
    # Get memory usage information
    current_time=$(date +"%Y-%m-%d %H:%M:%S")
    memory_usage=$(free -h)
    top_usage=$(top -n 1 | grep -i "mem")

    # Log memory usage to file
    echo "Timestamp: $current_time" >> $LOG_FILE
    echo "Memory Usage from 'free' command:" >> $LOG_FILE
    echo "$memory_usage" >> $LOG_FILE
    echo "Memory Usage from 'top' command:" >> $LOG_FILE
    echo "$top_usage" >> $LOG_FILE
    echo "----------------------------------------------------" >> $LOG_FILE
}

# Run the function every 10 seconds indefinitely
while true; do
    check_memory
    sleep 10  # Wait for 10 seconds before checking again
done

