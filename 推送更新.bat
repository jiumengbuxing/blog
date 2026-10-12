@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
title 推送更新 - 久梦博客

rem 记住当前代码页，退出时还原
set "OLDCP="
for /f "tokens=2 delims=:. " %%C in ('chcp') do if not defined OLDCP set "OLDCP=%%C"
if not defined OLDCP set "OLDCP=936"

rem ============ 1. 找 git（PATH - 常见位置 - WorkBuddy 便携版） ============
set "GIT_EXE="
for %%I in (git.exe) do if not defined GIT_EXE if exist "%%~$PATH:I" set "GIT_EXE=%%~$PATH:I"
if not defined GIT_EXE if exist "%ProgramFiles%\Git\cmd\git.exe" set "GIT_EXE=%ProgramFiles%\Git\cmd\git.exe"
if not defined GIT_EXE if exist "%LOCALAPPDATA%\Programs\Git\cmd\git.exe" set "GIT_EXE=%LOCALAPPDATA%\Programs\Git\cmd\git.exe"
if not defined GIT_EXE if exist "%ProgramData%\chocolatey\bin\git.exe" set "GIT_EXE=%ProgramData%\chocolatey\bin\git.exe"
if not defined GIT_EXE (
    set "PB=%ProgramFiles%\WorkBuddy\resources\vendor\PortableGit\cmd\git.exe"
    if exist "!PB!" set "GIT_EXE=!PB!"
)
if not defined GIT_EXE (
    set "PB=D:\agent\WorkBuddy\resources\vendor\PortableGit\cmd\git.exe"
    if exist "!PB!" set "GIT_EXE=!PB!"
)
if not defined GIT_EXE (
    echo.
    echo   [错误] 没有找到 git，请安装 Git for Windows 后重试。
    echo.
    pause
    exit /b 1
)

rem ============ 2. 仓库与提交身份 ============
"!GIT_EXE!" rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
    echo   [错误] 当前目录不是 git 仓库。
    pause
    exit /b 1
)
"!GIT_EXE!" config user.name >nul 2>&1
if errorlevel 1 (
    "!GIT_EXE!" config user.name  "久梦不醒"
    "!GIT_EXE!" config user.email "2870314477@qq.com"
)

echo.
echo   ==========================================
echo    久梦博客 - 推送更新
echo   ==========================================
echo.

rem ============ 3. 有改动就先提交 ============
set "HASCHANGE="
for /f "delims=" %%I in ('"!GIT_EXE!" status --porcelain 2^>nul') do if not defined HASCHANGE set "HASCHANGE=1"

if defined HASCHANGE (
    echo   [1/2] 暂存并提交本地改动 ...
    "!GIT_EXE!" add -A
    "!GIT_EXE!" commit -m "update: !date! !time!" >nul
    if errorlevel 1 (
        echo   [错误] 提交失败，请把上面的信息截图反馈。
        echo.
        pause
        exit /b 1
    )
) else (
    echo   [1/2] 工作区干净，没有新改动需要提交。
)

rem ============ 4. 推送（schannelCheckRevoke=false 兼容本机证书环境） ============
echo   [2/2] 推送到 GitHub ...
"!GIT_EXE!" -c http.schannelCheckRevoke=false push
if errorlevel 1 (
    echo.
    echo   [错误] 推送失败。
    echo   - 若提示认证/登录：按提示完成 GitHub 登录后重跑本脚本
    echo   - 若提示网络超时：检查网络后重试
    echo.
    pause
    exit /b 1
)

chcp !OLDCP! >nul
echo.
echo   ==========================================
echo   [完成] 推送成功！约两分钟后网站自动重新部署。
echo     可到 GitHub 仓库的 Actions 页查看进度。
echo   ==========================================
echo.
pause
exit /b 0
