@echo off
title Forgot Password Screen

:: Set colors: 0 for Black background and E for Light Yellow text
color 0E

:: Paths to user data
set "userDataFile=%~dp0user.txt"

:: Forgot password loop
:forgot_password
cls
echo ================================
echo         Forgot Password
echo ================================
echo Please open %userDataFile% to view your credentials.
pause
exit
