@echo off
chcp 65001 >nul
echo ========================================
echo    动漫产品商城 - 启动前台商城
echo ========================================
echo.

cd /d "%~dp0vue\front\front"

echo [1/2] 安装/检查依赖...
call npm install
if errorlevel 1 (
    echo 错误: 依赖安装失败
    echo 提示: 如果网络问题，可尝试删除 node_modules 后重试
    pause
    exit /b 1
)
echo.

echo [2/2] 启动服务...
echo 请访问 http://localhost:8082 查看
echo 按 Ctrl+C 停止服务
echo.
call npm run serve -- --port 8082
pause
