#!/bin/bash
echo "Uploading $1"
python3 -m esptool --port /dev/ttyUSB0 write_flash -fm dio 0x0000 $1
