@echo off
chcp 65001 >nul
echo ========================================
echo    动漫产品商城 - 部署前端
echo ========================================
echo.

echo 正在将前端文件部署到后端静态资源目录...
echo.

REM 创建admin和front目录
mkdir "%~dp0anime_mall\src\main\resources\static\admin" 2>nul
mkdir "%~dp0anime_mall\src\main\resources\static\front" 2>nul

REM 复制admin dist
echo [1/2] 部署管理后台...
xcopy /E /Y /I "%~dp0vue\admin\admin\dist\*" "%~dp0anime_mall\src\main\resources\static\admin\"

REM 复制front dist
echo [2/2] 部署前台商城...
xcopy /E /Y /I "%~dp0vue\front\front\dist\*" "%~dp0anime_mall\src\main\resources\static\front\"

echo.
echo 部署完成!
echo.
echo 访问地址:
echo - 管理后台: http://localhost:8080/anime_mall/admin/index.html
echo - 前台商城: http://localhost:8080/anime_mall/front/index.html
echo.
pause
