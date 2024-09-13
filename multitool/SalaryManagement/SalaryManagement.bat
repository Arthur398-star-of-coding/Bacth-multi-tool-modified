@echo off
title Employee Salary Management App
color 0E
:: Set colors: 0 for Black background and E for Light Yellow text

:: Paths and files
set "appDir=%~dp0"
set "workerFile=%appDir%workers.txt"
set "logFile=%appDir%log.txt"
set "backupDir=%appDir%Backup"

:: Ensure workers.txt exists
if not exist "%workerFile%" (
    echo Creating workers.txt...
    echo Name,Salary > "%workerFile%"
)

:menu
cls
echo ========================================
echo          Employee Salary Management
echo ========================================
echo 1. Add Worker
echo 2. View Workers
echo 3. Modify Worker Salary
echo 4. Delete Worker
echo 5. Erase All Data
echo 6. Exit
echo ========================================
set /p option=Choose an option (1, 2, 3, 4, 5, 6): 

if "%option%"=="1" goto add_worker
if "%option%"=="2" goto view_workers
if "%option%"=="3" goto modify_salary
if "%option%"=="4" goto delete_worker
if "%option%"=="5" goto erase_data
if "%option%"=="6" goto exit

goto menu

:add_worker
cls
echo Add Worker
echo -----------------------
set /p workerName=Enter worker name or type 2 to return: 
if "%workerName%"=="2" goto menu
set /p salary=Enter salary for %workerName%: 
echo %workerName%,%salary% >> "%workerFile%"
echo Worker added successfully!
pause
goto menu

:view_workers
cls
echo List of Workers and Salaries:
echo -----------------------------
type "%workerFile%"
pause
goto menu

:modify_salary
cls
echo Modify Worker Salary
echo -----------------------
set /p workerName=Enter worker name or type 2 to return: 
if "%workerName%"=="2" goto menu
set /p newSalary=Enter new salary for %workerName%: 

:: Update salary in workers.txt
(for /f "tokens=1,2 delims=," %%i in ('type "%workerFile%"') do (
    if "%%i"=="%workerName%" (
        echo %workerName%,%newSalary%
    ) else (
        echo %%i,%%j
    )
)) > "%workerFile%.tmp"
move /y "%workerFile%.tmp" "%workerFile%"
echo Salary updated successfully!
pause
goto menu

:delete_worker
cls
echo Delete Worker
echo -----------------------
set /p workerName=Enter worker name to delete or type 2 to return: 
if "%workerName%"=="2" goto menu

:: Remove worker from workers.txt
(for /f "tokens=1,2 delims=," %%i in ('type "%workerFile%"') do (
    if not "%%i"=="%workerName%" (
        echo %%i,%%j
    )
)) > "%workerFile%.tmp"
move /y "%workerFile%.tmp" "%workerFile%"
echo Worker deleted successfully!
pause
goto menu

:erase_data
cls
echo Erase All Data
echo -----------------------
echo Are you sure you want to erase all data? This action cannot be undone.
echo 1. Yes
echo 2. No, return to menu
set /p choice=Select (1 or 2): 
if "%choice%"=="1" (
    del "%workerFile%"
    echo Name,Salary > "%workerFile%"
    echo All data erased.
    pause
)
goto menu

:exit
cls
echo Exiting the app and saving all data...
if exist "%logFile%" del "%logFile%" 2>nul
exit /b
