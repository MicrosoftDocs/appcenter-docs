title: Building UWP apps
description: How to set up a build for UWP C#
keywords: build, windows
author: danieladams
ms.author: v-daada
ms.date: 05/10/2017
ms.topic: article
ms.assetid: c70ea80b-9f31-4015-9b9a-c352d305e11f
ms.service: mobile-center
ms.custom: build
ms.tgt_pltfrm: windows
---

# Building UWP C# apps for Windows
To start building a native iOS app, you will firstly need to connect to your repository service account (GitHub, Bitbucket, VSTS), select a repository and a branch where your app lives and then you can set up your first build. Choose the Xcode project or workspace and the scheme that you would like to build; for the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

## 1. Linking your repository
If you haven't previously connected to your repository service (GitHub, Bitbucket, VSTS) account, you will firstly need to do this. Once your account is connected, select the repository where your UWP C# solution is located. In order to setup a build for a repository, you need admin and pull rights for it.

## 2. Selecting a branch
The next step once you have selected a repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

## 3. Setting up your first build
To kick off the first build, configure how the UWP C# solution should get built.

### 3.1. Select project
First, make sure the right solution is selected.

### 3.2. Configuration
The available build configurations will populate from your solution. By default it's [Debug and Release](https://blogs.windows.com/buildingapps/2015/08/20/net-native-what-it-means-for-universal-windows-platform-uwp-developers/#rwdxOEJDZ2piSGPk.97). Select which configuration should be built.

### 3.3. Platforms
Select the platforms your UWP app should be build for.

### 3.4. Build triggers
By default a new build is triggered on every push a developer does to the configured branch. This is often referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

### 3.5. Code signing
Uploading your own certificate is optional. In case you don't provide one, Mobile Center will automatically generate a temporary certificate and sign the build for you. Please note that the certificate is unique for each build.

### 3.6. Distribution to a distribution group**
You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app.

Once you save the configuration, a new build will be kicked off automatically.

### 4. Supported versions and requirements
The minimum [Windows 10 Build](https://docs.microsoft.com/en-us/windows/uwp/updates-and-versions/choose-a-uwp-version) supported to build UWP apps is 10240. Our build machines are running Visual Studio 2017.