@echo off
call paths.bat
start JLink.exe -Device CORTEX-M3 -If SWD -Speed 4000 USDK\flasher\RTL00ConsoleROM.JLinkScript
