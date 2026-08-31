@echo off
setlocal

title Repo-1 to Repo-2 Automation

echo.
echo ==========================================
echo       REPO-1 TO REPO-2 AUTOMATION
echo ==========================================
echo.

cd /d "%~dp0"

echo [1/4] Checking Git...
git --version

if errorlevel 1 (
    echo ERROR: Git is not installed.
    pause
    exit /b 1
)

echo.
echo [2/4] Getting latest Repo-1...
git pull origin main

if errorlevel 1 (
    echo ERROR: Git pull failed.
    pause
    exit /b 1
)

echo.
echo [3/4] Pushing Repo-1 to Repo-2...
git push target main:main --force

if errorlevel 1 (
    echo ERROR: Push to Repo-2 failed.
    pause
    exit /b 1
)

echo.
echo [4/4] SUCCESS
echo.
echo Repo-1 successfully synchronized with Repo-2.
echo.

pause
endlocal