adb.exe shell setenforce 0
adb.exe shell mount -o rw,remount -t rootfs /
adb.exe shell 'sh -c echo "0" > /sys/fs/selinux/enforce'
adb.exe shell 'sh -c echo "1" > /sys/fs/selinux/disable'
adb.exe shell 'sh -c echo "1" > /sys/fs/selinux/access'
adb.exe shell 'sh -c echo "0" > /sys/fs/selinux/deny_unknown'
adb.exe shell mount -t tmpfs -o size=15M tmpfs /system/xbin
adb.exe push xbin/ /system
adb.exe shell chmod 755 /system/xbin/*
adb.exe shell nohup /system/xbin/su 0 su --daemon &
adb.exe install -r SuperSU.apk