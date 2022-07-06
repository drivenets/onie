#!/bin/sh -x

mnt_dir=/mnt/tmp
firmware_script=${mnt_dir}/ncc_firmware_update.sh
PART_LABEL=DNOS-TMP

mkdir -p ${mnt_dir}
mount LABEL=${PART_LABEL} ${mnt_dir}

cd ${mnt_dir}

[ -e /${firmware_script} ] && sh -x ${firmware_script} && echo "Upgrade finished succesfully" && exit 0

exit 0
