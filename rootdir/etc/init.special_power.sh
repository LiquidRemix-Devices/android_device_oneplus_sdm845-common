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
sleep 10;

write /proc/sys/vm/swappiness 5;
write /proc/sys/vm/drop_caches 3;
write /proc/sys/vm/drop_caches 0;
write /proc/sys/vm/dirty_ratio 50;
write /proc/sys/vm/oom_dump_tasks 0;
write /proc/sys/vm/stat_interval 60;
write /proc/sys/fs/lease-break-time 10;
write /proc/sys/vm/min_free_kbytes 7168;
write /proc/sys/vm/vfs_cache_pressure 20;
write /proc/sys/vm/dirty_background_ratio 2;
write /proc/sys/vm/dirty_expire_centisecs 6000;
write/proc/sys/vm/dirty_writeback_centisecs 2000;

write /sys/block/sda/queue/scheduler zen;
write /sys/block/sda/queue/read_ahead_kb 512;
write /sys/block/sda/queue/iostats 0;
write /sys/block/sda/queue/nr_requests 32;
write /sys/block/sde/queue/scheduler zen;
write /sys/block/sde/queue/read_ahead_kb 512;
write /sys/block/sde/queue/iostats 0;
write /sys/block/sde/queue/nr_requests 32;

sleep 10;

QSEECOMD=`pidof qseecomd`
THERMAL-ENGINE=`pidof thermal-engine`
TIME_DAEMON=`pidof time_daemon`
IMSQMIDAEMON=`pidof imsqmidaemon`
IMSDATADAEMON=`pidof imsdatadaemon`
DASHD=`pidof dashd`
CND=`pidof cnd`
DPMD=`pidof dpmd`
RMT_STORAGE=`pidof rmt_storage`
TFTP_SERVER=`pidof tftp_server`
NETMGRD=`pidof netmgrd`
IPACM=`pidof ipacm`
QTI=`pidof qti`
LOC_LAUNCHER=`pidof loc_launcher`
QSEEPROXYDAEMON=`pidof qseeproxydaemon`
IFAADAEMON=`pidof ifaadaemon`
LOGCAT=`pidof logcat`
LMKD=`pidof lmkd`
PERFD=`pidof perfd`
IOP=`pidof iop`
MSM_IRQBALANCE=`pidof msm_irqbalance`
SEEMP_HEALTHD=`pidof seemp_healthd`
ESEPMDAEMON=`pidof esepmdaemon`
WPA_SUPPLICANT=`pidof wpa_supplicant`
SEEMPD=`pidof seempd`
EMBRYO=`pidof embryo`
HEALTHD=`pidof healthd`
OEMLOGKIT=`pidof oemlogkit`
NETD=`pidof netd`

writepid_sbg $QSEECOMD;
writepid_sbg $THERMAL-ENGINE;
writepid_sbg $TIME_DAEMON;
writepid_sbg $IMSQMIDAEMON;
writepid_sbg $IMSDATADAEMON;
writepid_sbg $DASHD;
writepid_sbg $CND;
writepid_sbg $DPMD;
writepid_sbg $RMT_STORAGE;
writepid_sbg $TFTP_SERVER;
writepid_sbg $NETMGRD;
writepid_sbg $IPACM;
writepid_sbg $QTI;
writepid_sbg $LOC_LAUNCHER;
writepid_sbg $QSEEPROXYDAEMON;
writepid_sbg $IFAADAEMON;
writepid_sbg $LOGCAT;
writepid_sbg $LMKD;
writepid_sbg $PERFD;
writepid_sbg $IOP;
writepid_sbg $MSM_IRQBALANCE;
writepid_sbg $SEEMP_HEALTHD;
writepid_sbg $ESEPMDAEMON;
writepid_sbg $WPA_SUPPLICANT;
writepid_sbg $SEEMPD;
writepid_sbg $HEALTHD;
writepid_sbg $OEMLOGKIT;
writepid_sbg $NETD;

# running embryo writepid 1 minute after boot up since these daemons take a while to start their different processes
sleep 60

writepid_sbg $EMBRYO;

}&
