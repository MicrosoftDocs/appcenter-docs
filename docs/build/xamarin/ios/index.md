---
title: Configure a Xamarin iOS build in App Center
description: How to set up a build for Xamarin.iOS apps
keywords: build, xamarin, ios
author: siminapasat
ms.author: siminap
ms.date: 11/28/2018
ms.topic: article
ms.assetid: 08a32d64-6369-49d9-a6c9-78bfc9ef36b6
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: xamarin-ios
---

# Building Xamarin apps for iOS

To start building your first Xamarin iOS app, you will need to the following:

1. Connect to your repository service account (GitHub, Bitbucket, VSTS, Azure DevOps).
2. Select a repository and a branch where your app lives.
3. Configure the build's project or workspace, and the scheme you would like to build.

> [!NOTE]
> For the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

## 1. Linking your repository

If you haven't previously connected to your repository service account, you will need to do this. Once your account is connected, select the repository where your iOS project is located. In order to setup a build for a repository, you need admin and pull permission for it.

## 2. Selecting a branch

After selecting a repository, select the branch you want to build. By default all the active branches will be listed. 

## 3. Setting up your first build

Before your first build, the Xamarin project needs to be configured.

### 3.1. Project/solution

App Center automatically detects the solution and project files in your repository if they are located within the range of analysis. Select the **.sln** or **.csproj/.fsproj** you would like to build.

> [!NOTE]
> For best performance, the analysis is currently limited to two directory levels for **.sln** and four directory levels for **.csproj/fsproj** including the root of your repository.

#### 3.1.1. Building from the solution file (.sln)

In your code make sure to disable Android and UWP projects for build configs that are intended for iOS builds: go into the solution's configuration mappings, and for all mappings that target **iPhone** and **iPhoneSimulator**, uncheck all the projects which are targeting other platforms. This will ensure that when the **.sln** is building, it will not attempt to build the other projects. There is more [solution configurations mapping information](~/build/xamarin/ios/solution-configuration-mappings.md) you can read.

#### 3.1.2. Building from the project file (.csproj/.fsproj)

In order to build from a **.csproj/.fsproj** file all the referenced projects (e.g. your PCL project) must contain the configuration with the same name as the one from your source iOS project. So, if you run the **Debug** configuration for the simulator in App Center, your PCL project must have the **Debug|iPhoneSimulator** configuration. In case they don't exist and to prevent further errors we add such configurations before building your projects. Those configurations have basic default settings for Debug and Release only.

### 3.2. Configuration

Select the configuration you would like to build with. The configurations are automatically detected depending on the source file picked in the previous step.

### 3.3. Mono version

App Center allows using different Mono environments bundled with respective Xamarin.iOS SDK for your build to maintain backward compatibility while releasing a support for new features. The default Mono for a new branch configuration will be the latest stable one. You may choose to use one of the previous Mono environments to build older versions of frameworks or libraries. When you choose a different Mono you will see the Xamarin.iOS SDK version which is bundled with it. For more information about Xamarin SDK version updates, you can read posts in [Xamarin release blog](https://releases.xamarin.com/).

### 3.4. Xcode Version

Current version of Xamarin requires Xcode 8.0 or higher.

### 3.5. Build triggers

By default, a new build is triggered every time a developer pushes to a configured branch. This is referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

### 3.6. Simulator build

Simulator builds can only be ran on simulators and cannot be installed on the device, however the builds complete faster then device builds. If your build is not a simulator build, you need to upload code signing files in the next step.

### 3.7. Increment build number

When enabled, the `CFBundleVersion` in the Info.plist of your app automatically increments for each build. The change happens pre-build and won't be committed to your repository.

### 3.8. Code signing

A successful device build will produce an ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload [a provisioning profile (.mobileprovision) and a valid certificate (.p12)](~/build/ios/uploading-signing-files.md), along with the password for the certificate. You can read more about code signing and device provisioning of Xamarin iOS apps in the [Xamarin official documentation](https://docs.microsoft.com/xamarin/ios/get-started/installation/device-provisioning/).

> [!NOTE]
> App Center does not currently support signing app extensions for Xamarin apps.

### 3.9. Launch your successful build on a real device

Use your newly produced .ipa file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. You may want to check more [comprehensive guide about testing your builds](~/build/build-test-integration.md)

### 3.10. NuGet restore

If the **NuGet.config** file is checked-in into the repository and sitting next to the **.sln** or at the root level of your repository, App Center restores your private NuGet feeds when they are added as shown in the example below. Credentials can be added safely by using [environment variables](~/build/custom/scripts/index.md):

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

If you have complex configurations and need more information, please refer to [Configuring NuGet behavior](https://docs.microsoft.com/nuget/consume-packages/configuring-nuget-behavior).

### 3.11. Distribute to a distribution group

You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app.

Once you save the configuration, a new build will be automatically kicked off.

## 4. Build results

After a build has been triggered, it can be in the following states:

* **queued** -  the build is in a queue waiting for resources to be freed up
* **building** - the build is running and performing the predefined tasks
* **succeeded** - the build is completed and it has succeeded
* **failed** - the build has completed but it has failed; you can troubleshoot what went wrong by downloading and inspecting the build log
* **canceled** - the build has been canceled by a user action or it has timed out

### 4.1. Build logs

For a completed build (succeeded or failed), download the logs to understand more about how the build went. App Center provides an archive with the following files:

```NA
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1> (e.g. 2_Get Sources.txt)
    |-- <build-step-2> (e.g. 3_Pod install.txt)
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```

The build step specific logs (located in the `build/` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app (.ipa or .app)

The .ipa is an iPhone application archive file which contains the iOS app. If the build has been correctly signed, the .ipa can be installed on a real device, corresponding to the provisioning profile used when signing. There are more [details about code signing and distribution with App Center](~/build/ios/code-signing.md).

If this is a simulator build, you can run the .app file on a simulator, but you cannot use it on a real device.

### 4.3. The symbol files (.dsym)

Symbol files are only generated for device builds.

The .dsym files contains the debug symbols for the app.

* If you have previously integrated the App Center SDK in your app with the crash reporting module enabled, the crash reporting service requires this .dsym file for a build in order to display human readable (symbolicated) crash reports.
* If you have previously integrated another SDK for crash reporting purposes in your app (e.g. HockeyApp SDK), the corresponding service requires the .dsym file in order to display human readable crash reports.

## Supported versions and requirements

App Center supports Portable Class Library (PCL) and [.NET Standard](https://docs.microsoft.com/dotnet/standard/net-standard) projects. Refer to [Cloud Build Machines](~/build/software.md) for versions of .NET Standard.

App Center does not support Components from the Xamarin Component Store and we advise using NuGet packages whenever they are available. If you are using a Component which cannot be replaced, please reach out to us: Click on the blue bubble on the bottom right corner once you're logged in to App Center and share your feedback with us.
