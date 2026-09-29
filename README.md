# A.Y Legend Client — Complete Flutter Android Project

A safe Minecraft Bedrock companion app UI for A.Y Legend branding. It provides a Mod Menu for UI/performance preferences such as Custom HUD, PvP UI, FPS Mode, Low Graphics Mode, Crosshair, Keystrokes HUD and the A.Y Neon Theme.

## Important
This is an Android companion/launcher-style app. It does **not** inject cheats, bypass anti-cheat, or modify the Minecraft engine. Bedrock resource/UI changes still need to be connected to Minecraft separately.

## Build APK
Requirements:
- Flutter SDK (stable)
- Android Studio + Android SDK
- Java 17

From this folder:

```bash
flutter doctor
flutter pub get
flutter run
flutter build apk --release
```

APK output:
`build/app/outputs/flutter-apk/app-release.apk`

If Flutter says the Android platform is incomplete or `gradlew` is missing, run this once from the project root:

```bash
flutter create .
flutter pub get
flutter build apk --release
```

Then the generated Android platform is refreshed while `lib/main.dart` and the project configuration remain available.

## Android Studio
Open this folder as a Flutter project. Let Android Studio install/sync the required Android SDK components, then use **Build > Flutter > Build APK**.

## Features
- A.Y Legend neon UI
- Mod Menu
- Custom HUD toggle
- PvP UI toggle
- FPS Mode toggle
- Low Graphics Mode toggle
- Crosshair toggle
- Keystrokes HUD toggle
- Settings persist with SharedPreferences
- Minecraft launch integration placeholder
