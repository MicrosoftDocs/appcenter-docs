---
title: Android Code Signing Setup in Mobile Center
description: How to set up code signing for Android apps
keywords: android
author: siminapasat
ms.author: siminap
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 656b4c96-d2b8-456a-9cd8-b7cbc827cdf0
ms.service: mobile-center
ms.custom: build
ms.tgt_pltfrm: android
---

# Setting up an Android project for code signing

When Mobile Center builds an Android application with a debug build type, a keystore associated with a developer is not required but can be uploaded. These builds will be automatically code signed with a debug key. For a release build that will be deployed, Mobile Center will require a keystore to be uploaded.

## Generating a keystore
If you do not currently have a keystore, you can generate one in Android Studio. Instructions on generating a keystore to sign APKs can be found in [Android Studio's official User Guide](https://developer.android.com/studio/publish/app-signing.html).

## Setting up Code Signing
Mobile Center supports three different configurations of setting up code signing for Android apps. To begin, enable the **Enable Code Signing** toggle in the branch configuration.

### 1. Storing everything in the Gradle configuration
If you would like to specify signing details in the build.gradle file with all credentials and the keystore available in the repository, add all the items needed to your code and repository and leave the revealed checkbox enabled, to mark that your configuration takes care of signing automatically.

### 2. Upload everything to Mobile Center
To use this method, there should be no signing configurations in the Gradle configuration in the repository. Uncheck the checkbox stating signing details are in the Gradle file. This enables further configuration:

Keystore files have the extension **.keystore** or **.jks**. After toggling on "Enable Code Signing" in the branch configuration, either click the upload box to choose or drag your keystore file into it. Enter the keystore password, the key alias, and the key password to allow Mobile Center to complete the signing of your APK.

### 3. Storing Signing Details in the Repository with Environment Variables
Use this method if your repository already contains the keystore, but you don't want to store the credentials there. At build time, the credentials will be provided as environment variables, see the following code sample on how to make use of them:

```groovy
android {
    signingConfigs {
        releaseSigningConfig {
            storeFile rootProject.file("app/testapp.jks")
            storePassword System.getProperty("MOBILECENTER_KEYSTORE_PASSWORD")
            keyAlias System.getProperty("MOBILECENTER_KEY_ALIAS")
            keyPassword System.getProperty("MOBILECENTER_KEY_PASSWORD")
        }
    }

    buildTypes {
        release {
            signingConfig signingConfigs.releaseSigningConfig
        }
    }
}

```

In the code above, the variable names allow security in keeping your signing credentials safe – the values will be encrypted and only available to the build agents at build time. You may choose to hardcode these if you prefer. You will be prompted for these values when [configuring a branch](~/build/android/first-build/index.md).

If you use product flavors, you may need to adjust the code above so all your release configurations use the correct signing configuration.
