#!/bin/bash

nodemcu-uploader upload init.lua
nodemcu-uploader upload display.lua
#nodemcu-uploader upload sensor.lua
nodemcu-uploader node restart
