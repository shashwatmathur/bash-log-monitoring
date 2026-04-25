#!/bin/bash
#used to test

LOG_FILE="sample.log"

echo "🔍 Scanning logs..."

# Detect errors
grep "ERROR" $LOG_FILE > logs/errors.txt

# Detect warnings
grep "WARNING" $LOG_FILE > logs/warnings.txt

# Extract suspicious IPs
grep "Failed password" $LOG_FILE | awk '{print $NF}' > logs/suspicious_ips.txt

echo "✅ Scan complete!"

echo "---- Errors ----"
cat logs/errors.txt

echo "---- Warnings ----"
cat logs/warnings.txt

echo "---- Suspicious IPs ----"
cat logs/suspicious_ips.txt