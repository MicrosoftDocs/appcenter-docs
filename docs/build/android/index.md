---
title: Building Java apps for Android
description: How to set up a build system for Android apps
keywords: android
author: lucen-ms
ms.author: lucen
ms.date: 08/16/2019
ms.topic: article
ms.assetid: 7042d0ef-50b5-4fdc-bead-bedc9e94923c
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: android
---

# Building Java apps for Android

[!INCLUDE [Retirement announcement for App Center](~/includes/retirement.md)]

To build your first Android app, follow these steps:

1. Connect to your repository service account (GitHub, Bitbucket, VSTS, Azure DevOps).
2. Select a repository and a branch where your app lives.
3. Choose the Android project you want to build.
4. Set up your first build.

> [!NOTE]
> For the app to run on a real device, the build needs to be code signed with a valid certificate.

> [!NOTE]
> The App Center tracks the project by searching the gradle (and gradlew) directory files of the Android project. Please do not include these files in the project .gitignore as App Center Build will not be able to find them.

> [!WARNING]
> Due to the recent shutdown of JCenter, certain apps may experience Gradle Task failures when building with App Center. Please view the migration guide provided by Gradle. As a workaround, all instances of `jcenter()` can be removed from the `build.gradle` file, and replaced with `jcenter { url "http://jcenter.bintray.com/"}`. Read more about the JCenter Shutdown [here](~/build/android/jcentershut.md).

## 1. Linking your repository
You must connect to your repository service account if you haven't already. Once your account is connected, select the repository where your Android project is located. To set up a build for a repository, you need admin and pull permission for it.

## 2. Selecting a branch
After selecting a repository, select the branch you want to build. By default, all the active branches will be listed.

## 3. Setting up your first build
Before your first build, the Android project needs to be configured.

### 3.1. Build triggers
By default, a new build is triggered every time a developer pushes to a configured branch. This is referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

### 3.2. Build variant
The available build variants will populate from the Build Types and Product Flavors specified in the build.gradle (app level) file. Select which build variant should be built.

> [!NOTE]
> App Center Build supports finding build variants as the combination of a Build Type (debug, release or custom defined) and one of your gradle declared Product Flavors. Detection of Flavor Dimensions (combinations of multiple product flavors) isn't supported at this time.

### 3.3. Build Android App Bundle (.aab)
The Android App Bundle is a distribution format that's uploaded to the Play Store and used to generate optimized APKs for specific devices. You can find out more about the Android App Bundle in the [official Android documentation](https://developer.android.com/guide/app-bundle/).

Toggle the option for Android App Bundle to produce an `.aab` in addition to the `.apk`. If the `build.gradle` [(app level)](https://developer.android.com/studio/build) file contains the `android.bundle` block, this option will already be on.

### 3.4. Increment version number
When enabled, the version code in the AndroidManifest.xml of your app automatically increments for each build. The change happens during the actual build and won't be committed to your repository.

### 3.5. Code signing
A successful build will produce an `.apk` file and an additional `.aab` file if enabled. To release the build to the Play Store, it needs to be signed with a valid certificate stored in a keystore. To sign the builds produced from a branch, enable code signing in the configuration pane, upload your keystore to your repository, and provide the relevant credentials in the configuration pane. You can read more about code signing in [App Center's Android code signing documentation](~/build/android/code-signing.md). The `.aab` will be signed using the same credentials as the `.apk`.

### 3.6. Launch your successful build on a real device
Use your newly produced APK file to test if your app starts on a real device. This adds approximately 10 more minutes to the total build time. Read more about [how to configure launch tests](~/build/build-test-integration.md).

### 3.7. Configure from the build.gradle [(app level)](https://developer.android.com/studio/build) File
Specific information about your build will be collected from your Gradle file including dependencies, build tools version, build types, and product flavors.

### 3.8. Distribute the build
You can configure each successful build from a branch to be distributed to a previously created distribution group or a store destination. You can add a new distribution group or [configure a store connection](~/distribution/stores/index.md) from within the Distribute service. There's always a default distribution group called "Collaborators" that includes all the users who have access to the app.

> [!NOTE]
> If distributing to the Google Play Store, an Android App Bundle (`.aab`) is preferred and will be distributed if enabled. For App Center distribution groups and Intune store destinations, a regular `.apk` will be used even if an `.aab` is also generated.

## 4. Build results
After a build is triggered, it can be in these states:

* **queued** -  the build is in a queue waiting for resources to be freed up.
* **building** - the app is building and running related tasks.
* **succeeded** - the build is completed successfully.
* **failed** - the build completed, but it failed. You can download and inspect the build log for troubleshooting.
* **canceled** - the build was canceled by user action, or it timed out.

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

The build step-specific logs (located in the build/ directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app package (APK)
The APK is a package that contains the Android app and assets. If the build is correctly signed, the APK can be installed on a real device and deployed to the Play Store. If the build hasn't been signed, the APK can be run on an emulator or used for other purposes.

### 4.3. Building multiple APKs
If your app configuration builds multiple APKs, you need to build a universal APK too. Our build system works with one main APK file and will ignore all APKs specific to a certain CPU ABI or screen density. To learn more about APK splits and building a universal APK, read the [ABI split guide](https://developer.android.com/studio/build/configure-apk-splits.html#configure-abi-split).

### 4.4. The deobfuscation-mapping file (mapping.txt)
The `mapping.txt` file contains information on how to map obfuscated stack traces for the app back to the original class and method names.

* If you've previously integrated the App Center SDK in your app with the crash reporting module enabled and use either Proguard or R8 to minify and obfuscate the app binary, the crash reporting service requires this `mapping.txt` file for a build to display [human readable (deobfuscated) crash reports](~/diagnostics/Android-Deobfuscation.md).
* If you've previously integrated another SDK for crash reporting purposes in your app (for example, HockeyApp SDK), the corresponding service requires the `mapping.txt` file to display readable crash reports.

## 5. Supported versions and requirements
The minimum version supported to build Android apps is 7.0 (API level 24). Android apps can have a lower minimum API level required to run, but must target at least API level 24. 

Apps must build with Gradle and the Android Gradle plugin to be configured correctly. Your repository needs to include a Gradle wrapper.

See also: [Cloud Build Machine information](~/build/software.md)
