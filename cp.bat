@echo off
setlocal

:: Variables
set "srcDir=C:\Users\ThinkOpen\AppData\Local\Ride4"
set "toDir=C:\dev\ride-4-is-the-bugs-festival\bu\Ride4"
set "random_string="
for /L %%i in (1,1,8) do (
    set /a "rand=!random! %% 62"
    for %%j in (!rand!) do set "random_string=!random_string!!chars:~%%j,1!"
)

:: Check if the destination folder already exists, otherwise create it
if not exist "%toDir%" mkdir "%toDir%"

:: Move the directory and overwrite everything
xcopy /y /s /e "%srcDir%" "%toDir%"

echo Copy Done.

:: Generate a random string
random_string=$(openssl rand -hex 16)

git add .
git commit -m "%random_string%"
git push

echo Commit Done.

endlocal
