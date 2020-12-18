@echo off

color 0A

:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::------------------------------------------
echo         Welcome To Chiaki PI
::------------------------------------------
echo need BalenaEtcher and SD card Formater
::------------------------------------------
echo press Enter To Continue
pause


start https://drive.google.com/file/d/1T3_e5svW-TtWCjmWBrSJHULfNACFdFCB/view?usp=sharing
pause

echo Downloads Twister OS
::-------------------------------------------------------------
echo Thank @ptitSeb for this good Job Continue Bro..
::-------------------------------------------------------------
echo check Twister Website: https://twisteros.com/twisteros.html
::-------------------------------------------------------------
pause
start https://archive.org/download/twister-osv-1-9-3.img_202012/TwisterOSv1-9-3.img.xz

echo Formate your SD card
pause
start C:\Users\%UsersName%\Desktop\SD Card Formatter

echo run BalenaEtcher to Flash OS
echo navigate to your OS Downloads Directory
echo and select your sd card min 16 GB /flash..
pause
start C:\Users\%UsersName%\Desktop\balenaEtcher

echo Done Your OS is Ready


close 


