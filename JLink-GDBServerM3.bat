@echo off
call paths.bat
start JLinkGDBServer.exe -select USB -device Cortex-M3 -if SWD -speed 1000 -ir
