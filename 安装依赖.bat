@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"
title 安装依赖 - 久梦博客

rem ============ 1. 找 node（PATH - 常见位置 - WorkBuddy 内置） ============
set "NODE_EXE="
for %%I in (node.exe) do if not defined NODE_EXE if exist "%%~$PATH:I" set "NODE_EXE=%%~$PATH:I"
if not defined NODE_EXE if exist "%LOCALAPPDATA%\Programs\nodejs\node.exe" set "NODE_EXE=%LOCALAPPDATA%\Programs\nodejs\node.exe"
if not defined NODE_EXE if exist "%ProgramFiles%\nodejs\node.exe" set "NODE_EXE=%ProgramFiles%\nodejs\node.exe"
if not defined NODE_EXE (
    set "WB=%USERPROFILE%\.workbuddy\binaries\node\versions"
    if exist "!WB!" (
        for /f "delims=" %%D in ('dir /b /o-n "!WB!" 2^>nul') do (
            if not defined NODE_EXE if exist "!WB!\%%D\node.exe" set "NODE_EXE=!WB!\%%D\node.exe"
        )
    )
)
if not defined NODE_EXE (
    echo.
    echo   [错误] 没有找到 Node.js，请先安装 Node.js 20+。
    echo.
    pause
    exit /b 1
)

for %%F in ("!NODE_EXE!") do set "NODE_DIR=%%~dpF"
set "PATH=!NODE_DIR!;!PATH!"
set "COREPACK_ENABLE_DOWNLOAD_PROMPT=0"

echo.
echo   ==========================================
echo    久梦博客 - 安装依赖（首次约几分钟）
echo   ==========================================
echo   Node: !NODE_EXE!
echo.

"!NODE_EXE!" corepack pnpm install
if errorlevel 1 (
    echo.
    echo   [错误] 安装失败，请检查网络后重跑本脚本。
    echo.
    pause
    exit /b 1
)

echo.
echo   [完成] 依赖安装完成！回到控制台点「启动预览」即可实时预览。
echo.
pause
exit /b 0
