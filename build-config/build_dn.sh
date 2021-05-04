#!/bin/bash

cpu_count=22

make -j${cpu_count} MACHINE=kvm_x86_64 clean
make -j${cpu_count} MACHINE=kvm_x86_64 all

for machine in hp_proliant_g10 hp_proliant_g9 dell_poweredge ufispace_s9700_53dx ufispace_s9700_23d ufispace_s9705_48d accton_as5912_54x accton_as5912_54xk accton_as5916_54x accton_as5916_54xl delta_agcxd40s
do
    MACHINE_ROOT=$(echo ${machine} | awk -F_ '{print $1}')
    make -j${cpu_count} MACHINEROOT=../machine/${MACHINE_ROOT} MACHINE=${machine} clean
    make -j${cpu_count} MACHINEROOT=../machine/${MACHINE_ROOT} MACHINE=${machine} all
done

