@echo off
title Code Editor with Custom Languages
color 0E

:: Paths and important files
set "appDir=%~dp0"
set "scriptDir=%appDir%Script_Documents"
set "sourceFile=%appDir%App_Source.txt"
set "qrCodeFile=%appDir%Code_QR.txt"
set "customLangFile=%appDir%Custom_Language.txt"

:: Ensure necessary directories and files are created
if not exist "%scriptDir%" mkdir "%scriptDir%"
call :regenerate_files

:menu
cls
echo ========================================
echo              Code Editor App
echo ========================================
echo 1. Write and Run Script
echo 2. View Scripts
echo 3. Define Custom Language
echo 4. Exit
echo ========================================
set /p option=Choose an option (1, 2, 3, 4): 

if "%option%"=="1" goto write_script
if "%option%"=="2" goto view_scripts
if "%option%"=="3" goto define_custom_language
if "%option%"=="4" goto exit

goto menu

:write_script
cls
echo Write and Run Script
echo -----------------------
echo Select language:
echo 1. Batch (.bat)
echo 2. C++ (.cpp)
echo 3. Custom Language
echo 4. Exit
set /p langOption=Choose a language (1, 2, 3, 4): 

if "%langOption%"=="4" goto exit

if "%langOption%"=="1" (
    set "ext=.bat"
) else if "%langOption%"=="2" (
    set "ext=.cpp"
) else if "%langOption%"=="3" (
    set /p customExt=Enter your custom file extension (e.g., .cdt): 
    if not defined customExt (
        echo No extension defined. Returning to menu.
        pause
        goto menu
    )
    set "ext=%customExt%"
) else (
    echo Invalid selection. Returning to menu.
    pause
    goto menu
)

set /p scriptName=Enter script name (without extension, type 2 to return, or 4 to exit): 
if "%scriptName%"=="2" goto menu
if "%scriptName%"=="4" goto exit

set "currentFile=%scriptDir%\%scriptName%%ext%"
echo Writing to %currentFile%...
echo Type your code below. When done, type 'save' to save the file, type 'run' to run the code, or type 'exit' to exit.

:: Capture user input for the script
:input_loop
set /p codeLine=:
if "%codeLine%"=="save" goto save_script
if "%codeLine%"=="run" goto run_script
if "%codeLine%"=="exit" goto exit
echo %codeLine% >> "%currentFile%"
goto input_loop

:save_script
echo Script saved successfully as %currentFile%.
pause
goto menu

:run_script
:: Save the code first before running
echo %codeLine% >> "%currentFile%"
echo Running the code...
if "%ext%"==".bat" (
    start "" "%currentFile%"
) else if "%ext%"==".cpp" (
    :: Assuming a compiler is installed, use g++ to compile and run the .cpp file
    g++ "%currentFile%" -o "%scriptDir%\%scriptName%.exe"
    start "" "%scriptDir%\%scriptName%.exe"
) else if "%ext%"==".%customExt%" (
    :: Custom language handling (place your custom interpreter or compiler logic here)
    echo Custom language script executed.
) else (
    echo Unsupported file type for execution.
)
pause
goto menu

:view_scripts
cls
echo List of Scripts in %scriptDir%:
echo -----------------------------
dir /b "%scriptDir%"
pause
goto menu

:define_custom_language
cls
echo Define Custom Language
echo -----------------------
set /p customExt=Enter your custom file extension (e.g., .cdt): 
if not defined customExt (
    echo No extension defined. Returning to menu.
    pause
    goto menu
)
echo Custom language extension set to %customExt%.
echo %customExt% > "%customLangFile%"
pause
goto menu

:exit
cls
echo Exiting and saving all data...
exit /b

:: Regenerate missing files
:regenerate_files
if not exist "%sourceFile%" (
    echo @echo off > "%sourceFile%"
    echo title Code Editor with Custom Languages >> "%sourceFile%"
    echo color 0E >> "%sourceFile%"
    echo echo Code Editor source code saved successfully. >> "%sourceFile%"
    echo App source file has been regenerated.
)

if not exist "%qrCodeFile%" (
    echo Link: https://github.com/Arthur398-star-of-coding/Money-management-system > "%qrCodeFile%"
    echo Code QR file has been regenerated.
)

if not exist "%customLangFile%" (
    echo Custom language extension not defined. >> "%customLangFile%"
)

goto :EOF
