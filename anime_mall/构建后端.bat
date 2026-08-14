@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

echo ============================================
echo   动漫产品商城 - 后端构建脚本
echo ============================================
echo.

set "JAVA_HOME=C:\Program Files\Java\jdk-21.0.12"
set "MAVEN_BIN=%USERPROFILE%\.m2\wrapper\dists\apache-maven-3.8.5-bin\5i5jha092a3i37g0paqnfr15e0\apache-maven-3.8.5\bin\mvn.cmd"

echo [1/3] 检查 Java 版本...
"%JAVA_HOME%\bin\java" -version 2>&1
echo.

echo [2/3] 创建 Maven 仓库目录...
:: 由于 Java 21 的 user.home bug，需要手动创建 C:\.m2\repository
if not exist "C:\.m2\repository" (
    mkdir "C:\.m2\repository"
    echo 已创建 C:\.m2\repository
) else (
    echo C:\.m2\repository 已存在
)
echo.

echo [3/3] 编译项目...
cd /d "%~dp0"
set "MAVEN_OPTS=--add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED"

"%MAVEN_BIN%" clean package -DskipTests
echo.

if %ERRORLEVEL% EQU 0 (
    echo ============================================
    echo   构建成功！
    echo ============================================
    echo.
    echo 现在可以运行 启动后端.bat 来启动服务器
) else (
    echo ============================================
    echo   构建失败，请检查错误信息
    echo ============================================
)
echo.
pause