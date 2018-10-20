#!/system/bin/sh
#SmurfKernel variable init

sleep 10;
echo 150 > /sys/module/devfreq_boost/parameters/flex_boost_duration
echo 150 > /sys/module/cpu_input_boost/parameters/flex_boost_duration
echo 1056000 > /sys/module/cpu_input_boost/parameters/flex_boost_freq_lp
echo 902400 > /sys/module/cpu_input_boost/parameters/flex_boost_freq_hp
echo 710 > /sys/devices/platform/soc/5000000.qcom,kgsl-3d0/kgsl/kgsl-3d0/max_clock_mhz
echo 838000000 > /sys/devices/platform/soc/5000000.qcom,kgsl-3d0/devfreq/5000000.qcom,kgsl-3d0/max_freq
echo 825600 > /sys/module/cpu_input_boost/parameters/remove_input_boost_freq_perf
echo 300000 > /sys/module/cpu_input_boost/parameters/remove_input_boost_freq_lp
