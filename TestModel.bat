@echo off 
title=解决强制要求驱动签名设置工具
mode con cols=56 lines=25 
color 2F

:menu
cls
echo.
echo 解决强制要求驱动签名设置工具              
echo ====================================================
echo.
echo 输入1 关闭强制要求驱动签名
echo.
echo 输入2 开启强制要求驱动签名
echo.
echo 输入0 结束设置
echo.
echo.
echo ====================================================
echo.
set /p u=请输入数字：
if %u% equ 1 goto set1
if %u% equ  2 goto set2  
if %u% equ  0 goto end  
:set1
echo 正在关闭强制要求驱动签名
bcdedit -set loadoptions DDISABLE_INTEGRITY_CHECKS
bcdedit -set TESTSIGNING ON
pause
goto menu
:set2 
echo 开启强制要求驱动签名
bcdedit -set loadoptions ENABLE_INTEGRITY_CHECKS
bcdedit -set TESTSIGNING OFF

pause
goto menu

pause
:end
exit