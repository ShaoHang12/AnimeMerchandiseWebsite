@echo off
chcp 65001 >nul
echo ========================================
echo    动漫产品商城 - 一键启动
echo ========================================
echo.
echo 请选择操作:
echo.
echo [1] 启动全部服务（后端 + 后台 + 前台）
echo [2] 仅启动后端服务
echo [3] 仅启动管理后台
echo [4] 仅启动前台商城
echo [5] 初始化数据库
echo [0] 退出
echo.
set /p choice=请输入选项 (0-5): 

if "%choice%"=="1" goto startAll
if "%choice%"=="2" goto startBackend
if "%choice%"=="3" goto startAdmin
if "%choice%"=="4" goto startFront
if "%choice%"=="5" goto initDB
if "%choice%"=="0" goto exit
echo 请输入正确数字
pause
goto exit

:startAll
echo.
echo 正在启动所有服务...
echo.

REM 启动后端
start "后端服务" cmd /k "cd /d %~dp0 && call 启动后端.bat"
timeout /t 5 /nobreak >nul

REM 启动管理后台
start "管理后台-前端" cmd /k "cd /d %~dp0 && call 启动管理后台.bat"
timeout /t 3 /nobreak >nul

REM 启动前台
start "前台页面" cmd /k "cd /d %~dp0 && call 启动前台.bat"

echo.
echo 所有服务已启动
echo.
echo 访问地址:
echo - 后端API: http://localhost:8080/anime_mall/
echo - 管理后台: http://localhost:8081
echo - 前台商城: http://localhost:8082
echo.
echo 默认管理员: admin / admin123
echo 测试用户: user1 / 123456
echo.
pause
goto exit

:startBackend
call 启动后端.bat
goto exit

:startAdmin
call 启动管理后台.bat
goto exit

:startFront
call 启动前台.bat
goto exit

:initDB
echo.
echo 正在初始化数据库...
echo 请输入MySQL root密码:
set /p mysqlpass=
echo.
mysql -u root -p%mysqlpass% < anime_mall\anime_mall.sql
if errorlevel 1 (
    echo 数据库初始化失败，请检查MySQL服务
) else (
    echo 数据库初始化成功
)
pause
goto exit

:exit
