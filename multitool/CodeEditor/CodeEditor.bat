@echo off
title Code Editor with Custom Scripts, Code QR, and Source Code
color 0E
:: Set colors: 0 for Black background and E for Light Yellow text

:: Paths and files
set "appDir=%~dp0"
set "scriptDir=%appDir%Script_Documents"
set "sourceFile=%appDir%App_Source.txt"
set "qrCodeFile=%appDir%Code_QR.txt"

:: Create directories if not exist
if not exist "%scriptDir%" mkdir "%scriptDir%"

:: Save the current source code into a file
echo @echo off > "%sourceFile%"
echo title Code Editor with Custom Scripts, Code QR, and Source Code >> "%sourceFile%"
echo color 0E >> "%sourceFile%"
echo echo Code Editor source code saved successfully. >> "%sourceFile%"

:menu
cls
echo ========================================
echo          Code Editor App
echo ========================================
echo 1. Write Script
echo 2. View Scripts
echo 3. Generate Code QR
echo 4. View Source Code
echo 5. Exit
echo ========================================
set /p option=Choose an option (1, 2, 3, 4, 5): 

if "%option%"=="1" goto write_script
if "%option%"=="2" goto view_scripts
if "%option%"=="3" goto generate_code_qr
if "%option%"=="4" goto view_source_code
if "%option%"=="5" goto exit

goto menu

:write_script
cls
echo Write Script
echo -----------------------
set /p scriptName=Enter script name (e.g., script.bat, code.cpp) or type 2 to return: 
if "%scriptName%"=="2" goto menu
set "currentFile=%scriptDir%\%scriptName%"
echo Writing to %currentFile%...
echo Type your code below. When done, type 'save' to save the file.

:: Capture user input for the script
:input_loop
set /p codeLine=:
if "%codeLine%"=="save" goto save_script
echo %codeLine% >> "%currentFile%"
goto input_loop

:save_script
echo Script saved successfully as %currentFile%.
pause
goto menu

:view_scripts
cls
echo List of Scripts in %scriptDir%:
echo -----------------------------
dir /b "%scriptDir%"
pause
goto menu

:generate_code_qr
cls
echo Generating Code QR
echo -----------------------
:: Save the QR code link in a file
echo Link: https://github.com/Arthur398-star-of-coding/Money-management-system > "%qrCodeFile%"
echo QR Code information saved in Code_QR.txt.
pause
goto menu

:view_source_code
cls
echo Viewing Source Code
echo -----------------------
type "%sourceFile%"
pause
goto menu

:exit
cls
echo Exiting and saving all data...
exit /b
