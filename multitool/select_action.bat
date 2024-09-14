@echo off
title MultiTool - User Access

:: Set colors: 0 for Black background and E for Light Yellow text
color 0E

:: Paths to user data
set "userDataFile=%~dp0user.txt"
set "loggedInUserFile=%~dp0logged_in_user.txt"

:: Check if the user is already logged in
if exist "%loggedInUserFile%" (
    call "%~dp0main.bat"
    exit
)

:login_menu
cls
echo ================================
echo        MultiTool - User Access
echo ================================
echo 1. Login
echo 2. Sign Up
echo 3. Forgot Password
echo 4. Exit
echo ================================
set /p option=Choose an option (1, 2, 3, 4): 

if "%option%"=="1" (
    start "" "%~dp0login.bat"
    exit
)
if "%option%"=="2" (
    start "" "%~dp0signup.bat"
    exit
)
if "%option%"=="3" (
    start "" "%~dp0forgot_password.bat"
    exit
)
if "%option%"=="4" (
    exit
)

:: If the input is invalid, display an error message and return to the menu
echo Invalid option. Please try again.
timeout /t 2 /nobreak >nul
goto login_menu
