# Animal Shelters Management App
![badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/creotiv/d796236332509ed40d5172b30466059a/raw/test.json)
![badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/creotiv/ca3186e27122a0bb967bff296a43ddc9/raw/coverage.json)

We are creating this app to help animal shelters in Ukraine optimize their work,
mimize amount of fails due to big amount of animals to work with and make their
life a little better.

Also we are always happy new dontation for saving homeless animals: https://uah.fund/donate

## Getting Started

### Install flutter

#### Install Flutter and Android/iOS sdk 
https://docs.flutter.dev/get-started/install

Dont forget to install Android Studio & SDK

#### Install Visual Code Studio
https://code.visualstudio.com/

Add extensions:
- Markdown Preview Mermaid Support
- Flutter

#### Donwload dependencies
```bash
flutter pub get
```

#### Setup Firebase 
1. Create Firebase project https://console.firebase.google.com/
2. Enable Firestore, Storage, Remote Config
3. Install CLI
```bash
curl -sL firebase.tools | bash
firebase login
firebase init
# choose: Firestore, Storage, Emulator, Remote config
# make changes to files per platform: https://firebase.flutter.dev/docs/manual-installation/
```

#### Connect flutter app to Firebase
```bash
dart pub global activate flutterfire_cli
PATH="$PATH":"$HOME/.pub-cache/bin" flutterfire configure --project=<firebase-project-id>
```

#### Add Debug fingerprint #####
To work with Firebase with debug version you need to setup debug fingerpint hash

Go to Firebase console->Project Settings->Select app->Add fingerprint

To generate fingerpring use:
```bash
keytool -list -v -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android
```

## Run and debug

### For Adnroid

Add this to your adnroid/local.properties:
```
flutter.minSdkVersion=23
flutter.targetSdkVersion=33
flutter.compileSdkVersion=33
```

1. Connect device with USB with USB Debugging turned on in Dev Options
2. `dart run build_runner build`
3. `flutter test`
4. `flutter run`
5. `flutter analyze`

### Run with firebase emulator

Install emulator suit
```bash
sudo rm -rf /usr/local/bin/firebase
nvm install 19
nvm use 19
npm install -g firebase-tools@13.5.0
```

Run emulators
```bash
firebase emulators:start -c firebase/dev/firebase.json
```

Run app with emulation
```bash
flutter run --dart-define=DEBUG=true --dart-define=EMULATOR_HOST=YOUR_IP[example 192.168.31.182]
```

### WiFi debugging

```bash
# Developer options->Wireless debugging->Pair device with pairing code
adb pair <phone-ip>:<pairing-port>
Enter pairing code: *****
# now connect device using same ip and port on `Wireless debugging` screen
adb connect <phone-ip>:<debug-port>
```

**!!! For some stupid reason wifi debug port updated once in few minutes**


## Contribute

If you would like to contribute bug fixes, improvements, and new features 
back to UAH App, please take a look at our [Contributor Guide][contributing] 
and [Dev Guide][devguide] to see how you can participate in this open source 
project.


[devguide]: DEVGUIDE.md
[contributing]: CONTRIBUTING.md
