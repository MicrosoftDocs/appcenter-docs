---
title: Xamarin.Android Code Signing Setup in App Center
description: How to set up code signing for Xamarin.Android apps
keywords: android
author: nevalenny
ms.author: v-yuneva
ms.date: 06/05/2017
ms.topic: article
ms.assetid: 88173334-ab35-439a-98ec-a9bef49da42c
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: xamarin-android
---

# Setting up a Xamarin.Android project for code signing
When App Center builds a Xamarin.Android application with a debug build type, a keystore associated with a developer is not required. These builds will be automatically code signed with a debug key. For a release build that will be deployed, App Center will require a keystore to be uploaded.

## Generating a keystore
If you do not currently have a keystore, you can generate one using instructions specific for the OS and IDE of your choice.

### 1. In Windows
You can use the [instructions for different versions of Visual Studio](https://developer.xamarin.com/guides/android/deployment,_testing,_and_metrics/publishing_an_application/part_2_-_signing_the_android_application_package/#) to generate a keystore. Or, if you want to use the command line, check: **2. Android: Generate a Private Certificate** in [Cross Platform Development Documentation](https://docs.microsoft.com/en-us/visualstudio/cross-platform/tools-for-cordova/publishing/publish-to-a-store)

### 2. In macOS
Instructions on generating a keystore to sign APKs can be found in [Visual Studio for Mac's official User Guide](https://developer.xamarin.com/guides/android/deployment,_testing,_and_metrics/publishing_an_application/part_2_-_signing_the_android_application_package/?ide=xs#sign-the-apk-xs) or in [Android Studio's official User Guide](https://developer.android.com/studio/publish/app-signing.html).

## Setting up Code Signing
App Center currently supports signing only with the uploaded keystore files and credentials. Keystore files have the extension **.keystore** or **.jks**. After toggling on "Sign builds" in the branch configuration, either click the **Keystore file** box to choose or drag your keystore file into it. Enter the keystore password, the key alias, and the key password to allow App Center to complete the signing of your APK.
