@echo off
setlocal enabledelayedexpansion
for /f "delims=" %%i in ('dir /b *需要删去的字符串*') do (
echo %%i
set var=%%i
set var=!var:需要删去的字符串=!
echo %%i !var!
ren "%%i" "!var!"
)
pause
