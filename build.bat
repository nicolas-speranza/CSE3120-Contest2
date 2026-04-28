@echo off
setlocal

REM Build script for Byte Hopper
REM Main source file: Contest2.asm
REM Change this path to wherever your Irvine32 files are installed
set IRVINE_DIR=C:\Irvine\irvine

if not exist "Contest2.asm" (
    echo ERROR: Contest2.asm was not found in this folder.
    exit /b 1
)

if not exist "%IRVINE_DIR%\Irvine32.inc" (
    echo ERROR: Irvine32.inc was not found in %IRVINE_DIR%
    echo Edit build.bat and set IRVINE_DIR to the correct folder.
    exit /b 1
)

if not exist "%IRVINE_DIR%\Irvine32.lib" (
    echo ERROR: Irvine32.lib was not found in %IRVINE_DIR%
    echo Edit build.bat and set IRVINE_DIR to the correct folder.
    exit /b 1
)

echo Assembling Contest2.asm...
ml /c /coff /I "%IRVINE_DIR%" Contest2.asm
if errorlevel 1 (
    echo Assembly failed.
    exit /b 1
)

echo Linking Contest2.obj...
link /SUBSYSTEM:CONSOLE /LIBPATH:"%IRVINE_DIR%" Contest2.obj Irvine32.lib
if errorlevel 1 (
    echo Linking failed.
    exit /b 1
)

echo.
echo Build successful.
echo Run the game with:
echo Contest2.exe

endlocal