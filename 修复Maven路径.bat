@echo off
echo 正在修复 Maven 仓库路径问题...
echo.
mkdir "C:\.m2\repository" 2>nul
if exist "C:\.m2\repository" (
    echo [成功] 已创建 C:\.m2\repository
) else (
    echo [错误] 无法创建目录，请以管理员身份运行此脚本
)
echo.
pause