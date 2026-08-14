@echo off
chcp 65001 >nul
echo ========================================
echo    动漫产品商城 - 测试服务
echo ========================================
echo.

echo [1/3] 测试后端API...
echo 测试 http://localhost:8080/anime_mall/ ...
curl -s http://localhost:8080/anime_mall/ >nul 2>&1
if errorlevel 1 (
    echo 后端服务未启动或无法访问
    echo 请先启动: 双击 "启动后端.bat"
) else (
    echo 后端服务正常!
)
echo.

echo [2/3] 测试管理后台...
echo 测试 http://localhost:8081 ...
curl -s http://localhost:8081 >nul 2>&1
if errorlevel 1 (
    echo 管理后台未启动或无法访问
    echo 请先启动: 双击 "启动管理后台.bat"
) else (
    echo 管理后台正常!
)
echo.

echo [3/3] 测试前台商城...
echo 测试 http://localhost:8082 ...
curl -s http://localhost:8082 >nul 2>&1
if errorlevel 1 (
    echo 前台商城未启动或无法访问
    echo 请先启动: 双击 "启动前台.bat"
) else (
    echo 前台商城正常!
)
echo.

echo 测试完毕!
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
