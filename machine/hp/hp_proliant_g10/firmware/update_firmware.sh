#!/bin/sh -x

mnt_dir=/mnt/tmp
firmware_script=${mnt_dir}/ncc_firmware_update.sh

PART_LABEL=DNOS-TMP
DISK_PATH=/dev/sda

PART_NUM=$(/usr/bin/sgdisk -p ${DISK_PATH} | grep ${PART_LABEL} | awk '{print $1}')

mkdir -p ${mnt_dir}
mount ${DISK_PATH}${PART_NUM} ${mnt_dir}

cd ${mnt_dir}

[ -e /${firmware_script} ] && sh -x ${firmware_script} && echo "Upgrade finished succesfully" && exit 0

exit 0
