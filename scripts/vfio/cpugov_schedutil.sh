# cpugov_schedutil.sh
# Set CPU Scaling Governor to "Scheutil" for all cores.
# This is the default behavior for NixOS

#!/bin/bash
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
for file in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do echo "schedutil" > $file; done
cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
