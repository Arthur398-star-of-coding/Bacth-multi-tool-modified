@echo off
:: Start the user selection script
start "" "%~dp0select_action.bat"
exit

title MultiTool - Open SalaryManagement or CodeEditor
chcp 65001 >nul
color 0E

:: Paths to the apps
set "salaryAppDir=%~dp0SalaryManagement"
set "codeEditorAppDir=%~dp0CodeEditor"

:menu
cls
echo ========================================
echo              MultiTool
echo ========================================
echo 1. Open SalaryManagement App
echo 2. Open CodeEditor App
echo 3. Exit
echo ========================================
set /p option=Choose an option (1, 2, 3): 

if "%option%"=="1" goto open_salary
if "%option%"=="2" goto open_codeeditor
if "%option%"=="3" goto exit

goto menu

:open_salary
cls
if exist "%salaryAppDir%\SalaryManagement.bat" (
    echo Opening SalaryManagement App...
    start "" "%salaryAppDir%\SalaryManagement.bat"
) else (
    echo SalaryManagement App not found!
)
pause
goto menu

:open_codeeditor
cls
if exist "%codeEditorAppDir%\CodeEditor.bat" (
    echo Opening CodeEditor App...
    start "" "%codeEditorAppDir%\CodeEditor.bat"
) else (
    echo CodeEditor App not found!
)
pause
goto menu

:exit
cls
echo Exiting MultiTool...
exit /b
