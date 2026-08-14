@echo off
chcp 65001 >nul
echo ========================================
echo    动漫产品商城 - 测试构建
echo ========================================
echo.

REM 设置JAVA_HOME
set "JAVA_HOME=D:\Download\Work\IntelliJ IDEA 2026.1.2\jbr"
set "PATH=%JAVA_HOME%\bin;%PATH%"

echo [1/2] 检查Java环境...
java -version
echo.

echo [2/2] 测试Maven构建...
cd /d "%~dp0anime_mall"
call mvnw.cmd clean package -DskipTests
if errorlevel 1 (
    echo 构建失败，请检查环境配置
    pause
    exit /b 1
)

echo.
echo 构建成功!
echo 生成JAR文件: anime_mall\target\anime_mall-0.0.1-SNAPSHOT.jar
echo.
pause
