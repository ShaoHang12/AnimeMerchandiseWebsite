@echo off
chcp 65001 >nul
echo ========================================
echo    下载 Maven Wrapper
echo ========================================
echo.

set "MAVEN_DIR=%~dp0anime_mall\.mvn\wrapper"
set "JAR_URL=https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.1.0/maven-wrapper-3.1.0.jar"

echo 目录: %MAVEN_DIR%
mkdir "%MAVEN_DIR%" 2>nul

echo.
echo 正在下载 maven-wrapper.jar...
echo 保存位置: %MAVEN_DIR%\maven-wrapper.jar
echo 下载地址: %JAR_URL%
echo.

REM 使用PowerShell下载，保存为 maven-wrapper.jar
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%JAR_URL%' -OutFile '%MAVEN_DIR%\maven-wrapper.jar'"

if exist "%MAVEN_DIR%\maven-wrapper.jar" (
    echo.
    echo 下载成功！
) else (
    echo.
    echo 下载失败，请手动下载：
    echo 1. 访问: %JAR_URL%
    echo 2. 将文件重命名为 maven-wrapper.jar
    echo 3. 保存到: %MAVEN_DIR%\
)

echo.
pause
