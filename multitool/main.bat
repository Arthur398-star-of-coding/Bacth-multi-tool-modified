@echo off
title MultiTool - by Ebola Man
chcp 65001 >nul
color 5
:start
call :banner

:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo [38;2;255;255;0m        ╔═(1) SalaryManagement[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠══(2) CodeEditor[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╚╦═══(3) Exit[0m  
echo [38;2;255;255;0m         ║[0m  
set /p input=.%BS% [38;2;255;255;0m        ╚══════^>[0m  

:: Open SalaryManagement App in a new window, but stay in the current MultiTool directory
if /I "%input%"=="1" (
    start "" "%~dp0SalaryManagement\SalaryManagement.bat"
)

:: Open CodeEditor App in a new window, but stay in the current MultiTool directory
if /I "%input%"=="2" (
    start "" "%~dp0CodeEditor\CodeEditor.bat"
)

:: Exit Option
if /I "%input%"=="3" exit

:: Alternatively, open by typing the app name
if /I "%input%"=="SalaryManagement" (
    start "" "%~dp0SalaryManagement\SalaryManagement.bat"
)
if /I "%input%"=="CodeEditor" (
    start "" "%~dp0CodeEditor\CodeEditor.bat"
)
if /I "%input%"=="Exit" exit

cls
goto start

:banner
echo.
echo.
echo                     [38;2;255;0;0m███╗   ███╗██╗   ██╗██╗  ████████╗██╗    ████████╗ ██████╗  ██████╗ ██╗[0m     
echo                     [38;2;255;51;0m████╗ ████║██║   ██║██║  ╚══██╔══╝██║    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     [0m
echo                     [38;2;255;102;0m██╔████╔██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║    [0m 
echo                     [38;2;255;153;0m██║╚██╔╝██║██║   ██║██║     ██║   ██║       ██║   ██║   ██║██║   ██║██║     [0m
echo                     [38;2;255;204;0m██║ ╚═╝ ██║╚██████╔╝███████╗██║   ██║       ██║   ╚██████╔╝╚██████╔╝███████╗[0m
echo                     [38;2;255;255;0m╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝   ╚═╝       ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝[0m
echo.
