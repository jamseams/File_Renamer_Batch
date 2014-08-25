::Turns an "Songname - Artist.mp3" into "Artist - Songname.mp3" for all *.mp3 inside the folder.

::Trims the first 5 letters for all the *.mp3
setlocal ENABLEDELAYEDEXPANSION
for %%A in (*.mp3) do call :F1 "%%A"
for %%b in (*.mp3) do (
		set string=%%b
		echo !string!
		::Replace the " - " with something that will not appear such as ";"
		set string=!string: - =;! 
		echo !string!
		::Trim the extension ".mp3"
		set string=!string:~0,-5!
		for /f "tokens=1,2 delims=;" %%c in ('echo !string!') do (
		::Gets the new name now.
		set newname=%%d - %%c%%~xb
		echo !newname!
        ren "%%b" "%%d - %%c%%~xb">>temp.txt)
		)
endlocal
pause
goto :CONT

:F1
::Always assign parameter to a new variable.
set var=%1
set var=!var:~6!
set var=!var:~0,-1!
echo !var!>>temp.txt
ren %1 "!var!"
exit /b
::Swaps the "Songname - Artist.mp3" into "Artist - Songname.mp3"
:CONT

