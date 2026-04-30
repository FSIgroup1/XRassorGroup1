@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "PORT=%PORT%"
if "%PORT%"=="" set "PORT=18080"
set "DIST_DIR=%SCRIPT_DIR%web_dist"

if not exist "%DIST_DIR%\index.html" (
  echo web_dist not found. Run extract_web_dist.py from a Python environment first.
  exit /b 1
)

echo Starting RE-RASSOR web app at:
echo   http://127.0.0.1:%PORT%
echo.
echo Press Ctrl+C to stop.
echo.

where py >nul 2>nul
if %errorlevel%==0 (
  py -3 -m http.server %PORT% --directory "%DIST_DIR%"
  exit /b %errorlevel%
)

python -m http.server %PORT% --directory "%DIST_DIR%"
