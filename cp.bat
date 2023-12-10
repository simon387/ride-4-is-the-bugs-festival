@echo off
setlocal

set "srcDir=C:\Users\ThinkOpen\AppData\Local\Ride4"
set "toDir=C:\dev\ride-4-is-the-bugs-festival\Ride4"

:: Verifica se la cartella di destinazione esiste già, altrimenti la crea
:: if not exist "%toDir%" mkdir "%toDir%"

:: Sposta la cartella e sovrascrive tutto
xcopy /y /s /e "%srcDir%" "%toDir%"

echo Spostamento completato.

endlocal
