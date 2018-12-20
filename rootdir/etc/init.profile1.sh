#!/system/bin/sh

################################################################################
# helper functions to allow Android init like script

function write() {
    echo -n $2 > $1
}

function copy() {
    cat $1 > $2
}

# macro to write pids to system-background cpuset
function writepid_sbg() {
    until [ ! "$1" ]; do
        echo -n $1 > /dev/cpuset/system-background/tasks;
        shift;
    done;
}

################################################################################

{
	sleep 15;
	write /sys/devices/system/cpu/cpufreq/policy0/scaling_governor pixel_smurfutil;
	write /sys/devices/system/cpu/cpufreq/policy4/scaling_governor pixel_smurfutil;
	write /sys/devices/system/cpu0/cpufreq/scaling_governor pixel_smurfutil;
	write /sys/devices/system/cpu4/cpufreq/scaling_governor pixel_smurfutil;
	write devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/up_rate_limit_us 0;
	write devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/down_rate_limit_us 20000;
	write devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/up_rate_limit_us 0;
	write devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/down_rate_limit_us 20000;
	write /sys/module/lowmemorykiller/parameters/enable_adaptive_lmk 0;
	write /dev/stune/top-app/schedtune.sched_boost 15;
	write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1766400;
	write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 300000;
	write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 2803200;
	write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 825600;
	write /sys/module/cpu_input_boost/parameters/dynamic_stune_boost 20;
	write /sys/module/cpu_input_boost/parameters/input_boost_duration 250;
	write /sys/module/cpu_input_boost/parameters/input_boost_freq_hp 902400;
	write /sys/module/cpu_input_boost/parameters/input_boost_freq_lp 1132800;
	write /sys/devices/system/cpu/cpufreq/policy0/scaling_governor pixel_smurfutil;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/pl 1;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/bit_shift1 3;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/bit_shift1_2 2;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/bit_shift2 10;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/target_load1 25;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/target_load2 75;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/silver_suspend_max_freq 825600;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/gold_suspend_max_freq 902400;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/up_rate_limit_us 0;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/down_rate_limit_us 20000;
	write /sys/devices/system/cpu/cpufreq/policy4/scaling_governor pixel_smurfutil;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/pl 1;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/bit_shift1 2;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/bit_shift1_2 2;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/bit_shift2 10;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/target_load1 25;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/target_load2 75;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/silver_suspend_max_freq 825600;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/gold_suspend_max_freq 902400;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/up_rate_limit_us 0;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/down_rate_limit_us 20000;
	write /sys/module/msm_performance/parameters/touchboost 1;
	write /sys/module/adreno_idler/parameters/adreno_idler_active N;
	write /sys/module/workqueue/parameters/power_efficient Y;
	write /sys/devices/platform/soc/5000000.qcom,kgsl-3d0/kgsl/kgsl-3d0/min_clock_mhz 257;
	write /sys/devices/system/cpu/cpu0/cpufreq/pixel_smurfutil/hispeed_freq 1228800;
	write /sys/devices/system/cpu/cpu4/cpufreq/pixel_smurfutil/hispeed_freq 1536000;

}&
