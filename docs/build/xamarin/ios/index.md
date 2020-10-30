---
title: Configure a Xamarin iOS build in App Center
description: How to set up a build for Xamarin.iOS apps
keywords: build, xamarin, ios
author: king-of-spades
ms.author: kegr
ms.reviewer: kegr
ms.date: 03/26/2020
ms.topic: article
ms.assetid: 08a32d64-6369-49d9-a6c9-78bfc9ef36b6
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: xamarin-ios
---

# Building Xamarin apps for iOS
> [!NOTE] 
> Supported versions and requirements
App Center supports Portable Class Library (PCL) and [.NET Standard](https://docs.microsoft.com/dotnet/standard/net-standard) projects. Refer to [Cloud Build Machines](~/build/software.md) for versions of .NET Standard. 
App Center doesn't support Components from the Xamarin Component Store and we advise using NuGet packages whenever available. If you're using a Component that can't be replaced, contact us. See [help and feedback](../../../help.md).

To start building your first Xamarin iOS app, you'll need to:

1. Connect to your repository service account (GitHub, Bitbucket, VSTS, Azure DevOps).
2. Select a repository and a branch where your app lives.
3. Configure the build's project or workspace, and the scheme you would like to build.

> [!NOTE]
> For the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

## 1. Linking your repository
If you haven't previously connected to your repository service account, you'll need to connect it. Once your account is connected, select the repository where your iOS project is located. To set up a build for a repository, you need admin and pull permission for it.

## 2. Selecting a branch
After selecting a repository, select the branch you want to build. By default all the active branches will be listed.

## 3. Setting up your first build
Before your first build, the Xamarin project needs to be configured.

### 3.1. Project/solution
App Center automatically detects the solution and project files in your repository if they're located within the range of analysis. Select the **.sln** or **.csproj/.fsproj** you would like to build.

> [!NOTE]
> For best performance, the analysis is currently limited to two directory levels for **.sln** and four directory levels for **.csproj/fsproj** including the root of your repository.

#### 3.1.1. Building from the solution file (.sln)
In your code make sure to disable Android and UWP projects for build configs that are intended for iOS builds: go into the solution's configuration mappings, and for all mappings that target **iPhone** and **iPhoneSimulator**, uncheck all projects targeting other platforms. This change will ensure that when the **.sln** is building, it won't attempt to build the other projects. There's more [solution configurations mapping information](~/build/xamarin/solution-configuration-mappings.md) you can read.

#### 3.1.2. Building from the project file (.csproj/.fsproj)
To build from a **.csproj/.fsproj** file all the referenced projects (for example, your PCL project) must contain the configuration with the same name as the one from your source iOS project. So, if you run the **Debug** configuration for the simulator in App Center, your PCL project must have the **Debug|iPhoneSimulator** configuration. In case they don't exist and to prevent further errors we add such configurations before building your projects. Those configurations have basic default settings for Debug and Release only.

### 3.2. Configuration
Select the configuration you would like to build with. The configurations are automatically detected depending on the source file picked in the previous step.

### 3.3. Mono version
App Center allows using different Mono environments bundled with respective Xamarin.iOS SDK for your build to maintain backward compatibility while releasing a support for new features. The default Mono for a new branch configuration will be the latest stable one. You may choose to use one of the previous Mono environments to build older versions of frameworks or libraries. When you choose a different Mono version, you'll see the Xamarin.iOS SDK version that's bundled with it. To track Xamarin SDK version updates, you can read posts in the [Xamarin release blog](https://releases.xamarin.com/).

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

### 3.4. Xcode Version

Currently supported versions of Xamarin require Xcode 9.4.1 or higher

### 3.5. Build triggers
By default, a new build is triggered every time a developer pushes to a configured branch. If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

### 3.6. Simulator build
Simulator builds can only be ran on simulators and can't be installed on the device, however the builds complete faster than device builds. If your build isn't a simulator build, you need to upload code signing files in the next step.

### 3.7. Increment build number
When enabled, the `CFBundleVersion` in the Info.plist of your app automatically increments for each build. The change happens pre-build and won't be committed to your repository.

### 3.8. Code signing
A successful device build will produce an IPA file. To install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload [a provisioning profile (`.mobileprovision`) and a valid certificate (`.p12`)](~/build/ios/code-signing.md#finding-provisioning-profiles), along with the password for the certificate. You can read more about code signing and device provisioning of Xamarin iOS apps in the [Xamarin documentation](https://docs.microsoft.com/xamarin/ios/get-started/installation/device-provisioning/).

Apps with [app or watchOS extensions](https://docs.microsoft.com/xamarin/ios/platform/extensions) require an additional provisioning profile per extension to be signed.

> [!NOTE]
> There's an [existing issue](https://github.com/xamarin/xamarin-macios/issues/5878) when running `nuget restore` in projects containing Xamarin watchOS apps.
> Building a watchOS app on App Center without a workaround will result in an error: 
>
>`Project <project> is not compatible with xamarinios10 (Xamarin.iOS,Version=v1.0) / win-x86. Project <project> supports: xamarinwatchos10 (Xamarin.WatchOS,Version=v1.0)`.
>
> To build watchOS apps on App Center, a workaround is required. Within the containing iOS project, which references to the Watch App, an [additional line must be included](https://github.com/xamarin/xamarin-macios/issues/5878#issuecomment-481277798):
>
> `<ReferenceOutputAssembly>False</ReferenceOutputAssembly>`
>
> Example WatchApp reference with workaround:

```xml
    <ProjectReference Include="..\MyWatchApp\MyWatchApp.csproj">
      <Project>{59EB034F-3D29-43A5-B89F-124879504771}</Project>
      <Name>MyWatchApp</Name>
      <IsWatchApp>True</IsWatchApp>
      <ReferenceOutputAssembly>False</ReferenceOutputAssembly>
    </ProjectReference>
```

### 3.9. Launch your successful build on a real device
Use your newly produced .ipa file to test if your app starts on a real device. Launch testing adds about 10 more minutes to the build time. You may want to check more [comprehensive guide about testing your builds](~/build/build-test-integration.md)

### 3.10. NuGet restore
If the **NuGet.config** file is checked-in for the repository and sitting next to the **.sln** or the root level of your repository, App Center restores your private NuGet feeds when they're added as shown in the example below. Credentials can be added safely by using [environment variables](~/build/custom/scripts/index.md):

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

If you have complex configurations and need more information, refer to [Configuring NuGet behavior](https://docs.microsoft.com/nuget/consume-packages/configuring-nuget-behavior).

### 3.11. Distribute to a distribution group
You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There's always a default distribution group called "Collaborators" that includes all the users who have access to the app.

Once you save the configuration, a new build will be automatically kicked off.

## 4. Build results
After a build has been triggered, it can be in the following states:

* **queued** - The build is in a queue waiting for resources to be freed up.
* **building** - The build is running and executing the predefined tasks.
* **succeeded** - The build is completed and it has succeeded.
* **failed** - The build has completed but it has failed. You can troubleshoot what went wrong by downloading and inspecting the build log.
* **canceled** - The build has been canceled by a user action or it has timed out.

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

The build step-specific logs (located in the `build/` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app (`.ipa` or `.app`)
The `.ipa` is an iOS application archive file that contains the iOS app. If the build has been correctly signed, the `.ipa` can be installed on a real device, corresponding to the provisioning profile used when signing. There are more [details about code signing and distribution with App Center](~/build/ios/code-signing.md).

If the app is a simulator build, you can run the `.app` file on a simulator, but you can't use it on a real device.

### 4.3. The symbol files (.dsym)
Symbol files are only generated for device builds. The .dsym files contain the debug symbols for the app.

* If previously integrated the App Center SDK in your app with the crash reporting module enabled, the crash reporting service requires this .dsym file for a build to display human readable (symbolicated) crash reports.
* If you previously integrated another SDK for crash reporting in your app (for example, HockeyApp SDK), the corresponding service requires the .dsym file to display human readable crash reports.


