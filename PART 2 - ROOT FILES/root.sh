#!/bin/bash

adb shell setenforce 0
adb shell mount -o rw,remount -t rootfs /
adb shell 'sh -c echo "0" > /sys/fs/selinux/enforce'
adb shell 'sh -c echo "1" > /sys/fs/selinux/disable'
adb shell 'sh -c echo "1" > /sys/fs/selinux/access'
adb shell 'sh -c echo "0" > /sys/fs/selinux/deny_unknown'
adb shell mount -t tmpfs -o size=15M tmpfs /system/xbin
adb push xbin/ /system
adb shell chmod 755 /system/xbin/*
adb shell nohup /system/xbin/su 0 su --daemon &
adb install -r SuperSU.apk
