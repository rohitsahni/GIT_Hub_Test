@echo off
if {%1}=={} @echo Syntax: LwrCase_Folder FullyQualifiedDirectoryName&goto :EOF
if not exist %1 @echo LwrCase_Folder - %1 NOT found.&goto :EOF
setlocal
for /f "Tokens=*" %%a in ('@echo %~a1') do (
 set folder=%%a
)
if /i "%folder:~0,1%" NEQ "d" @echo LwrCase_Folder - %1 is NOT a folder.&endlocal&goto :EOF
pushd %1
set sw=/B /A /A-D
if /i {%2}=={/S} set sw=%sw% %2
for /f "Tokens=*" %%f in ('dir %sw%') do (
 call LwrCase "%%f"
)
popd
endlocal