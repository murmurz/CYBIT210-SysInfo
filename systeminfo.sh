#!/bin/bash

OUTPUT="$HOME/systeminfo_report.txt"

echo "========== SYSTEM INFORMATION REPORT ==========" > "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Hostname:" >> "$OUTPUT"
hostname >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Operating System:" >> "$OUTPUT"
cat /etc/os-release | grep PRETTY_NAME >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "System Uptime:" >> "$OUTPUT"
uptime -p >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Kernel Version:" >> "$OUTPUT"
uname -r >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "CPU Information:" >> "$OUTPUT"
lscpu >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Memory Information:" >> "$OUTPUT"
free -h >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Network Interfaces:" >> "$OUTPUT"
ip addr show >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Filesystem Utilization and Types:" >> "$OUTPUT"
df -hT >> "$OUTPUT"
echo "" >> "$OUTPUT"

echo "Last 5 Errors Found in Logs:" >> "$OUTPUT"
grep -i error /var/log/syslog | tail -5 >> "$OUTPUT"

echo ""
echo "Report saved to: $OUTPUT"
