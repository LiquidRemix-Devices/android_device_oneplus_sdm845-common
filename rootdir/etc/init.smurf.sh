#!/system/bin/sh
#SmurfKernel variable init

sleep 10;
echo 180 > /sys/devices/platform/soc/5000000.qcom,kgsl-3d0/kgsl/kgsl-3d0/min_clock_mhz
echo 300000 > /sys/module/cpu_input_boost/parameters/remove_input_boost_freq_lp


