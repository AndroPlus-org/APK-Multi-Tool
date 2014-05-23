@ECHO off
setlocal enabledelayedexpansion
COLOR 0A
if (%1)==(0) goto skipme
if (%1) neq () goto skipme
ECHO *********************************************************************************** >> setuplog.log
ECHO ^*                          %date% -- %time%^ >> setuplog.log                         * >> setuplog.log
ECHO *********************************************************************************** >> setuplog.log
Setup 0 2>> setuplog.log
:error
:skipme
cd "%~dp0"
mode con:cols=85 lines=50
if errorlevel 1 goto erradb
cls
:RESTART
cd "%~dp0"
set menunr=GARBAGE
cls
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                         APK MULTI-TOOLセットアップ                              *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO * 1. 更新の確認 (元の英語版)                                                      *
ECHO *    This Will Check if there is a update to the main program                     *
ECHO *    For  this option is not functional please visit                              *
ECHO *    http://apkmultitool.com for updates                                          *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO * 2. Framework-Res等のインストール                                                *
ECHO *    Framwork-Resファイルや特定の端末に必要なファイルをインストールします。       *
ECHO *    ファイルはotherフォルダに入れてください。                                    *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO * 3. フォルダのセットアップ                                                       *
ECHO *    Apk Multi-Toolsに必要なフォルダを作成します。                                *
ECHO *    (初回起動時のみ必要)                                                         * 
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                                 その他                                          *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *  4   ログの表示                                                                 *
ECHO *  5   その他の情報                                                               *
ECHO *  00  終了                                                                       *
ECHO *                                                                                 *
ECHO ***********************************************************************************
SET /P menunr=数字を入力してください:
IF %menunr%==1 (goto CHECKUPDATE)
IF %menunr%==2 (goto FRAMRES )
IF %menunr%==3 (goto SETDIR)
IF %menunr%==4 (goto LOGR)
IF %menunr%==5 (goto ABOUT)
IF %menunr%==00 (goto QUIT)

:WHAT
ECHO ************************************************************************************
ECHO *                                                                                  *
ECHO *    You went crazy and entered something that wasn't part of the menu options     *
ECHO *                                                                                  *
ECHO ************************************************************************************
PAUSE
goto RESTART
:ERRADB
cls
ECHO ************************************************************************************
ECHO *                                                                                  *
ECHO *  Adb was not found, you will not be able to manipulate the files on your phone   *
ECHO *                                                                                  *
ECHO ************************************************************************************
PAUSE
goto RESTART
:LOGR
cd other
Start "Read The Log - Main script is still running, close this to return" signer 4
goto RESTART
:CHECKUPDATE
ECHO Please Wait while we CHECK FOR UPDATES
IF EXIST apkver.txt (del apkver.txt)
other\wget http://update.apkmultitool.com/apkver.txt
cls
IF NOT EXIST apkver.txt (goto :RESTART)
set /a bool = 0
set info = ""
for /f "tokens=*" %%a in (apkver.txt) do (
if !bool!==0 set /a tmpv=%%a
if !bool!==1 set info=!info!%%a
set /a bool = 1
)
del apkver.txt
rem Apk Multi-tool version code
set /a ver = 1
if /I %tmpv% EQU %ver% (goto :NOUPDATE)
if /I %tmpv% GTR %ver% (
wget http://update.apkmultitool.com/updates.txt
cls
IF EXIST updates.txt (
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                           NEW UPDATES FOUND                                     *
ECHO *                                                                                 *
ECHO ***********************************************************************************
PAUSE
goto changed
:regoto
PAUSE
Start cmd /c other\signer 3
exit
)
)
:NOUPDATE
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                            NO UPDATES FOUND                                     *
ECHO *                                                                                 *
ECHO ***********************************************************************************
PAUSE
goto RESTART
:SETDIR
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                          Creating project folder                                *
ECHO *                                                                                 *
ECHO ***********************************************************************************
mkdir projects
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                     Creating place-apk-here-for-modding folder                  *
ECHO *                                                                                 *
ECHO ***********************************************************************************
mkdir place-apk-here-for-modding
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                     Creating place-ogg-here folder                              *
ECHO *                                                                                 *
ECHO ***********************************************************************************
mkdir place-ogg-here
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                  Creating place-apk-here-to-batch-optimize folder               *
ECHO *                                                                                 *
ECHO ***********************************************************************************
mkdir place-apk-here-to-batch-optimize
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                     Creating place-apk-here-for-signing folder                  *
ECHO *                                                                                 *
ECHO ***********************************************************************************
mkdir place-apk-here-for-signing
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                 Creating moving to THEME PORTER to Setup Folders                *
ECHO *                                                                                 *
ECHO ***********************************************************************************
cd themer
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                          Creating transferred folder                            *
ECHO *                                                                                 *
ECHO ***********************************************************************************
mkdir transferred
cd "%~dp0"
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                         フォルダの作成完了                                      *
ECHO *                                                                                 *
ECHO ***********************************************************************************
PAUSE
GOTO RESTART
:FRAMRES
set menunr=GARBAGE2
cls
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *                  APK MULTI-TOOLファイルのセットアップ                           *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO * 1. framework-res.apkのインストール     ^| 2. twframework-res.apkのインストール   *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO * 3. com.htc.resources.apkのインストール ^| 4. SystemUI.apkのインストール          *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO * 5. SemcGenericUxpRes.apkのインストール ^| 6. lidroid-res.apkのインストール       *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO * 7. mediatek-res.apkのインストール      ^| 8. framework-miui.apkのインストール    *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO * 9. 端末から必要なファイルを取り出す                                             *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO * 10. メインメニューに戻る                                                        *
ECHO *                                                                                 *
ECHO ***********************************************************************************
ECHO *                                                                                 *
ECHO *  00   終了                                                                      *
ECHO *                                                                                 *
ECHO ***********************************************************************************
SET /P menunr=数字を入力してください:
IF %menunr%==1 (goto FRAMRES1)
IF %menunr%==2 (goto FRAMRES2)
IF %menunr%==3 (goto FRAMRES3)
IF %menunr%==4 (goto FRAMRES4)
IF %menunr%==5 (goto FRAMRES5)
IF %menunr%==6 (goto FRAMRES6)
IF %menunr%==7 (goto FRAMRES7)
IF %menunr%==8 (goto FRAMRES8)
IF %menunr%==9 (goto SYSTEMPULL)
IF %menunr%==10 (goto RESTART)
IF %menunr%==00 (goto QUIT)
:WHAT
echo You went crazy and entered something that wasn't part of the menu options
PAUSE
goto FRAMRES
:FRAMRES1
cls
cd other
Start "Installation of framework-res.apk Starting" apkinstall 1
goto FRAMRES
:FRAMRES2
cls
cd other
Start "Installation of twframework-res.apk Starting" apkinstall 2
goto FRAMRES
:FRAMRES3
cls
cd other
Start "Installation of com.htc.resources.apk Starting" apkinstall 3
goto FRAMRES
:FRAMRES4
cls
cd other
Start "Installation of SystemUI.apk Starting" apkinstall 4
goto FRAMRES
:FRAMRES5
cls
cd other
Start "Installation of SemcGenericUxpRes.apk Starting" apkinstall 5
goto FRAMRES
:FRAMRES6
cls
cd other
Start "Installation of lidroid-res.apk Starting" apkinstall 6
goto FRAMRES
:FRAMRES7
cls
cd other
Start "Installation of mediatek-res.apk Starting" apkinstall 7
goto FRAMRES
:FRAMRES8
cls
cd other
Start "Installation of framework-miui.apk Starting" apkinstall 8
goto FRAMRES
:SYSTEMPULL
cd other
Start "Pulling of the Android Dependencies Starting" system
goto FRAMRES
:ABOUT
cls
ECHO *********************************************************************************
ECHO *                                                                               *
ECHO *                                   About                                       *
ECHO *                                                                               *
ECHO *********************************************************************************
ECHO *                                                                               *
type other\version.txt
ECHO *                                                                               *
ECHO *********************************************************************************
ECHO *                                                                               *
ECHO *                                   Tips                                        *
ECHO *                                                                               *
ECHO *********************************************************************************
ECHO *                                                                               *
ECHO * (a) If you see errors while this script is running please make sure all that  *
ECHO *     files are in there proper location if not uninstall and try again         *
ECHO *                                                                               *
ECHO *********************************************************************************
ECHO *                                                                               *
ECHO * (b) This tool was by no means created to hack or be used for piracy of apps   *
ECHO *                                                                               *
ECHO *********************************************************************************
ECHO *                                                                               *
ECHO * If you are stuck and the log does not give you any indication as to what you  *
ECHO * are doing wrong, then post in the thread                                      *
ECHO * http://forum.xda-developers.com/showthread.php?t=1460400                      *
ECHO * Make sure you include your setuplog.txt if available.                         *
ECHO *                                                                               *
ECHO *********************************************************************************
PAUSE
goto RESTART
:CHANGED
echo The Following Was Updated : 
echo.
set /a cc = 1
:recursive
for /f "tokens=%cc% delims=\" %%b in ('echo %info%') do (
echo %%b
set /a cc = %cc% + 1
goto recursive
)
echo.
goto recall
:endloop
goto quit
:QUIT
exit
:END
exit