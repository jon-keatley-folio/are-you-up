#!/bin/bash
git clone --recurse-submodules https://github.com/nodemcu/nodemcu-firmware.git

cp user_modules.h nodemcu-firmware/app/include/user_modules.h

cp user_config.h nodemcu-firmware/app/include/user_config.h

cp u8g2_displays.h nodemcu-firmware/app/include/u8g2_displays.h

cp u8g2_fonts.h nodemcu-firmware/app/include/u8g2_fonts.h

podman run --rm -ti -v `pwd`/nodemcu-firmware:/opt/nodemcu-firmware marcelstoer/nodemcu-build build

cp nodemcu-firmware/bin/nodemcu*.bin `pwd`

#rm -r nodemcu-firmware
