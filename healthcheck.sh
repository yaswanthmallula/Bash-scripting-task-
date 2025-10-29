#!/bin/bash
# ========================================
# System Health Check Script
# File: healthcheck.sh
# ========================================

# Output log file
LOGFILE="healthlog.txt"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Header
echo "========================================" >> healthlog.txt
echo "System Health Check - $TIMESTAMP" >> healthlog.txt
echo "========================================" >> healthlog.txt

# 1. System Date and Time
echo "1. System Date and Time:" >> healthlog.txt
date >> healthlog.txt

# 2. System Uptime
echo "2. System Uptime:" >> healthlog.txt
uptime -p >> healthlog.txt
echo "" >> healthlog.txt

# 3. CPU Load
echo "3. CPU Load (from uptime):" >> healthlog.txt
uptime >> healthlog.txt
echo "" >> healthlog.txt

# 4. Memory Usage
echo "4. Memory Usage (free -m):" >> healthlog.txt
free -m >> healthlog.txt


# 5. Disk Usage
echo "5. Disk Usage (df -h):" >> healthlog.txt
df -h >> healthlog.txt


# 6. Top 5 Memory-Consuming Processes
echo "6. Top 5 Memory-Consuming Processes:" >> healthlog.txt
ps aux --sort=-%mem | head -n 6 >> healthlog.txt
echo "" >> healthlog.txt

# 7. Check if services are running
echo "7. Service Status Check:" >> healthlog.txt
for service in nginx ssh; do
    if systemctl is-active --quiet $service; then
        echo "$service: RUNNING" >> healthlog.txt
    else
        echo "$service: NOT RUNNING" >> healthlog.txt
    fi
done
echo "" >> healthlog.txt

# Footer
echo "Health check completed at: $TIMESTAMP" >> healthlog.txt
echo "========================================" >> healthlog.txt

