# Sign In With Google using Firebase

![Flutter](https://img.shields.io/badge/Flutter-3.22-blue?logo=flutter)
![FirebaseAuth](https://img.shields.io/badge/%20firebase_auth-6.1.0-blue)
![GoogleSignIn](https://img.shields.io/badge/google_sign_in-6.2.2-accentblue)

That is the comprehensive guide for the Google Sign in and Firebase Authentication .

## Basic Setup for that project
🌟 create the project at firebase and integrate it with the flutter project

🌟 In FirebaseProject go in Authentication>sign-in-method> and enable the Email/Password and GoogleSignIn Provider 

🌟 Run that command in your flutter project terminal it will give you SHA1 AND SHA2 
```bash
keytool -list -v -alias androiddebugkey -keystore "$env:USERPROFILE\.android\debug.keystore"
```

🌟 In firebae project go to projectOverview and in genral add click on add finger prints and add the SHA1 and SHA2

by doing this your basic setup is ready for the android.

for more detail you can visit 

- [Google Sign In For Web](https://pub.dev/packages/google_sign_in_android#integration)
- [Google Sign In IOS](https://pub.dev/packages/google_sign_in_ios#macos-integration)


