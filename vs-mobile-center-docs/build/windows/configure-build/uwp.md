---
title: Building UWP apps
description: How to set up a build for UWP C#
keywords: build, windows
author: siminapasat
ms.author: siminap
ms.date: 05/10/2017
ms.topic: article
ms.assetid: c70ea80b-9f31-4015-9b9a-c352d305e11f
ms.service: mobile-center
ms.custom: build
ms.tgt_pltfrm: windows
---

# Building UWP C# apps for Windows
To start building an app, first of all, you need to connect to your repository service (GitHub, Bitbucket, VSTS) account, select a repository and a branch where your app lives and then you can set up your first build. Choose the UWP solution that you would like to build.

## 1. Linking your repository
If you haven't previously connected to your repository service (GitHub, Bitbucket, VSTS) account, you will firstly need to do this. Once your account is connected, select the repository where your UWP C# solution is located. In order to setup a build for a repository, you need admin and pull rights for it.

## 2. Selecting a branch
The next step once you have selected a repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

## 3. Setting up your first build
To kick off the first build, configure how the UWP C# solution should get built.

### 3.1. Select solution
First, make sure the right solution is selected.

### 3.2. Configuration
The available build configurations will populate from your solution. By default it is [Debug and Release](https://blogs.windows.com/buildingapps/2015/08/20/net-native-what-it-means-for-universal-windows-platform-uwp-developers/#rwdxOEJDZ2piSGPk.97). Select which configuration should be built.

### 3.3. Platforms
Select the platforms your UWP app should be built for.

### 3.4. Increment version number
When enabled, the version number of your app automatically increments for each build. The version format is `{Major}.{Minor}.{Build}.{Revision}`, we only increase the Build number. The change happens pre build and won't be committed to your repository.

### 3.5. Simulator build
Simulator builds can only be ran on simulators and cannot be installed on the device, however the builds complete faster then device builds. If your build is not a simulator build, you need to upload code signing files in the next step.

### 3.6. Code signing
Uploading your own certificate is optional. In case you don't provide one, Mobile Center will automatically generate a temporary certificate and sign the build for you. Please note that the certificate is unique for each build.

### 3.7. NuGet restore
If the **NuGet.config** file is checked-in into the repository and sitting next to the **.sln** or at the root, Mobile Center will auto-restore the NuGet feed. 
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

### 3.8. Distribution to a distribution group
You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app.

Once you save the configuration, a new build will be kicked off automatically.

### 4. Supported versions and requirements
The minimum [Windows 10 Build](https://docs.microsoft.com/en-us/windows/uwp/updates-and-versions/choose-a-uwp-version) supported to build UWP apps is 10240. Our build machines are running Visual Studio 2017.
