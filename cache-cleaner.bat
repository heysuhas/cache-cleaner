@echo off
color 0b
title Cache Cleaner by Suhas

:: Check for admin privileges
>nul 2>&1 net session >nul 2>&1 || (echo This script requires administrative privileges. Please run it as an administrator. && pause && exit /b)

echo This script will delete the following:
echo 1. Temporary files in the Windows temp folder
echo 2. Prefetch files
echo 3. User temp files
echo 4. Internet Explorer temporary files
echo 5. Event logs
echo.
echo Press any key to continue or Ctrl+C to cancel...
pause >nul

set /a total_steps=100
set /a current_step=0

:: Delete temporary files
echo [%current_step%%%] Deleting temporary files in the Windows temp folder...
>nul 2>&1 del /s /f /q "%SystemRoot%\Temp\*.*"
>nul 2>&1 rmdir /s /q "%SystemRoot%\Temp"
>nul 2>&1 mkdir "%SystemRoot%\Temp"
set /a current_step+=20
call :draw_progress_bar

:: Delete prefetch files
echo [%current_step%%%] Deleting prefetch files...
>nul 2>&1 del /s /f /q "%SystemRoot%\Prefetch\*.*"
set /a current_step+=20
call :draw_progress_bar

:: Delete user temp files
echo [%current_step%%%] Deleting user temp files...
>nul 2>&1 del /s /f /q "%Temp%\*.*"
>nul 2>&1 rmdir /s /q "%Temp%"
>nul 2>&1 mkdir "%Temp%"
set /a current_step+=20
call :draw_progress_bar

:: Delete Internet Explorer temporary files
echo [%current_step%%%] Deleting Internet Explorer temporary files...
>nul 2>&1 del /s /f /q "%UserProfile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"
>nul 2>&1 rmdir /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\Temporary Internet Files"
>nul 2>&1 del /s /f /q "%UserProfile%\AppData\Local\Microsoft\Windows\INetCache\*.*"
>nul 2>&1 rmdir /s /q "%UserProfile%\AppData\Local\Microsoft\Windows\INetCache"
set /a current_step+=20
call :draw_progress_bar

:: Clear event logs
echo [%current_step%%%] Clearing event logs...
for /f "tokens=*" %%g in ('wevtutil.exe el') do (
    >nul 2>&1 wevtutil.exe cl "%%g"
)
set /a current_step+=20
call :draw_progress_bar

echo Cache cleaning completed successfully!
pause
exit /b

:draw_progress_bar
set progress_bar=
set /a counter=0
:loop_progress_bar
if %counter% lss %current_step% (
    set progress_bar=%progress_bar%#
    set /a counter+=1
    goto loop_progress_bar
)
echo [%progress_bar%]
exit /b