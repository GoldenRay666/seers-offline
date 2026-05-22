@echo off
REM ===================================================
REM 赛尔号战神联盟 - 离线模式重打包脚本
REM Build offline mode APK
REM ===================================================
REM Prerequisites:
REM   1. Java JDK installed
REM   2. apktool.jar downloaded to C:\javatools\
REM   3. Android SDK or apksigner
REM ===================================================

set APKTOOL=C:\javatools\apktool.jar
set PROJECT_DIR=C:\javatools\1
set OUTPUT_APK=C:\javatools\1_offline.apk
set SIGNED_APK=C:\javatools\1_offline_signed.apk

echo === Step 1: Building APK with apktool ===
java -jar %APKTOOL% b %PROJECT_DIR% -o %OUTPUT_APK%
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: apktool build failed!
    pause
    exit /b 1
)
echo Build successful: %OUTPUT_APK%

echo.
echo === Step 2: Signing APK ===
REM Try apksigner first, then fall back to jarsigner
where apksigner >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    apksigner sign --ks C:\javatools\debug.keystore --ks-pass pass:android --key-pass pass:android %OUTPUT_APK%
    move /Y %OUTPUT_APK%.idsig NUL 2>&1
    copy /Y %OUTPUT_APK% %SIGNED_APK%
) else (
    echo WARNING: apksigner not found, trying jarsigner...
    where jarsigner >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        REM Generate debug keystore if not exists
        if not exist C:\javatools\debug.keystore (
            keytool -genkey -v -keystore C:\javatools\debug.keystore -alias debug -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Debug, OU=Dev, O=Offline, L=City, S=State, C=CN" -storepass android -keypass android
        )
        jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore C:\javatools\debug.keystore -storepass android -keypass android %OUTPUT_APK% debug
        copy /Y %OUTPUT_APK% %SIGNED_APK%
    ) else (
        echo WARNING: No signing tool found. APK is unsigned: %OUTPUT_APK%
        echo You must sign it before installing.
    )
)

if exist %SIGNED_APK% (
    echo Signed APK: %SIGNED_APK%
    echo.
    echo === Step 3: Install to device ===
    where adb >nul 2>&1
    if %ERRORLEVEL% EQU 0 (
        echo Installing to connected device...
        adb install -r %SIGNED_APK%
    ) else (
        echo No adb found. Install %SIGNED_APK% manually.
    )
)

echo.
echo === Done! ===
echo Remember to run mock_server.py first: python3 C:\javatools\1\mock_server.py
pause
