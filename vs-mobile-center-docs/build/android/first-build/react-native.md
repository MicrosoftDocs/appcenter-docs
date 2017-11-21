---
title: Configure a React Native Android build in App Center
description: How to set up a build system for Android apps
keywords: android
author: siminapasat
ms.author: siminap
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 4c020936-12cf-4869-b534-addc9719f202
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: react-native
---

# Building React Native Android apps

App Center can build React Native apps written in React Native version 0.34 or newer.

To start building your first React Native Android app, you will need to the following:
1. Connect to your repository service account (GitHub, Bitbucket, VSTS).
2. Select a repository and a branch where your app lives.
3. Choose the project's `package.json` that you want to build.
4. Set up your first build.

> [!NOTE]
> For the app to run on a real device, the build needs to be code signed with a valid certificate.

## 1. Linking your repository
If you haven't previously connected to your repository service account, you will need to do this. Once your account is connected, select the repository where your React Native project is located. In order to setup a build for a repository, you need admin and pull permission for it.

## 2. Selecting a branch
After selecting a repository, select the branch you want to build. By default, all the active branches will be listed.

## 3. Setting up your first build
Before your first build, the React Native project needs to be configured.

### 3.1. Project
Select your project’s `package.json`. App Center will automatically extract information from its associated `build.gradle` file, including including dependencies, build tools version, build types, and product flavors.

### 3.2. Build variant
The available build variants will populate from the Build Types and Product Flavors specified in the build.gradle file. Select which build variant should be built.

### 3.3. Build triggers
By default, a new build is triggered every time a developer pushes to a configured branch. This is referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

### 3.4. Increment version number
When enabled, the version code in the AndroidManifest.xml of your app automatically increments for each build. The change happens during the actual build and won't be committed to your repository.

### 3.5. Launch your successful build on a real device
Use your newly produced APK file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. Read more about it [here](~/build/build-test-integration.md)

### 3.6. Code signing
A successful build will produce an APK file. In order to release the build to the Play Store, it needs to be signed with a valid certificate stored in a keystore. To sign the builds produced from a branch, enable code signing in the configuration pane, upload your keystore to your repository, and provide the relevant values in the configuration pane. You can read more about code signing [here](~/build/android/code-signing/setup.md).

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
```
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1>
    |-- <build-step-2>
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```

The build step specific logs (located in the `build/` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app (.apk)
The APK is an Android application packaged file which stores the Android app. If the build has been correctly signed, the APK can be installed on a real device and deployed to the Play Store. If the build has not been signed, the APK can be run on an emulator or used for other purposes.

## 5. Supported versions and requirements
The minimum version supported to build Android apps is 4.0.3 (API level 15). Android apps can have a lower minimum API level required to run, but have to target at least API level 15.

## 6. Build tips

### 6.1. Yarn

[Yarn](https://yarnpkg.com) is a faster, more deterministic replacement for `npm`. If a `yarn.lock` file is present in your repo next to `package.json`, then App Center will use Yarn, doing `yarn install` at the start of the build. Otherwise, it will do `npm install`.

### 6.2. Custom build scripts
In addition to App Center's [custom build scripts](~/build/custom/scripts/index.md) you might want to use [npm-scripts](https://docs.npmjs.com/misc/scripts) for example when your React Native app uses TypeScript and you have to run the `tsc` compiler at build start. Add a `postinstall` script in the `package.json` like this:

```
  "scripts": {
    ...
    "postinstall" : "./postinstall.sh"     [other examples: "node ./postinstall.js" or just a single command like "tsc"]
  },
```

Postinstall scripts run right after all the `package.json` packages are installed, so you use those packages in your script.

### 6.3. Building multiple APKs
For React Native on Android, universal APK generation is disabled by default. If your app configuration is set up to build multiple APKs, e.g. different ones per CPU architecture or screen configuration, you need to make sure a universal APK is built as well. App Center's build system works with one main APK file and will ignore all APKs specific to a certain CPU/ABI or screen density. To learn more about APK splits and how to build a universal APK, please read the corresponding [Android developer guide](https://developer.android.com/studio/build/configure-apk-splits.html#configure-abi-split). Consequently, make sure that `universalApk` is set to `true` for your React Native build configuration.