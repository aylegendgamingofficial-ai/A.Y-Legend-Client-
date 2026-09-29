# A.Y Legend Client — GitHub APK Build

1. Upload this project to a GitHub repository (upload the project contents, not this ZIP itself).
2. Keep `.github/workflows/build-apk.yml` in the repository.
3. Open **Actions** → **Build A.Y Legend Client APK** → **Run workflow**.
4. Wait for the green check.
5. Open the completed run and download **app-release-apk** under Artifacts.
6. Extract the artifact to get `app-release.apk`.

The workflow builds a release APK using Flutter stable on GitHub's Ubuntu runner.
