---
title: Android code signing setup
description: How to set up code signing for Android apps
keywords: android
author: nrajpurkar
ms.author: nirajpur
ms.date: 12/10/2019
ms.topic: article
ms.assetid: 656b4c96-d2b8-456a-9cd8-b7cbc827cdf0
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: android
---

# Android code signing setup in App Center

Signing an app is a requirement to run an app on real devices during the development process or to distribute it via a beta program or in the Play Store. Without code signing, the app can only run on an emulator.

When App Center builds an Android application with a debug build type, a keystore associated with a developer isn't required but can be uploaded. These builds will be automatically code signed with a debug key. For a release build that will be deployed, you have to upload a keystore to App Center.

## Generating a keystore

If you don't currently have a keystore, you can generate one in Android Studio. You can find instructions on generating a keystore to sign APKs in [Android Studio's official User Guide](https://developer.android.com/studio/publish/app-signing.html).

## Setting up Code Signing

App Center supports three different ways of setting up code signing for Android apps. For all three methods, you first need to go to the build configuration and enable code signing:

1. Go to your app.
2. Go to **Build**.
3. Choose the menu at the right of the branch row (either 'Settings' or 'More'). If this branch has no settings yet, choose **Configure build** from the menu.
4. Enable **Sign builds**.
5. Choose **Save**.

Then, depending on your scenario, use the most suitable of the three options in the sections below. The first option involves checking in credentials to your repository, while the other two use App Center to handle your credentials instead.

## A. Storing everything in the Gradle configuration

You can specify the signing details in the `build.gradle` file. The signing details, along with all credentials and the keystore information, will be visible in the repository. First, add all the items you need to your code and check them in to your repository. Then in the build configuration in App Center, enable **My Gradle settings are entirely set to handle signing automatically**.

## B. Uploading everything to App Center

You can upload the keystore and configure the signing credentials through App Center. In this case, App Center will first build your Android app and then run a signing step after the successful build.

> [!NOTE]
> A build can only be signed once. Make sure you have no conflicts with signing configurations in your Gradle configuration for the chosen build variant. If there are signing settings both in App Center and in the Gradle file, the build may end up signed twice and this will lead to conflicts.

Set up your [build configuration](#setting-up-code-signing) in App Center as follows:

1. Disable **My Gradle settings are entirely set to handle signing automatically**.
2. Upload your keystore file to the **Keystore file** upload file drop. You can drag the file onto the box or click it and browse for the file. Keystore files have the extension .keystore or .jks.
3. Enter the keystore password, key alias, and key password in the **Environment variables** section. These values are the same ones you would otherwise enter in Android Studio when you sign a build.

## C. Storing Signing Details in the Repository with Environment Variables

Use this method if your repository already contains the keystore, but you don't want to store the credentials there. At build time, the credentials will be provided as [System properties](https://docs.gradle.org/current/userguide/build_environment.html#sec:gradle_system_properties) to the Gradle build. See the following code sample on how to make use of them:

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

In the code above, securing values behind system properties injected into your build keeps your signing credentials safe – the values are encrypted and only available to the build agents at build time. You can provide the values through App Center. You can also hard code any of the values, and check them in to your repository. To use App Center to safeguard the values:

1. Go to your [build configuration](#setting-up-code-signing).
2. Make sure the checkbox called **My Gradle settings are entirely set to handle signing automatically** it not checked.
3. Enter the keystore password, key alias, and key password in the **Environment variables** section. These values are the same ones you would otherwise enter in Android Studio when you sign a build.

If you use product flavors, you may need to adjust the code above so all your release configurations use the correct signing configuration.

> [!NOTE]
> If you use the `signingConfig` option inside the `buildTypes` section in your `build.gradle` file, you may face code-signing errors during App Center build. This is especially relevant for apps that use React Native for Android version 0.60.x and higher:
>
> ```text
>  Execution failed for task ':app:validateSigningRelease'.
>  Keystore file '.../android/app/debug.keystore' not found for signing config 'debug'
> ```
>
> To fix this issue you have to push a proper keystore used for signing to your repository and enable **My Gradle settings are entirely set to handle signing automatically** in your build configuration in the App Center portal.
>
> In case you uploaded a keystore to the build configuration in the App Center portal, take into account that this approach will require to delete the `signingConfig` option from the `buildTypes` section of your `build.gradle` file if you didn't update it from the default state of the React Native project template.
