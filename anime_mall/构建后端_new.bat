@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

echo ============================================
echo   ?????? - ??????
echo ============================================
echo.

set "JAVA_HOME=C:\Program Files\Java\jdk-21.0.12"
set "MAVEN_BIN=%USERPROFILE%\.m2\wrapper\dists\apache-maven-3.8.5-bin\5i5jha092a3i37g0paqnfr15e0\apache-maven-3.8.5\bin\mvn.cmd"

echo [1/3] ?? Java ??...
"%JAVA_HOME%\bin\java" -version 2>&1
echo.

echo [2/3] ?? Maven ????...
if not exist "C:\.m2\repository" (
    mkdir "C:\.m2\repository"
    echo ??? C:\.m2\repository
) else (
    echo C:\.m2\repository ???
)
echo.

echo [3/3] ????...
cd /d "%~dp0"
set "MAVEN_OPTS=--add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED"

"%MAVEN_BIN%" clean package -DskipTests
echo.

if %ERRORLEVEL% EQU 0 (
    echo ============================================
    echo   ?????
    echo ============================================
    echo.
    echo ?????? ????.bat ??????
) else (
    echo ============================================
    echo   ????????????
    echo ============================================
)
echo.
pause
