@echo off
setlocal

:: Variables
set "srcDir=C:\Users\ThinkOpen\AppData\Local\Ride4"
set "toDir=C:\dev\ride-4-is-the-bugs-festival\bu\Ride4"
set "random_string=openssl rand -hex 16"


:: Check if the destination folder already exists, otherwise create it
if not exist "%toDir%" mkdir "%toDir%"

:: Move the directory and overwrite everything
xcopy /y /s /e "%srcDir%" "%toDir%"

echo Copy Done.

git add .
git commit -m "Random commit: %random_string%"
git push

echo Commit Done.

endlocal
