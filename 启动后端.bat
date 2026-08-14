@echo off
chcp 65001 >nul
echo ========================================
echo    Anime Mall - Starting Backend
echo ========================================
echo.

set "JAVA_HOME=D:\Download\Work\DataGrip 2021.1\jbr"
set "MAVEN_HOME=D:\Download\Work\IntelliJ IDEA 2026.1.2\plugins\maven\lib\maven3"
set "PATH=%JAVA_HOME%\bin;%MAVEN_HOME%\bin;%PATH%"
set "MAVEN_OPTS=-Duser.home=%USERPROFILE%"

echo [1/3] Checking Java...
call java -version >nul 2>&1
if errorlevel 1 goto :nojava
call java -version
echo.

echo [2/3] Checking Maven...
call mvn --version >nul 2>&1
if errorlevel 1 goto :nomaven
call mvn --version
echo.

echo [3/3] Building and starting backend...
cd /d "%~dp0anime_mall"
if errorlevel 1 goto :nocdir

call mvn clean package -DskipTests -Dmaven.repo.local=%USERPROFILE%\.m2\repository
if errorlevel 1 goto :buildfail

echo.
echo Starting server...
echo Visit: http://localhost:8080/anime_mall/
echo Press Ctrl+C to stop.
echo.
java -jar target\anime_mall-0.0.1-SNAPSHOT.jar
goto :end

:nojava
echo Error: Java not found
goto :fail

:nomaven
echo Error: Maven not found
goto :fail

:nocdir
echo Error: Cannot find anime_mall directory
goto :fail

:buildfail
echo.
echo Error: Build failed, check errors above
goto :fail

:fail
echo.
pause
exit /b 1

:end
pause