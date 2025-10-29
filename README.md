# System Health Check Script

# Project Explanation
The **System Health Check Script** is a Bash script that helps monitor the health and performance of a Linux system.  
It collects important system details like date, uptime, CPU load, memory usage, disk space, and running services.  
All results are saved in a log file (`healthlog.txt`) with a timestamp for record keeping.

---

# How It Works
1. The script starts by creating a log file named `healthlog.txt`.
2. It records:
   - **System date and time**
   - **Uptime** – how long the system has been running
   - **CPU load** – current CPU usage from `uptime`
   - **Memory usage** – from `free -m`
   - **Disk usage** – from `df -h`
   - **Top 5 memory-consuming processes** – from `ps aux --sort=-%mem | head -n 6`
   - **Service status check** – verifies if `nginx` and `ssh` are running
3. Finally, it saves all the output into `healthlog.txt` with a completion message and timestamp.

---

# Commands Used
| Command | Purpose |
|----------|----------|
| `date` | Shows current date and time |
| `uptime` | Displays system uptime and load average |
| `free -m` | Shows memory usage |
| `df -h` | Displays disk space usage |
| `ps aux --sort=-%mem` | Lists processes sorted by memory usage |
| `systemctl is-active` | Checks if a service is running |

---

# How to Run
1. Make the script executable:
   ```bash
   chmod +x healthcheck.sh
