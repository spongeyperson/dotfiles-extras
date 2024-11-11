# cpugov_ondemand.sh
# Set CPU Scaling Governor to "Ondemand" for all cores

#!/bin/bash
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo "ondemand" > $file; done
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
