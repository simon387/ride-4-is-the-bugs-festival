@echo off
setlocal

:: Variables
set "srcDir=C:\Users\ThinkOpen\AppData\Local\Ride4"
set "toDir=C:\dev\ride-4-is-the-bugs-festival\bu\Ride4"

:: Check if the destination folder already exists, otherwise create it
if not exist "%toDir%" mkdir "%toDir%"

:: Move the directory and overwrite everything
xcopy /y /s /e "%srcDir%" "%toDir%"

echo Copy Done.

:: Generate a random string
random_string=$(openssl rand -hex 16)

git add .
git commit -m "$random_string"
git push

echo Commit Done.

endlocal
