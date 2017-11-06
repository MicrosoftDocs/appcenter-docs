---
title: Configure a Xamarin.Android build in App Center
description: How to set up a build system for Xamarin.Android apps
keywords: android
author: siminapasat
ms.author: siminap
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 408956a2-8570-40c1-bc62-edc44cd9ec0c
ms.service: mobile-center
ms.custom: build
ms.tgt_pltfrm: xamarin-android
---

# Building Xamarin.Android apps

To start building your first Xamarin Android app, you will need to the following:
1. Connect to your repository service account (GitHub, Bitbucket, VSTS).
2. Select a repository and a branch where your app lives.
3. Choose the Android project you want to build.
4. Set up your first build.

> [!NOTE]
> For the app to run on a real device, the build needs to be code signed with a valid KeyStore.

## 1. Linking your repository
If you haven't previously connected to your repository service account, you will need to do this. Once your account is connected, select the repository where your Xamarin project is located. In order to setup a build for a repository, you need admin and pull permission for it.

## 2. Selecting a branch
After selecting a repository, select the branch you want to build. By default, all the active branches will be listed.

## 3. Configuring Your Build
Before your first build, the Xamarin project needs to be configured.

### 3.1. Build triggers
By default, a new build is triggered every time a developer pushes to a configured branch. This is referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

### 3.2. Project and Configuration
The available projects in your repository will populate. Select the correct project for your Android build and select the appropriate configuration.

### 3.3. Mono version
App Center allows using different Mono environments bundled with the respective Xamarin.Android SDK for your builds. This way we maintain backward compatibility while also supporting the latest features. The default Mono version for a new branch configuration is the latest stable one. You may choose to use one of the previous Mono environments to build older versions of frameworks or libraries. When selecting a Mono version in the build configuration, the bundled Xamarin.Android SDK version displayed right next to it. For more information about Xamarin SDK version updates, please read the [Xamarin release blog](https://releases.xamarin.com/).

### 3.4. Increment version number
When enabled, the version code in the AndroidManifest.xml of your app automatically increments for each build. The change happens pre build and won't be committed to your repository.

### 3.5. Code signing
A successful build will produce an apk file. In order to release the build to the Play Store, it needs to be signed with a valid Keystore and Alias. To sign the builds produced from a branch, enable code signing in the configuration pane, upload your Keystore, and provide the values needed in the configuration pane. You can read more [detailed code signing instructions](~/build/android/code-signing/xamarin.md).

### 3.6. Launch your successful build on a real device
Use your newly produced APK file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. There is more [specific test integration information](~/build/build-test-integration.md).

### 3.7. NuGet restore
If the **NuGet.config** file is checked-in into the repository and sitting next to the **.sln** or at the root, App Center will auto-restore the NuGet feed. 
To restore private NuGet feeds, make sure you include the credentials in the **NuGet.config** file:

```
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="nuget" value="https://api.nuget.org/v2/index.json" />
    <add key="MyGet" value="https://www.myget.org/F/MyUsername/api/v2/index.json" />
    <add key="MyAuthNuget" value="https://nuget.example.com/v2/index.json" />
  </packageSources>
  <activePackageSource>
    <add key="All" value="(Aggregate source)" />
  </activePackageSource>
  <packageSourceCredentials>
    <MyAuthNuget>
      <add key="Username" value="myusername" />
      <add key="ClearTextPassword" value="password" />
    </MyAuthNuget>
  </packageSourceCredentials>
</configuration>
```
If you have complex configurations and need more information, please refer to [Configuring Nuget behavior](https://docs.microsoft.com/nuget/consume-packages/configuring-nuget-behavior).

### 3.8. Distribute to a distribution group
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

The build step specific logs (located in the build/ directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app (.apk)

The APK is an Android application packaged file which stores the Android app. If the build has been correctly signed, the APK can be installed on a real device and deployed to the Play Store. If the build has not been signed, the APK can be run on an emulator or used for other purposes.

## Supported versions and requirements
App Center supports Portable Class Library (PCL) projects, but does not currently support .NET Standard.
App Center has no support for Components from the Xamarin Component Store and we advise using NuGet packages whenever they are available. If you are using a Component which cannot be replaced, please reach out to us: click on the blue bubble on the bottom right corner once you're logged in to App Center and share your feedback with us.
