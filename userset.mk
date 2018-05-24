#=============================================
# User defined
#=============================================
SDK_PATH = USDK/

ifneq ($(shell uname), Linux)
#============================================= 
# Windows MinGW/MSYS
#============================================= 
PYTHON ?= C:/Python27/python
OPENOCD ?= d:/MCU/OpenOCD/bin/openocd.exe
JLINK_PATH ?= C:/Data/JLink_V632a/
else
#============================================= 
# WSL, Linux
#============================================= 
PYTHON ?= python3
OPENOCD ?= /mnt/d/MCU/OpenOCD/bin/openocd.exe
GCC_PATH ?=~/gcc-arm-none-eabi-7-2017-q4-major/bin/
JLINK_PATH ?= /mnt/c/Data/JLink_V632a/
endif

#============================================= 
# General
#============================================= 
# cmsis-dap \ stlink-v2 \ Jlink
FLASHER_TYPE = Jlink
FLASHER_SPEED = 3500
