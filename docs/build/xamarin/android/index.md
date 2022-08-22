---
title: Building Xamarin apps for Android
description: How to set up a build system for Xamarin.Android apps
keywords: android
author: lucen-ms
ms.author: lucen
ms.date: 11/17/2020
ms.topic: article
ms.assetid: 408956a2-8570-40c1-bc62-edc44cd9ec0c
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: xamarin-android
---

# Building Xamarin apps for Android
To start building your first Xamarin Android app, you must:

1. Connect to your repository service account (GitHub, Bitbucket, VSTS, Azure DevOps).
2. Select a repository and a branch where your app lives.
3. Choose the Android project you want to build.
4. Set up your first build.

> [!NOTE]
> For the app to run on a real device, you must sign the build the build with a valid KeyStore.

## 1. Linking your repository
If you haven't previously connected to your repository service account, you must do this first. Once your account is connected, select the repository where your Xamarin project is located. You must have admin and pull permissions to set up a build for a repository.

## 2. Selecting a branch
After selecting a repository, select the branch you want to build. By default, App Center lists all active branches.

## 3. Configuring Your Build
The Xamarin project must be configured before your first build.

### 3.1. Build triggers
By default, the build service uses Continuous Integration, so a new build is triggered every time a developer pushes to a configured branch. If you prefer to trigger new builds manually, you can change this setting in the configuration pane.

### 3.2. Project and Configuration
The available projects in your repository will populate if they're located within the range of analysis. Select the correct project for your Android build and select the appropriate configuration.

> [!NOTE]
> For best performance, the analysis is currently limited to four directory levels including the root of your repository.

### 3.3. Mono version
App Center allows using different Mono environments bundled with the respective Xamarin.Android SDK for your builds. This way we maintain backward compatibility while also supporting the latest features. The default Mono version for a new branch configuration is the latest stable one. You may choose to use one of the previous Mono environments to build older versions of frameworks or libraries.

When selecting a Mono version in the build configuration, the bundled Xamarin.Android SDK version displayed right next to it. For more information about Xamarin SDK version updates, read the [Xamarin release blog](https://releases.xamarin.com/).

#### 3.3.1. .NET Core version
Proper .NET Core version will be selected automatically based on Mono version used for build and can't be overwritten. You can view the mapping of Mono to the .NET Core used by our services in the table below:

| Mono | .NET Core |
| ---- | --------- |
| <= 5.18 | 2.2.105 |
| 6.0 | 2.2.300 |
| 6.4 | 3.0.100 |
| 6.6 | 3.1.100 |
| 6.8 | 3.1.200 |
| 6.10 | 3.1.300 |
| 6.12 | 3.1.401 |

### 3.4. Build Android App Bundle (.aab)
The Android App Bundle is a distribution format that is used to generate optimized APKs for specific devices. It can be uploaded to the Play Store. You can find out more about the Android App Bundle in the [official Android documentation](https://developer.android.com/guide/app-bundle/), and the [Xamarin.Android 9.4 release notes](/xamarin/android/release-notes/9/9.4#initial-support-for-android-app-bundle-publishing-format), which can also help you decide if you want to build a bundle along with your regular `.apk.`

Toggle on the option for Android App Bundle to produce an `.aab` and an `.apk`. If the `.csproj` file contains `aab` in the `AndroidPackageFormat` property, this option will automatically be toggled on. Building an `.aab` is supported for Xamarin.Android 9.4 and higher.

### 3.5. Increment version number
When enabled, the version code in the AndroidManifest.xml of your app automatically increments for each build. The change happens pre build and won't be committed to your repository.

### 3.6. Code signing
A successful build will produce an `.apk` file and an additional `.aab` file if enabled. To release the build to the Play Store, it must be signed with a valid Keystore and Alias. To sign the builds produced from a branch, enable code signing in the configuration pane, upload your Keystore, and provide the values needed in the configuration pane. You can read more [detailed code signing instructions](~/build/xamarin/android/code-signing.md). The `.aab` will be signed using the same credentials as the `.apk`.

### 3.7. Launch your successful build on a real device
Use your newly produced `.apk` file to test if your app starts on a real device. This adds approximately 10 more minutes to the total build time. There's more information in our [test integration guide](~/build/build-test-integration.md).

### 3.8. NuGet restore
If the `NuGet.config` file is checked-in into the repository and sitting next to the `.sln` file or at the root level of your repository, App Center restores your private NuGet feeds when they're added as shown in the example below. Credentials can be added safely by using [environment variables](~/build/custom/variables/index.md):

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="nuget" value="https://api.nuget.org/v3/index.json" />
    <add key="MyGet" value="https://www.myget.org/F/MyUsername/api/v2/index.json" />
    <add key="MyAuthNuget" value="https://nuget.example.com/v2/index.json" />
  </packageSources>
  <activePackageSource>
    <add key="All" value="(Aggregate source)" />
  </activePackageSource>
  <packageSourceCredentials>
    <MyAuthNuget>
      <add key="Username" value="$USER_VARIABLE" />
      <add key="ClearTextPassword" value="$PASSWORD_VARIABLE" />
    </MyAuthNuget>
  </packageSourceCredentials>
</configuration>
```

If you have complex configurations and need more information, refer to [Configuring NuGet behavior](/nuget/consume-packages/configuring-nuget-behavior).

### 3.9. Distribute the build
You can configure each successful build from a branch to be distributed to a previously created distribution group or a store destination. You can add a new distribution group or [configure a store connection](~/distribution/stores/index.md) from within the Distribute service. There's always a default distribution group called "Collaborators" that includes all the users who have access to the app.

> [!NOTE]
> If distributing to the Google Play Store, an Android App Bundle (`.aab`) is preferred and will be distributed if enabled. For App Center distribution groups and Intune store destinations, a regular `.apk` will be used even if an `.aab` is also generated.

## 4. Build results
After a build triggers, the build will be in one of the following states:

* **queued** - the build is in a queue waiting for resources to be freed up.
* **building** - the build is running.
* **succeeded** - the build completed successfully.
* **failed** - the build stopped with failures. You can troubleshoot what went wrong by downloading and inspecting the build log.
* **canceled** - the build was canceled by a user action or it timed out.

### 4.1. Build logs
For a completed build (succeeded or failed), download the logs to understand more about how the build went. App Center provides an archive with the following files:

```NA
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1>
    |-- <build-step-2>
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```

The build step logs (located in the `build/` directory of the archive) are helpful for understanding in which step and why the build failed.

### 4.2. The app (.apk)
The `.apk` file is an Android application packaged file that stores the Android app. If the build has been correctly signed, the `.apk` file can be installed on a real device and deployed to the Play Store. If the build hasn't been signed, the app can run on an emulator or be used for other purposes.

## Supported versions and requirements
App Center supports Portable Class Library (PCL) and [.NET Standard](/dotnet/standard/net-standard) projects. Refer to [Cloud Build Machines](~/build/software.md) for versions of .NET Standard.

App Center doesn't support Components from the Xamarin Component Store and we advise using NuGet packages whenever they're available. If you're using a Component that can't be replaced, contact us. See [help and feedback](../../../help.md).