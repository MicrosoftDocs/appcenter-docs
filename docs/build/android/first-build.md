---
title: Configure a Java Android build in App Center
description: How to set up a build system for Android apps
keywords: android
author: siminapasat
ms.author: siminap
ms.date: 09/12/2018
ms.topic: article
ms.assetid: 7042d0ef-50b5-4fdc-bead-bedc9e94923c
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: android
---

# Building Java apps for Android

To start building your first Android app, you will need to the following:

1. Connect to your repository service account (GitHub, Bitbucket, VSTS, Azure DevOps).
2. Select a repository and a branch where your app lives.
3. Choose the Android project you want to build.
4. Set up your first build.

> [!NOTE]
> For the app to run on a real device, the build needs to be code signed with a valid certificate.

## 1. Linking your repository

If you haven't previously connected to your repository service account, you will need to do this. Once your account is connected, select the repository where your Android project is located. In order to setup a build for a repository, you need admin and pull permission for it.

## 2. Selecting a branch

After selecting a repository, select the branch you want to build. By default, all the active branches will be listed.

## 3. Setting up your first build

Before your first build, the Android project needs to be configured.

### 3.1. Build triggers

By default, a new build is triggered every time a developer pushes to a configured branch. This is referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

### 3.2. Build variant

The available build variants will populate from the Build Types and Product Flavors specified in the build.gradle file. Select which build variant should be built.

### 3.3. Increment version number

When enabled, the version code in the AndroidManifest.xml of your app automatically increments for each build. The change happens during the actual build and won't be committed to your repository.

### 3.4. Code signing

A successful build will produce an APK file. In order to release the build to the Play Store, it needs to be signed with a valid certificate stored in a keystore. To sign the builds produced from a branch, enable code signing in the configuration pane, upload your keystore to your repository, and provide the relevant credentials in the configuration pane. You can read more about code signing in [App Center's Android code signing documentation](~/build/android/code-signing.md).

### 3.5. Launch your successful build on a real device

Use your newly produced APK file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. Read more about [how to configure launch tests](~/build/build-test-integration.md).

### 3.6. build.gradle File

Specific information about your build will be collected from your Gradle file including dependencies, build tools version, build types, and product flavors.

### 3.7. Distribute to a distribution group

You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app.

Once you save the configuration, a new build will be kicked off automatically.

## 4. Build results

After a build has been triggered, it can be in the following states:

* **queued** -  the build is in a queue waiting for resources to be freed up
* **building** - the build is running and performing the predefined tasks
* **succeeded** - the build is completed and it has succeeded
* **failed** - the build has completed but it has failed; you can troubleshoot what went wrong by downloading and inspecting the build log
* **canceled** - the build has been canceled by a user action or it has timed out

### 4.1. Build logs

For a completed build (succeeded or failed), download the logs to understand more about how the build went. App Center provides an archive with the following files:

```text
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1>
    |-- <build-step-2>
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```

The build step specific logs (located in the build/ directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app package (APK)

The APK is an Android application packaged file which contains the Android app and assets. If the build has been correctly signed, the APK can be installed on a real device and deployed to the Play Store. If the build has not been signed, the APK can be run on an emulator or used for other purposes.

### 4.3. Building multiple APKs

If your app configuration is set up to build multiple APKs, e.g. different ones per CPU architecture or screen configuration, you need to make sure a universal APK is built as well. Our build system works with one main APK file and will ignore all APKs specific to a certain CPU ABI or screen density. To learn more about APK splits and how to build a universal APK, please read the corresponding [Android developer guide](https://developer.android.com/studio/build/configure-apk-splits.html#configure-abi-split).

### 4.4. The deobfuscation mapping file (mapping.txt)

The `mapping.txt` file contains information on how to map obfuscated stack traces for the app back to the original class and method names.

* If you have previously integrated the App Center SDK in your app with the crash reporting module enabled and use either Proguard or R8 to minify and obfuscate the app binary, the crash reporting service requires this `mapping.txt` file for a build in order to display human readable (deobfuscated) crash reports.
* If you have previously integrated another SDK for crash reporting purposes in your app (for example, HockeyApp SDK), the corresponding service requires the `mapping.txt` file in order to display human readable crash reports.

## 5. Supported versions and requirements

The minimum version supported to build Android apps is 4.0.3 (API level 15). Android apps can have a lower minimum API level required to run, but have to target at least API level 15.

Apps need to be built with Gradle and the Android Gradle plugin to be configured correctly. Your repository needs to include a Gradle wrapper.
