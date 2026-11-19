@echo off
setlocal
if not exist "%~dp0Fix.ps1" goto missing
if not exist "%~dp0FilterGuard.ps1" goto missing
if not exist "%~dp0After.ps1" goto missing
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -File "%~dp0Fix.ps1"
if errorlevel 1 goto failed
exit /b 0
:missing
echo Missing tool files. Extract ALL files from the ZIP into one folder first.
goto hold
:failed
echo PowerShell could not complete. See the error above.
:hold
pause
exit /b 1
