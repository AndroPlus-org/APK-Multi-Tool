@ECHO off
setlocal enabledelayedexpansion
COLOR 0A
IF (%1)==(0) goto skipme
IF (%1) neq () goto adbi
ECHO -------------------------------------------------------------------------- >> APK-Multi-Tool.log
ECHO ^|%date% -- %time%^| >> APK-Multi-Tool.log
ECHO -------------------------------------------------------------------------- >> APK-Multi-Tool.log
Script 0 2>> APK-Multi-Tool.log
:error
:skipme
cd "%~dp0"
mode con:cols=140 lines=40
CLS
set usrc=0
set resusrc=0
set dec=0
set capp=None
set heapy=1024
set jar=0
java -version 
IF errorlevel 1 goto errjava
"%~dp0other\adb.exe" version 
IF errorlevel 1 goto erradb
set /A count=0
FOR %%F IN (place-apk-here-for-modding/*.apk) DO (
set /A count+=1
set tmpstore=%%~nF%%~xF
)
FOR %%F IN (place-apk-here-for-modding/*.jar) DO (
set /A count+=1
set tmpstore=%%~nF%%~xF
)
IF %count%==1 (set capp=%tmpstore%)
:skipme2
CLS
ECHO ***************************************************************************************
ECHO *                              APKTOOL MULTI-TOOLS                                    *
ECHO ***************************************************************************************
ECHO *                    Written By Gerald Wayne Baggett Jr {Raziel23x}                   *
ECHO ***************************************************************************************
ECHO *                           Website: http://apkmultitool.com                          *
ECHO ***************************************************************************************
ECHO *           Empowering you to Do Your BEST where ever the path may lead you           *
ECHO ***************************************************************************************
ECHO *  Whether you're doing basic image editing or editing the smali or XML files, on     *
ECHO *  average u have to use (Brut.all or JF's smali/baksmali) awesome tool to extract    *
ECHO *  the apk, edit it, then sign the apk and then adb push/install it. This process is  * 
ECHO *  quite tiresome if you are testing a method that needs fine tweaking.               *
ECHO ***************************************************************************************
ECHO *  This script should make the process a LOT smoother.                                *
ECHO *  There is an option of compiling/signing/installing all in one step                 *
ECHO ***************************************************************************************
ECHO *  Special Thanks:                                                                    *
ECHO ***************************************************************************************
ECHO *  Goes to Daneshm90 the Original Writer of Apk Manager                               *
ECHO *  Goes to Brut.all for his awesome tool.                                             *
ECHO *  Goes to iBotPeaches for his awesome updates to Brut.all awesome tool.              *
ECHO *  Goes to JF for of course, smali/baksmali                                           *
ECHO ***************************************************************************************
ECHO *  Private Testers and Special Thanks:                                                *
ECHO ***************************************************************************************
ECHO *  Windows Testers:                                                                   *
ECHO ***************************************************************************************
ECHO *  Goes to Purian23 and sga999                                                        *
ECHO ***************************************************************************************
ECHO PAUSE
CLS
:restart
IF %dec%==0 (set decs=Sources and Resources Files)
IF %dec%==1 (set decs=Source Files only)
IF %dec%==2 (set decs=Resource Files only)
IF %dec%==3 (set decs=Raw Format Only)
cd "%~dp0"
set menunr=GARBAGE
CLS
ECHO  --------------------------------------------------------------------------------------------------------------------------
ECHO ^| ���k���x��: %usrc% ^| Resources.arsc���k���x��: %resusrc% ^| �q�[�v�T�C�Y: %heapy%mb ^|  
ECHO  --------------------------------------------------------------------------------------------------------------------------
ECHO ^| �f�R���p�C�� : %decs% ^| ���݂̃v���W�F�N�g: %capp% ^|
ECHO  --------------------------------------------------------------------------------------------------------------------------
ECHO                                                    HTTP://APKMULTITOOL.COM
ECHO  ----------------------------------         ------------------------------------        -----------------------------------
ECHO  �摜�ҏW�ȂǃV���v���ȃ^�X�N               �R�[�h�ҏW�ȂǍ��x�ȃ^�X�N                  �e�[�}�[�����̃c�[��
ECHO  ----------------------------------         ------------------------------------        -----------------------------------
ECHO  0    adb pull                              9    apk�̃f�R���p�C��                      16   �e�[�}�摜�ꊇ�]��
ECHO  1    apk�̒��o                             10   apk�̃f�R���p�C��  (�ˑ��֌W�܂�)           (�g���O�ɐ�����ǂ�ł�������)
ECHO  2    �����摜�̍œK��                           (�v���v���C�G�^����ROM apk����)
ECHO  3    apk��zip���k                          11   �V�X�e��apk�̃R���p�C��                17   apk�̈ꊇ�f�R���p�C��                  
ECHO  4    �e�X�g�L�[��apk������                 12   ��ʓI��apk�̃R���p�C��                18   apk�̈ꊇ�R���p�C��                         
ECHO       (��ʓI��apk����)                     13   Play�X�g�A�Ή��L�[��apk������
ECHO  5    Zipalign apk (apk�쐬/�������Ɏ��s)        (JAVA JDK�K�{)
ECHO  6    apk�̃C���X�g�[��                     14   apk�̃C���X�g�[��
ECHO       (�V�X�e��apk��adb push��)             15   apk�̃R���p�C�� / ���� / �C���X�g�[��
ECHO  7    apk��zip���k / ���� / �C���X�g�[��         (�V�X�e��apk�ȊO����)
ECHO  8    adb push (�V�X�e��apk����)
ECHO  -----------
ECHO  �c�[��
ECHO  -----------
ECHO  19   apk�̈ꊇ�œK�� (place-apk-here-to-batch-optimize�t�H���_���̂�)
ECHO  20   apk�̏���(�ꊇ����Ή�)(place-apk-here-for-signing�t�H���_���̂�)
ECHO  21   ogg�t�@�C���̈ꊇ�œK�� (place-ogg-here�t�H���_���̂�)
ECHO  22   �t�@�C���ƃt�H���_�̑|��
ECHO  23   apk�̈��k���x���̑I��
ECHO  24   resources.arsc�̈��k���x���̑I��
ECHO  25   �ő僁�����T�C�Y�̃Z�b�g(�f�R���p�C��/�R���p�C�����ɓ��삪��~�����Ƃ������ύX���Ă�������)
ECHO  26   ���O��\��
ECHO  27   ���݂̃v���W�F�N�g�̃Z�b�g
ECHO  28   �c�[�����/�f�o�b�O���
ECHO  29   �f�R���p�C�����[�h�̕ύX (APK��JAR�����S�Ƀf�R���p�C������E
ECHO       �\�[�X�����f�R���p�C������E���\�[�X�����f�R���p�C������ERAW�_���v����̒�����I�ׂ܂�)
ECHO  30   ��t
ECHO  00   �I��
ECHO  -------------------------------------------------------------------------------
SET /P menunr=��������͂��Ă�������:

IF %menunr%==0 (goto ap)
IF %menunr%==1 (goto ex)
IF %menunr%==2 (goto opt)
IF %menunr%==3 (goto zip)
IF %menunr%==4 (goto stki)
IF %menunr%==5 (goto zipa)
IF %menunr%==6 (goto ins)
IF %menunr%==7 (goto alli)
IF %menunr%==8 (goto apu)
IF %menunr%==9 (goto de)
IF %menunr%==10 (goto ded)
IF %menunr%==11 (goto syscom)
IF %menunr%==12 (goto nonsyscom)
IF %menunr%==13 (goto apksignerkey)
IF %menunr%==14 (goto ins)
IF %menunr%==15 (goto all)
IF %menunr%==16 (goto btit)
IF %menunr%==17 (goto batdec)
IF %menunr%==18 (goto batcom)
IF %menunr%==19 (goto bopt)
IF %menunr%==20 (goto asi)
IF %menunr%==21 (goto ogg)
IF %menunr%==22 (goto cleanp)
IF %menunr%==23 (goto usrcomp)
IF %menunr%==24 (goto resusrcomp)
IF %menunr%==25 (goto heap)
IF %menunr%==26 (goto logr)
IF %menunr%==27 (goto filesel)
IF %menunr%==28 (goto about)
IF %menunr%==29 (goto switchc)
IF %menunr%==30 (goto dotome)
IF %menunr%==00 (goto quit)
IF %capp%==None goto noproj

:WHAT
ECHO ���j���[�ɂȂ������ł��B
PAUSE
goto restart
:switchc
set /a dec+=1 
IF (%dec%)==(4) (set /a dec=0)
goto restart
:cleanp
ECHO 1. ���̃v���W�F�N�g�̃t�H���_��|��
ECHO 2. place-apk-here-for-modding�t�H���_��|��
ECHO 3. place-ogg-here�t�H���_��|��
ECHO 4. place-apk-here-to-batch-optimize�t�H���_��|��
ECHO 5. place-apk-here-for-signing�t�H���_��|��
ECHO 6. projects�t�H���_��|��
ECHO 7. �S�Ẵt�@�C��/�t�H���_��|��
ECHO 8. ���C�����j���[�ɖ߂�
SET /P menuna=��������͂��Ă�������:
ECHO �|����
IF %menuna%==1 (
IF %capp%==None goto noproj
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects\%capp% > nul
mkdir projects\%capp%
)
IF %menuna%==2 (
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q place-apk-here-for-modding > nul
mkdir place-apk-here-for-modding
)
IF %menuna%==3 (
rmdir /S /Q place-ogg-here > nul
mkdir place-ogg-here
)
IF %menuna%==4 (
rmdir /S /Q place-apk-here-to-batch-optimize > nul
mkdir place-apk-here-to-batch-optimize
)
IF %menuna%==5 (
rmdir /S /Q place-apk-here-for-signing > nul
mkdir place-apk-here-for-signing
)
IF %menuna%==7 (
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects\%capp% > nul
mkdir projects\%capp%
rmdir /S /Q place-apk-here-for-modding > nul
mkdir place-apk-here-for-modding
rmdir /S /Q place-ogg-here > nul
mkdir place-ogg-here
rmdir /S /Q place-apk-here-to-batch-optimize > nul
mkdir place-apk-here-to-batch-optimize
rmdir /S /Q place-apk-here-for-signing > nul
mkdir place-apk-here-for-signing
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects > nul
mkdir projects
)
IF %menuna%==6 (
rmdir /S /Q %userprofile%\apktool > nul
rmdir /S /Q projects > nul
mkdir projects
)
goto restart
:about
CLS
ECHO About
ECHO -----
type other\version.txt
ECHO Updates and Support Site
ECHO Please Visit the Official Website for updated information and to check out the latest official releases
ECHO The Website Address is http://apkmultitool.com
ECHO ----
ECHO Tips
ECHO ----
ECHO 1. IF Modifying system apps, never resign them unless you want to resign all
ECHO apk's that share its shared:uid
ECHO 2. IF decompiling/recompiling system apps and IF AndroidManifest.xml was not
ECHO preserved from the original apk, then either push the apk when in recovery or
ECHO by doing :
ECHO adb remount
ECHO adb shell stop
ECHO adb push something.apk /wherever/something.apk
ECHO adb shell start
ECHO 3. Decompiling a themed apk is not possible, you must get the original unthemed
ECHO apk, then decompile, make your theme/xml changes and recompile
ECHO 4. IF you're stuck and the log does not give you any indication as to what you 
ECHO are doing wrong, then post in the thread http://forum.xda-developers.com/showthread.php?t=1310151
ECHO Make sure you include your APK-Multi-Tool.log, and IF its not a editing problem i.e 
ECHO its something regarding when you push it to your phone, then post your adb log 
ECHO as well. To do so 
ECHO follow these steps :
ECHO 1. Connect your phone to your pc
ECHO 2. Push/install the app on your phone
ECHO 3. Select "Create Log" option on this menu
ECHO 4. Let the new window run for 10 seconds, then close it
ECHO Once done, you will find a adblog.txt in the root folder
ECHO Upload that as well.
ECHO.
ECHO 1. ���O���쐬
ECHO 2. ���C�����j���[�ɖ߂�
SET /P menunr=��������͂��Ă�������:
IF %menunr%==1 (Start "Adb Log" other\signer 2)
goto restart
:portapk
ECHO apk���ď������ē��삷�邩�m�F���܂��B
ECHO �C���X�g�[���ł��܂����� (y/n) ^?
ECHO shared uid��T���A��������΍폜���܂��B
:filesel
CLS
set /A count=0
FOR %%F IN (place-apk-here-for-modding/*.apk) DO (
set /A count+=1
set a!count!=%%F
IF /I !count! LEQ 9 (ECHO ^- !count!  - %%F )
IF /I !count! GTR 10 (ECHO ^- !count! - %%F )
)
FOR %%F IN (place-apk-here-for-modding/*.jar) DO (
set /A count+=1
set a!count!=%%F
IF /I !count! LEQ 9 (ECHO ^- !count!  - %%F )
IF /I !count! GTR 10 (ECHO ^- !count! - %%F )
)
ECHO.
ECHO ���݂̃v���W�F�N�g�Ƃ��ăZ�b�g����t�@�C����I��ł��������B
set /P INPUT=���������: %=%
IF /I %INPUT% GTR !count! (goto chc)
IF /I %INPUT% LSS 1 (goto chc)
set capp=!a%INPUT%!
set jar=0
set ext=jar
IF "!capp:%ext%=!" NEQ "%capp%" set jar=1
goto restart
:chc
set capp=None
goto restart

:heap
set /P INPUT=Java�q�[�v�T�C�Y�̍ő吔�����K�o�C�g�œ��͂��Ă������� (��: 512) : %=%
set heapy=%INPUT%
CLS
goto restart
:usrcomp
set /P INPUT=���k���x������͂��Ă�������(0-9) : %=%
set usrc=%INPUT%
CLS
goto restart
:resusrcomp
set /P INPUT=���k���x������͂��Ă�������(0-9) : %=%
set resusrc=%INPUT%
CLS
goto restart
:btit
ECHO Batch Theme Image Transfer TOOL
ECHO Experimental use with caution
ECHO This tool makes the process of transferring images from one APK file to another 
ECHO APK File of the same file making it easier to update themes or even transferring
ECHO a theme update.zip of one ROM to another Rom allowing the porting of theme to
ECHO be much faster.
ECHO (Note: You will have to manually replace the progress_horizontals.xml from the
ECHO framework-res since this file is needed with Theme Changes)
PAUSE
cd themer
Start "Beginning porting of themes" tporter
goto restart
:batdec
cls
ECHO This will Decompile all the APK files inside of the place-apk-here-for-modding
ECHO and add the Decompiled Versions into the Project folder as if you decompiled
ECHO all the APK FILES one at a time using option 9
PAUSE
cd other
Start "Beginning Batch Decompiling of all the APK Files" batdecomp
goto restart
:batcom
cls
ECHO This will Compile all the APK files inside of the project folder
ECHO and add the Compiled Versions into the place-apk-here-for-signing folder as if you 
ECHO compiled all the APK FILES one at a time using option 12 sub option 2
PAUSE
cd other
Start "Beginning Batch Compiling of all the APK Files" batcomp
goto restart
:ogg
cd other
mkdir temp
ECHO Optimizing Ogg
FOR %%F IN ("%~dp0place-ogg-here/*.ogg") DO sox "%~dp0place-ogg-here/%%F" -C 0 "temp\%%F"
cd ..
MOVE other\temp\*  place-ogg-here
rmdir /S /Q other\temp
goto restart
:alli
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
CLS
ECHO 1 System apk (Retains signature)
ECHO 2 Regular apk (Removes signature for re-signing)
SET /P menunr=��������͂��Ă�������: 
IF %menunr%==1 (goto sys1)
IF %menunr%==2 (goto oa1)
:sys1
ECHO Zipping Apk
cd other
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/%capp%/*" -mx%usrc%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
cd ..
goto si1
:oa1
cd other
ECHO Zipping Apk
rmdir /S /Q "%~dp0out/META-INF"
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/%capp%/*" -mx%usrc%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
cd ..
:si1
cd other
ECHO Signing Apk
java -Xmx%heapy%m -jar signapk.jar -w testkey.x509.pem testkey.pk8 %~dp0place-apk-here-for-signing/unsigned%capp% %~dp0place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
DEL /Q "%~dp0place-apk-here-for-signing/unsigned%capp%"
cd ..
:ins1
ECHO Waiting for device
"%~dp0other\adb.exe" wait-for-device
ECHO Installing Apk
"%~dp0other\adb.exe" install -r %~dp0place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
goto restart
:asi
cd other
DEL /Q "%~dp0place-apk-here-for-signing/signed.apk"
FOR %%F in (%~dp0place-apk-here-for-signing/*) DO call signer "%%F"
cd ..
goto restart
:bopt
CLS
ECHO Welcome to the Batch Optimization Menu
ECHO You have one of three options
ECHO 1 Batch Zipalign
ECHO 2 Batch Optimize PNG Files
ECHO 3 Batch Optimize PNG Files as well as ZIPALIGN APK files afterword.
set /P INPUTBO=Type input 1 - 3: %=%
if %INPUTBO%==1 GOTO zipo
if %INPUTBO%==2 GOTO ponly
if %INPUTBO%==3 GOTO zipb
:WHAT
ECHO You went crazy and entered something that wasn't part of the menu options
PAUSE
goto bopt
:zipo
cd place-apk-here-to-batch-optimize
Start "Starting Batch Zipalign of APK Files" batchzip01.bat
goto restart
:ponly
cd place-apk-here-to-batch-optimize
Start "Starting Batch Optimize of PNG Files" batchopt01.bat
goto restart
:zipb
cd place-apk-here-to-batch-optimize
Start "Starting Batch Optimize of PNG Files as well as Zipalign of APK Files " batchopt02.bat
goto restart
:dirnada
ECHO %capp% has not been extracted, please do so before doing this step
PAUSE
goto restart
:opt
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
mkdir temp
xcopy "%~dp0projects\%capp%\res\*.9.png" "%~dp0temp" /S /Y
cd other
ECHO Optimizing Png's
roptipng -o99 "%~dp0projects/%capp%/**/*.png"
cd ..
xcopy "%~dp0temp" "%~dp0projects\%capp%\res" /S /Y
rmdir temp /S /Q
goto restart
:noproj
ECHO Please Select A Project To Work On (Option #27)
PAUSE
goto restart
:ap
ECHO Where do you want adb to pull the apk from? 
ECHO Example of input : /system/app/launcher.apk
set /P INPUT=���͂��Ă�������: %=%
ECHO Pulling apk
"%~dp0other\adb.exe" pull %INPUT% "%~dp0place-apk-here-for-modding\something.apk"
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
goto restart
)
set jar=0
set ext=jar
IF "!INPUT:%ext%=!" NEQ "%INPUT%" set jar=1
:renameagain
ECHO What file name would you like this app to be stored as ?
ECHO Eg (launcher.apk)
set /P INPUT=���͂��Ă�������: %=%
IF EXIST "%~dp0place-apk-here-for-modding\%INPUT%" (
ECHO File Already Exists, Try Another Name
PAUSE
goto renameagain)
rename "%~dp0place-apk-here-for-modding\something.apk" %INPUT%
ECHO Would you like to set this as your current project (y/n)?
set /P inab=���͂��Ă�������: %=%
IF %inab%==y (set capp=%INPUT%)
goto restart
:apu
ECHO Do you want to keep the file name ? (any key for yes, n for no)
set /p INPUT=""
if %INPUT%==n (
ECHO "Enter the new name: "
set /P newcapp=���͂��Ă�������: %=%
set newname=1
goto push_dir
)
set newname=0 
 
:push_dir
ECHO Where do you want adb to push to ? (f) for framework and (a) for app
set /P fileloc=""
"%~dp0other\adb.exe" devices >null
"%~dp0other\adb.exe" remount
ECHO Pushing apk
if %fileloc%==a (
if %newname%==0 (
"%~dp0other\adb.exe" push "modified-system-apk-files-here\system%capp%" /system/app/%capp%
goto chk_err_push
)
if %newname%==1 (
"%~dp0other\adb.exe" push "modified-system-apk-files-here\system%capp%" /system/app/%newcapp%
goto chk_err_push
)
)
if %fileloc%==f (
if %newname%==0 (
"%~dp0other\adb.exe" push "modified-system-apk-files-here\system%capp%" /system/framework/%capp%
goto chk_err_push
)
if %newname%==1 (
"%~dp0other\adb.exe" push "modified-system-apk-files-here\system%capp%" /system/framework/%newcapp%
goto chk_err_push
)
)
ECHO "u pressed the wrong key"
goto push_dir

:chk_err_push
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
goto restart
:zipa
ECHO Zipaligning Apk
IF EXIST "%~dp0place-apk-here-for-signing\signed%capp%" ("%~dp0other\zipalign.exe" -f 4 "%~dp0place-apk-here-for-signing\signed%capp%" "%~dp0place-apk-here-for-modding\signedaligned%capp%")

IF EXIST "%~dp0place-apk-here-for-signing\unsigned%capp%" ("%~dp0other\zipalign.exe" -f 4 "%~dp0place-apk-here-for-signing\unsigned%capp%" "%~dp0place-apk-here-for-signing\unsignedaligned%capp%")

IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
DEL /Q "%~dp0place-apk-here-for-signing\signed%capp%"
DEL /Q "%~dp0place-apk-here-for-signing\unsigned%capp%"
rename "%~dp0place-apk-here-for-signing\signedaligned%capp%" signed%capp%
rename "%~dp0place-apk-here-for-signing\unsignedaligned%capp%" unsigned%capp%
goto restart
:ex
cd other
ECHO Extracting apk
IF EXIST "%~dp0projects/%capp%" (rmdir /S /Q "%~dp0projects/%capp%")
7za x -o"%~dp0projects/%capp%" "%~dp0place-apk-here-for-modding/%capp%"
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
cd ..
goto restart
:zip
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
CLS
ECHO 1 System apk (Retains signature)
ECHO 2 Regular apk (Removes signature for re-signing)
SET /P menunr=��������͂��Ă�������: 
IF %menunr%==1 (goto sys)
IF %menunr%==2 (goto oa)
:sys
ECHO Zipping Apk
cd other
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/%capp%/*" -mx%usrc%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)

cd ..
goto restart
:oa
cd other
ECHO Zipping Apk
rmdir /S /Q "%~dp0out/META-INF"
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/%capp%/*" -mx%usrc%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)

cd ..
goto restart
:ded
cd other
IF EXIST "%~dp0place-apk-here-for-signing\unsigned%capp%" (del /Q "%~dp0place-apk-here-for-signing\unsigned%capp%")
:temr
ECHO �ˑ��֌W�ɂ���apk���h���b�O���h���b�v���邩���̃p�X����͂��Ă��������B
ECHO �Ⴆ��Rosie.apk���f�R���p�C������ɂ�com.htc.resources.apk���h���b�O���h���b�v���܂��B
set /P INPUT=���͂��Ă�������: %=%
java -jar apktool.jar IF %INPUT%
IF NOT EXIST "%userprofile%\apktool\framework\2.apk" (
ECHO.
ECHO "�ˑ��֌W�ł͂���܂���A����apk����������������"
goto temr
)
IF (%jar%)==(0) (ECHO apk�̃f�R���p�C���� %decs%)
IF (%jar%)==(1) (ECHO jar�̃f�R���p�C���� %decs%)
IF (%dec%)==(0) (java -Xmx%heapy%m -jar apktool.jar d %~dp0place-apk-here-for-modding/%capp% -o %~dp0projects/%capp%)
IF (%dec%)==(1) (java -Xmx%heapy%m -jar apktool.jar d -r %~dp0place-apk-here-for-modding/%capp% -o %~dp0projects/%capp%)
IF (%dec%)==(2) (java -Xmx%heapy%m -jar apktool.jar d -s %~dp0place-apk-here-for-modding/%capp% -o %~dp0projects/%capp%)
IF (%dec%)==(3) (java -Xmx%heapy%m -jar apktool.jar d -r -s %~dp0place-apk-here-for-modding/%capp% -o %~dp0projects/%capp%)

IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
cd ..
goto opeproj
:de
cd other
IF EXIST "%~dp0place-apk-here-for-signing/system%capp%" (del /Q "%~dp0place-apk-here-for-signing\system%capp%")
IF EXIST "%~dp0place-apk-here-for-signing/unsigned%capp%" (del /Q "%~dp0place-apk-here-for-signing\unsigned%capp%")
IF EXIST "%~dp0place-apk-here-for-signing/signed%capp%" (del /Q "%~dp0place-apk-here-for-signing\signed%capp%")

IF EXIST "%~dp0projects/%capp%" (rmdir /S /Q "%~dp0projects/%capp%")
IF (%jar%)==(0) (ECHO apk�̃f�R���p�C���� %decs%)
IF (%jar%)==(1) (ECHO jar�̃f�R���p�C���� %decs%)
IF (%dec%)==(0) (java -Xmx%heapy%m -jar apktool.jar d %~dp0place-apk-here-for-modding/%capp% -o %~dp0projects/%capp%)
IF (%dec%)==(1) (java -Xmx%heapy%m -jar apktool.jar d -r %~dp0place-apk-here-for-modding/%capp% -o %~dp0projects/%capp%)
IF (%dec%)==(2) (java -Xmx%heapy%m -jar apktool.jar d -s %~dp0place-apk-here-for-modding/%capp% -o %~dp0projects/%capp%)
IF (%dec%)==(3) (java -Xmx%heapy%m -jar apktool.jar d -r -s %~dp0place-apk-here-for-modding/%capp% -o %~dp0projects/%capp%)

IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
cd ..
goto opeproj
:opeproj
CLS
ECHO %capp% �̃f�R���p�C�����������܂����Bprojects\%capp%�t�H���_���J���܂���?
ECHO (Y)�͂� (N)������
set /P INPUT1=���͂��Ă�������: %=%
IF %INPUT1%==y (call :opeproj01)
IF %INPUT1%==n (call :opeproj02)
:opeproj01
start "" "%~dp0projects/%capp%"
goto restart
:opeproj02
goto restart
:syscom
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
cd other
IF (%jar%)==(0) (ECHO apk�̃r���h��)
IF (%jar%)==(1) (ECHO jar�̃r���h��)
mkdir modified-system-apk-files-here
IF EXIST "%~dp0modified-system-apk-files-here\system%capp%" (del /Q "%~dp0modified-system-apk-files-here\system%capp%")
java -Xmx%heapy%m -jar apktool.jar b "%~dp0projects/%capp%" -o "%~dp0modified-system-apk-files-here\system%capp%"
IF (%jar%)==(0) (goto :nojar)
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-modding/%capp%" META-INF -r
7za a -tzip "%~dp0modified-system-apk-files-here/system%capp%" "%~dp0projects/temp/*" -mx%usrc% -r
rmdir /S /Q "%~dp0%~dp0projects/temp"
goto restart

:nojar
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
goto restart
)
:nq1
ECHO �G���[��h�~���邽�ߌ���apk����
ECHO �ҏW���Ă��Ȃ��t�@�C�����R�s�[���܂���"?^(y/n^)
set /P INPUT1=���͂��Ă�������: %=%
IF %INPUT1%==y (call :syscom01)
IF %INPUT1%==n (call :syscom02)
:syscom01
rmdir /S /Q "%~dp0keep"
7za x -o"%~dp0keep" "%~dp0place-apk-here-for-modding/%capp%"
ECHO APK Multi-Tools�t�H���_��keep�t�H���_���쐬���܂����B
ECHO �ҏW�����t�@�C�����폜���A�ҏW���Ă��Ȃ��t�@�C����
ECHO ���̂܂܂ɂ��Ă��������B
ECHO xml�t�@�C����ҏW�����ꍇ��resources.arsc���폜���A
ECHO smali�t�@�C����ҏW�����ꍇ��classes.dex���폜���Ă��������B
ECHO ����������Enter�L�[�������Ă��������B
PAUSE
7za a -tzip "%~dp0modified-system-apk-files-here/system%capp%" "%~dp0keep/*" -mx%usrc% -r
rmdir /S /Q "%~dp0keep"
7za x -o"%~dp0projects/temp" "%~dp0modified-system-apk-files-here/system%capp%" resources.arsc -r
7za a -tzip "%~dp0modified-system-apk-files-here/system%capp%" "%~dp0projects/temp/resources.arsc" -mx%resusrc% -r
rmdir /S /Q "%~dp0projects/temp"
cd ..
goto restart
:syscom02
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-modding/%capp%" META-INF -r
7za a -tzip "%~dp0modified-system-apk-files-here/system%capp%" "%~dp0projects/temp/*" -mx%usrc% -r
rmdir /S /Q "%~dp0projects/temp"
goto syscom03
:syscom03
CLS
ECHO AndroidManifest.xml������%capp%"����R�s�[���܂���?
ECHO (Y)�͂� (N)������
set /P INPUT1=���͂��Ă�������: %=%
IF %INPUT1%==y (call :syscom04)
IF %INPUT1%==n (call :syscom05)
:syscom04
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-modding/%capp%" AndroidManifest.xml -r
7za a -tzip "%~dp0modified-system-apk-files-here/system%capp%" "%~dp0projects/temp/AndroidManifest.xml" -mx%usrc% -r
rmdir /S /Q "%~dp0projects/temp"
goto restart
:syscom05
goto restart
:nonsyscom
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
cd other
IF (%jar%)==(0) (ECHO Building Apk)
IF (%jar%)==(1) (ECHO Building Jar)
IF EXIST "%~dp0place-apk-here-for-signing\unsigned%capp%" (del /Q "%~dp0place-apk-here-for-signing\unsigned%capp%")
IF EXIST "%~dp0place-apk-here-for-signing\OriginalSignedKey%capp%" (del /Q "%~dp0place-apk-here-for-signing\OriginalSignedKey%capp%")
java -Xmx%heapy%m -jar apktool.jar b "%~dp0projects/%capp%" -o "%~dp0place-apk-here-for-signing\unsigned%capp%"
IF (%jar%)==(0) (goto :nojar2)
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-modding/%capp%" META-INF -r
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/temp/*" -mx%usrc% -r
rmdir /S /Q "%~dp0%~dp0projects/temp"
goto restart

:nojar2
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
goto restart
)
:nq4
CLS
ECHO  ---------------------------------------------------------------------------
ECHO 1. keep�t�H���_�I�v�V�������g���Ė�������apk���쐬
ECHO 2. ����AndroidManifest.xml���g���Ė�������apk���쐬
ECHO 3. ��������apk���쐬
ECHO *����* �I�v�V����4-6�͎����I�Ȃ̂Œ��ӂ��Ă������� *����*
ECHO 4. keep�t�H���_�I�v�V�������g���Č��̏������g����apk���쐬
ECHO 5. ���̏������g����apk���쐬
ECHO 6. ���̏�����AndroidManifest.xml���g����apk���쐬
ECHO *����* �I�v�V����4-6�͎����I�Ȃ̂Œ��ӂ��Ă������� *����*
ECHO  ---------------------------------------------------------------------------
set /P INPUT=1 - 6�̂ǂꂩ����͂��Ă�������: %=%
IF %INPUT%==1 (call :unsign01)
IF %INPUT%==2 (call :unsign02)
IF %INPUT%==3 (call :unsign03)
IF %INPUT%==4 (call :sign01)
IF %INPUT%==5 (call :sign02)
IF %INPUT%==6 (call :sign03)
:unsign01
rmdir /S /Q "%~dp0keep"
7za x -o"%~dp0keep" "%~dp0place-apk-here-for-modding/%capp%"
rmdir /S /Q "%~dp0keep/META-INF/"
ECHO APK Multi-Tools�t�H���_��keep�t�H���_���쐬���܂����B
ECHO �ҏW�����t�@�C�����폜���A�ҏW���Ă��Ȃ��t�@�C����
ECHO ���̂܂܂ɂ��Ă��������B
ECHO xml�t�@�C����ҏW�����ꍇ��resources.arsc���폜���A
ECHO smali�t�@�C����ҏW�����ꍇ��classes.dex���폜���Ă��������B
ECHO ����������Enter�L�[�������Ă��������B
PAUSE
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0keep/*" -mx%usrc% -r
rmdir /S /Q "%~dp0keep"
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-signing/unsigned%capp%" resources.arsc -r
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/temp/resources.arsc" -mx%resusrc% -r
rmdir /S /Q "%~dp0projects/temp"
cd ..
PAUSE
goto restart
:unsign03
goto restart
:unsign02
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-modding/%capp%" AndroidManifest.xml -r
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/temp/AndroidManifest.xml" -mx%usrc% -r
rmdir /S /Q "%~dp0projects/temp"
goto restart
:sign01
rmdir /S /Q "%~dp0keep"
7za x -o"%~dp0keep" "%~dp0place-apk-here-for-modding/%capp%"
ECHO APK Multi-Tools�t�H���_��keep�t�H���_���쐬���܂����B
ECHO �ҏW�����t�@�C�����폜���A�ҏW���Ă��Ȃ��t�@�C����
ECHO ���̂܂܂ɂ��Ă��������B
ECHO xml�t�@�C����ҏW�����ꍇ��resources.arsc���폜���A
ECHO smali�t�@�C����ҏW�����ꍇ��classes.dex���폜���Ă��������B
ECHO ����������Enter�L�[�������Ă��������B
PAUSE
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0keep/*" -mx%usrc% -r
rmdir /S /Q "%~dp0keep"
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-signing/unsigned%capp%" resources.arsc -r
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/temp/resources.arsc" -mx%resusrc% -r
rmdir /S /Q "%~dp0projects/temp"
rename "%~dp0place-apk-here-for-signing\unsigned%capp%" "OriginalSignedKey%capp%"
cd ..
PAUSE
goto restart
:sign02
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-modding/%capp%" META-INF -r
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/temp/*" -mx%usrc% -r
rmdir /S /Q "%~dp0projects/temp"
rename "%~dp0place-apk-here-for-signing\unsigned%capp%" "OriginalSignedKey%capp%"
cd ..
PAUSE
goto restart
:sign03
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-modding/%capp%" META-INF -r
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/temp/*" -mx%usrc% -r
7za x -o"%~dp0projects/temp" "%~dp0place-apk-here-for-modding/%capp%" AndroidManifest.xml -r
7za a -tzip "%~dp0place-apk-here-for-signing/unsigned%capp%" "%~dp0projects/temp/AndroidManifest.xml" -mx%usrc% -r
rmdir /S /Q "%~dp0projects/temp"
rename "%~dp0place-apk-here-for-signing\unsigned%capp%" "OriginalSignedKey%capp%"
cd ..
PAUSE
goto restart
:apksignerkey
ECHO *���̋@�\���g���ɂ�Java JDK�����Ă��Ȃ��Ƃ����܂���B*
ECHO *�܂��A���ϐ�JAVA_HOME�̐ݒ���K�v�ł��B�o�[�W������t�H���_���ɂ���ĕς��܂����A*
ECHO *�Ⴆ��C:\Program Files\Java\jdk1.6.0_43�ƃV�X�e�����ϐ��ɐݒ肵�Ă��������B*
ECHO *�ڂ����ݒ���@�͌������Ă��������B*
PAUSE
cd other
ECHO apk�̏�����
set KEYSTORE_FILE=apksigner.keystore
set KEYSTORE_PASS=apksigner
set KEYSTORE_ALIAS=apksigner.keystore
set JAVAC_PATH=%JAVA_HOME%\bin\
set PATH=%PATH%;%JAVAC_PATH%;
call jarsigner -keystore %KEYSTORE_FILE% -storepass %KEYSTORE_PASS% -keypass %KEYSTORE_PASS% -signedjar %~dp0place-apk-here-for-signing/signed%capp% %~dp0place-apk-here-for-signing/unsigned%capp%  %KEYSTORE_ALIAS% %1
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)

DEL /Q "%~dp0place-apk-here-for-signing/unsigned%capp%"
cd ..
goto restart
:stki
cd other
ECHO apk�̏�����
java -Xmx%heapy%m -jar signapk.jar -w testkey.x509.pem testkey.pk8 %~dp0place-apk-here-for-signing/unsigned%capp% %~dp0place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)

DEL /Q "%~dp0place-apk-here-for-signing/unsigned%capp%"
cd ..
goto restart
:ins
ECHO �[����ҋ@��
"%~dp0other\adb.exe" wait-for-device
ECHO apk�̃C���X�g�[����
"%~dp0other\adb.exe" install -r place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
goto restart
:all
IF NOT EXIST "%~dp0projects\%capp%" GOTO dirnada
cd other
ECHO apk�̃r���h��
IF EXIST "%~dp0place-apk-here-for-signing\unsigned%capp%" (del /Q "%~dp0place-apk-here-for-signing\unsigned%capp%")
java -Xmx%heapy%m -jar apktool.jar b "%~dp0projects/%capp%" "%~dp0place-apk-here-for-signing\unsigned%capp%"
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
goto restart
)
ECHO apk�̏�����
java -Xmx%heapy%m -jar signapk.jar -w testkey.x509.pem testkey.pk8 %~dp0place-apk-here-for-signing/unsigned%capp% %~dp0place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
DEL /Q "%~dp0place-apk-here-for-signing/unsigned%capp%"
cd ..
ECHO �[����ҋ@��
"%~dp0other\adb.exe" wait-for-device
ECHO apk�̃C���X�g�[����
"%~dp0other\adb.exe" install -r place-apk-here-for-signing/signed%capp%
IF errorlevel 1 (
ECHO "�G���[���N���܂����B���O���m�F���Ă��������B(�I�v�V����26)"
PAUSE
)
goto restart
:errjava
CLS
ECHO Java��������Ȃ����ߏ����ł��܂���B
PAUSE
goto restart
:erradb
CLS
ECHO adb��������Ȃ����ߒ[���̑���͂ł��܂���B
PAUSE
goto restart
goto skipme2
:adbi
mode con:cols=48 lines=8
ECHO �[����ҋ@��
"%~dp0other\adb.exe" wait-for-device
set count=0
:loop
IF "%~n1"=="" goto :endloop
ECHO %~n1���C���X�g�[����
"%~dp0other\adb.exe" install -r %1
shift
set /a count+=1
goto :loop
:endloop
goto quit

:recursive
for /f "tokens=%cc% delims=\" %%b in ('ECHO %info%') do (
ECHO %%b
set /a cc = %cc% + 1
goto recursive
)
ECHO.
goto recall
:DOTOME
start %~dp0docs\donate.html
cls	
goto restart
:logr
cd other
Start "���O�����Ă������� - ���C���X�N���v�g���܂����s���ł�" signer 1
goto restart
:endab
cd ..
@ECHO �œK������ %~1
PAUSE

:quit
exit

:end
exit