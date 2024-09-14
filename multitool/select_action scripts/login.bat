@echo off
title Login Screen

:: Set colors: 0 for Black background and E for Light Yellow text
color 0E

:: Paths to user data
set "userDataFile=%~dp0user.txt"

:: Login loop
:login
cls
echo ================================
echo             Login
echo ================================
set /p username=Username: 
set /p password=Password: 

:: Validate login
findstr /b /i "%username%:%password%" "%userDataFile%" >nul
if %errorlevel% == 0 (
    echo Login successful!
    echo %username% > "%~dp0logged_in_user.txt"
    pause
    exit
)

echo Invalid credentials, please try again.
pause
goto login
