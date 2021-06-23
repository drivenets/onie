#!/bin/sh

#
# Copyright (C) 2016 Curt Brune <curt@cumulusnetworks.com>
#
# SPDX-License-Identifier:     GPL-2.0
#

# Demonstration of firmware update install script

# This script is the entry point of the of the ONIE firmware update
# mechanism.

echo -n "Updating HP Firmwares "
./update_firmware.sh || {
    echo "ERROR: Problems updating the BIOS"
    exit 1
}
echo " done."

# No errors detected
echo "Update complete.  No errors detected."
exit 0
