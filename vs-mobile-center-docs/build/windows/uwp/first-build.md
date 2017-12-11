---
title: Configure a C# UWP app in App Center
description: How to set up a build for UWP C#
keywords: build, windows
author: siminapasat
ms.author: siminap
ms.date: 05/10/2017
ms.topic: article
ms.assetid: c70ea80b-9f31-4015-9b9a-c352d305e11f
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: windows
---

# Building UWP C# apps for Windows

To start building your first UWP app, you will need to the following:
1. Connect to your repository service account (GitHub, Bitbucket, VSTS).
2. Select a repository and a branch where your app lives.
3. Set up your first build.

## 1. Linking your repository
If you haven't previously connected to your repository service account, you will need to do this. Once your account is connected, select the repository where your UWP project is located. In order to setup a build for a repository, you need admin and pull permission for it.

## 2. Selecting a branch
After selecting a repository, select the branch you want to build. By default, all the active branches will be listed.

## 3. Setting up your first build
Before your first build, the UWP project needs to be configured.

### 3.1. Select solution
First, make sure the right solution is selected. The available solutions in your repository will populate if they are located within the range of analysis. 

> [!NOTE]
> All projects referenced in the solution will be built, make sure those are only for UWP and in C#.</br>
> For best performance, the analysis is limited to two directory levels including the root of your repository. 

### 3.2. Configuration
The available build configurations will populate from your solution. By default it is [Debug and Release](https://blogs.windows.com/buildingapps/2015/08/20/net-native-what-it-means-for-universal-windows-platform-uwp-developers/#rwdxOEJDZ2piSGPk.97). Select which configuration should be built.

### 3.3. Platforms
Select the platforms your UWP app should be built for.

### 3.4. Increment version number
When enabled, the version number of your app automatically increments for each build. The version format is `{Major}.{Minor}.{Build}.{Revision}`, we only increase the Build number. The change happens pre build and won't be committed to your repository.

### 3.5. Simulator build
Simulator builds can only be ran on simulators and cannot be installed on the device, however the builds complete faster then device builds. If your build is not a simulator build, you need to upload code signing files in the next step.

### 3.6. Code signing
Uploading your own certificate is optional. In case you don't provide one, App Center will automatically generate a temporary certificate and sign the build for you. Please note that the certificate is unique for each build.

### 3.7. NuGet restore
If the **NuGet.config** file is checked-in into the repository and sitting next to the **.sln** or at the level of your repository, App Center restores your private NuGet feeds when they are added as shown in the example below. Credentials can be added safely by using [environment variables](~/build/custom/scripts/index.md):

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
      <add key="Username" value="%USER_VARIABLE%" />
      <add key="ClearTextPassword" value="%PASSWORD_VARIABLE%" />
    </MyAuthNuget>
  </packageSourceCredentials>
</configuration>
```
If you have complex configurations and need more information, please refer to [Configuring NuGet behavior](https://docs.microsoft.com/nuget/consume-packages/configuring-nuget-behavior).

### 3.8. Distribute to a distribution group
You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app.

Once you save the configuration, a new build will be kicked off automatically.

### 4. Supported versions and requirements
The minimum [Windows 10 Build](https://docs.microsoft.com/en-us/windows/uwp/updates-and-versions/choose-a-uwp-version) supported to build UWP apps is 10240. Our build machines are running Visual Studio 2017.
