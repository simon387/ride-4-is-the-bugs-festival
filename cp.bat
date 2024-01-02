@echo off
setlocal

:: Variables
set "srcDir=C:\Users\ThinkOpen\AppData\Local\Ride4"
set "toDir=C:\dev\ride-4-is-the-bugs-festival\bu\Ride4"

:: Generate a random string for the commit message
setlocal enabledelayedexpansion
set "chars=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
set "random_string="

:: Use current time as seed for random number generator
for /f %%t in ('wmic os get LocalDateTime ^| find "."') do set "seed=!random!%%t"

:: Generate random string
for /L %%i in (1,1,8) do (
    set /a "rand=!seed! %% 62"
    set "random_string=!random_string!!chars:~%%rand%%,1!"
)

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
