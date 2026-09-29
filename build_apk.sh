#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/.."
command -v flutter >/dev/null 2>&1 || { echo "Flutter was not found in PATH."; exit 1; }
if [ ! -f android/gradlew ]; then
  flutter create .
fi
flutter pub get
flutter build apk --release
echo "APK: build/app/outputs/flutter-apk/app-release.apk"
