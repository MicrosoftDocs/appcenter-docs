---
title: Android Code Signing Setup in App Center
description: How to set up code signing for Android apps
keywords: android
author: nrajpurkar
ms.author: nirajpur
ms.date: 07/19/2019
ms.topic: article
ms.assetid: 656b4c96-d2b8-456a-9cd8-b7cbc827cdf0
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: android
---

# Android Code Signing Setup in App Center

Signing an app is a requirement to run an app on real devices during the development process or to distribute it via a beta program or in the Play Store. Without code signing, the app can only run on an emulator.

When App Center builds an Android application with a debug build type, a keystore associated with a developer is not required but can be uploaded. These builds will be automatically code signed with a debug key. For a release build that will be deployed, App Center will require a keystore to be uploaded.

## Generating a keystore

If you do not currently have a keystore, you can generate one in Android Studio. Instructions on generating a keystore to sign APKs can be found in [Android Studio's official User Guide](https://developer.android.com/studio/publish/app-signing.html).

## Setting up Code Signing

App Center supports three different configurations of setting up code signing for Android apps. To begin, enable the **Sign builds** toggle in the branch configuration. Then, depending on your scenario, use the one most suitable of the three options below:

### 1. Storing everything in the Gradle configuration

If you would like to specify signing details in the build.gradle file with all credentials and the keystore available in the repository, add all the items needed to your code and repository and leave the revealed checkbox enabled, to mark that your configuration takes care of signing automatically.

### 2. Upload everything to App Center

If you decide not to put your signing credentials into your repository, you can also upload the keystore and configure the signing credentials through App Center. In this case, App Center will first build your Android app and then perform a manual signing step after the successful build.

Since trying to sign a build twice is not supported, make sure that if you provide the signing credentials manually, you have no conflicts with signing configurations in your Gradle configuration for the chosen build variant.

Uncheck the checkbox stating signing details are in the Gradle file for further configuration:

Keystore files have the extension `**.keystore**` or `**.jks**`. After toggling on "Sign builds" in the branch configuration, either click the upload box to choose or drag your keystore file into it. Enter the keystore password, the key alias, and the key password to allow App Center to complete the signing of your APK.

### 3. Storing Signing Details in the Repository with Environment Variables

Use this method if your repository already contains the keystore, but you don't want to store the credentials there. At build time, the credentials will be provided as [System properties](https://docs.gradle.org/current/userguide/build_environment.html#sec:gradle_system_properties) to the Gradle build, see the following code sample on how to make use of them:

```groovy
android { 
    signingConfigs {
        releaseSigningConfig {
            storeFile rootProject.file("app/testapp.jks")
            storePassword System.getProperty("APPCENTER_KEYSTORE_PASSWORD")
            keyAlias System.getProperty("APPCENTER_KEY_ALIAS")
            keyPassword System.getProperty("APPCENTER_KEY_PASSWORD")
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.releaseSigningConfig
        }
    }
}
```

In the code above, securing values behind system properties injected into your build keeps your signing credentials safe – the values are encrypted and only available to the build agents at build time. You may choose to hardcode the values if you prefer. Supply these values when [configuring a branch](~/build/android/first-build.md) in the [**Environment Variables**](~/build/custom/variables/index.md) section of your configuration.

If you use product flavors, you may need to adjust the code above so all your release configurations use the correct signing configuration.

> [!NOTE]
> If you use the `signingConfig` option inside the `buildTypes` section in your `build.gradle` file, you may face with code-signing errors during App Center build (this is especially relevant for the apps that use React Native for Android version 0.60.x and higher):
>```
> Execution failed for task ':app:validateSigningRelease'.
> Keystore file '.../android/app/debug.keystore' not found for signing config 'debug'
>```
>
> In order to fix this issue you have to push a proper keystore used for signing to your repository and enable `My Gradle settings are entirely set to handle signing automatically` in your branch configuration in the App Center portal.
>
> In case you uploaded a keystore to the branch configuration in the App Center portal, take into account that this approach will require to delete the `signingConfig` option from `buildTypes` section of `build.gradle` file if you didn't update it from the default state of the React Native project template.
