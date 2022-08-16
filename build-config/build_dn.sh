#!/bin/bash

export http_proxy=http://proxy.dev.drivenets.net:3128

cpu_count=22

make -j${cpu_count} MACHINE=kvm_x86_64 clean
make -j${cpu_count} MACHINE=kvm_x86_64 all

for machine in dell_poweredge hp_proliant_g10 hp_proliant_g9 
do
    MACHINE_ROOT=$(echo ${machine} | awk -F_ '{print $1}')
    make -j${cpu_count} MACHINEROOT=../machine/${MACHINE_ROOT} MACHINE=${machine} clean
    make -j${cpu_count} MACHINEROOT=../machine/${MACHINE_ROOT} MACHINE=${machine} all
done

