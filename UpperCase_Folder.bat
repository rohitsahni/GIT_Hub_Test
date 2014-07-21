@echo off
REM to use, just drop a directory onto the script icon
set dttm=%date:/=%_%time::=%
set yourFolder=%1

for %%a in ("%yourFolder%\*.*") do (
    set file=%%a
    for %%Z in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
        call :casefix %%Z
    )
    call :rename "%%~a"
)

pause

goto :EOF

:casefix

call set file=%%file:%~1=%~1%%

goto :EOF


:rename
echo:"%~1 Rohit"
echo:"%~1" ^> "%file%"

move "%~1" "%file%_%dttm%"
move "%file%_%dttm%" "%file%"

goto :EOF