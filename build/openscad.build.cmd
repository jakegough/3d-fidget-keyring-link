@echo off

SET "OPENSCAD_EXE=C:\Program Files\OpenSCAD\openscad.exe"
SET INPUT_FILE=%1
SET INPUT_FILE_NAME_ONLY=%~n1
SET OUTPUT_FILE=%~n1.stl

echo Exporting %INPUT_FILE%
"%OPENSCAD_EXE%" -o "%OUTPUT_FILE%" %INPUT_FILE%

if "%SCRIPT_MODE%"=="" echo.
if "%SCRIPT_MODE%"=="" echo.
if "%SCRIPT_MODE%"=="" echo.
if "%SCRIPT_MODE%"=="" echo.
echo Exported %OUTPUT_FILE%

if "%SCRIPT_MODE%"=="" pause