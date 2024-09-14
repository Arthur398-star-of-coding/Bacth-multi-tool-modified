@echo off
title Sign-Up Screen

:: Set colors: 0 for Black background and E for Light Yellow text
color 0E

:: Paths to user data
set "userDataFile=%~dp0user.txt"

:: Sign-Up loop
:signup
cls
echo ================================
echo         Sign-Up Screen
echo ================================
set /p username=Choose a Username: 
set /p password=Choose a Password: 
set /p confirmPassword=Confirm Password: 

:: Check if passwords match
if "%password%" neq "%confirmPassword%" (
    echo Passwords do not match. Please try again.
    pause
    goto signup
)

:: Check if username already exists
findstr /b /i "%username%:" "%userDataFile%" >nul
if %errorlevel% == 0 (
    echo Username already exists. Please choose a different username.
    pause
    goto signup
)

:: Save new user data
echo %username%:%password% >> "%userDataFile%"
echo Sign-Up successful! You are now logged in.
echo %username% > "%~dp0logged_in_user.txt"
pause
exit
