#!/bin/bash
# ========================================
# System Health Check Script
# File: healthcheck.sh
# ========================================


# Output log file
LOGFILE="healthlog.txt"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

# Write header
{
echo "========================================"
echo " System Health Check - $TIMESTAMP"
echo "========================================"
echo ""

# 1️ System Date and Time
echo "1. System Date and Time:"
date
echo ""

# 2️ System Uptime
echo "2. System Uptime:"
uptime -p
echo ""

# 3️ CPU Load
echo "3. CPU Load (from uptime):"
uptime
echo ""

# 4️ Memory Usage
echo "4. Memory Usage (free -m):"
free -m
echo ""

# 5️ Disk Usage
echo "5. Disk Usage (df -h):"
df -h
echo ""

# 6️ Top 5 Memory-Consuming Processes
echo "6. Top 5 Memory-Consuming Processes:"
ps aux --sort=-%mem | head -n 6
echo ""

# 7️ Check if services are running
echo "7. Service Status Check:"
for service in nginx ssh; do
    if systemctl is-active --quiet "$service"; then
        echo "$service:  RUNNING"
    else
        echo "$service:  NOT RUNNING"
    fi
done
echo ""

# Footer
echo " Health check completed at: $TIMESTAMP"
echo "========================================"
echo ""

} >> "$LOGFILE"

# Confirmation message
echo " Health report saved to $LOGFILE"
