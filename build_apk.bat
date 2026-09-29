@echo off
setlocal
cd /d "%~dp0.."
where flutter >nul 2>nul
if errorlevel 1 (
  echo Flutter was not found in PATH.
  exit /b 1
)
if not exist android\gradlew.bat (
  echo Generating missing Flutter platform wrapper...
  flutter create .
  if errorlevel 1 exit /b 1
)
call flutter pub get
if errorlevel 1 exit /b 1
call flutter build apk --release
if errorlevel 1 exit /b 1
echo.
echo APK: build\app\outputs\flutter-apk\app-release.apk
