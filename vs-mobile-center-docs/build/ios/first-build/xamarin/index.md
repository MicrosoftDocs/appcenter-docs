---
title: Mobile Center Build for Xamarin.iOS
description: How to set up a build for Xamarin.iOS apps
keywords: build, xamarin, ios
author: siminapasat
ms.author: siminap
ms.date: 01/20/2017
ms.topic: article
ms.assetid: 08a32d64-6369-49d9-a6c9-78bfc9ef36b6
ms.service: mobile-center
ms.custom: build
ms.tgt_pltfrm: xamarin-ios
---

# Xamarin.iOS Build
To start building a Xamarin iOS app, first of all, you need to connect to your repository service (GitHub, Bitbucket, VSTS) account, select a repository and a branch where your app lives and then you can set up your first build. Choose the solution file and the configuration that you would like to build; for the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

## 1. Linking your repository
If you haven't done it previously already, first of all, you have to connect your repository service (GitHub, Bitbucket, VSTS) account. Once your account is connected, select the repository where your iOS project is located. In order to setup a build for a repository, you need admin and pull rights for it.

## 2. Selecting a branch
Next step once you have selected a repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

## 3. Setting up your first build
To kick off the first build, configure how the iOS project should get built.

### 3.1. Project/solution
Mobile Center automatically detects the solution files in your repository. Select the **.sln** you would like to build. In your code, make sure to disable Android and UWP projects for build configs that are intended for iOS builds: go into the solution's configuration mappings, and for all mappings that target **iPhone** and **iPhoneSimulator**, uncheck all the projects which are targeting other platforms. This will ensure that when the **.sln** is building, it will not attempt to build the other projects. There is more [solution configurations mapping information](solution-configuration-mappings.md) you can read.

### 3.2. Configuration
Select the configuration you would like to build with. The configurations are automatically detected depending on the solution picked in the previous step.

### 3.3. Mono version
Mobile Center allows using different Mono environments for your build to maintain backward compatibility while releasing a support for new features. The default Mono version for a new branch configuration will be the latest one. You may choose to use one of the previous Mono environments to build older versions of frameworks or libraries.

### 3.4. **Xcode Version
Current version of Xamarin requires Xcode 8.0 or higher.

### 3.5. Build triggers
By default a new build is triggered on every push a developer does to the configured branch. This is often referred to as "Continuous Integration". If you prefer to manually trigger a new build, you can change this setting in the configuration pane.

### 3.6. Simulator build
Simulator builds can only be ran on simulators and cannot be installed on the device, however the builds complete faster then device builds. If your build is not a simulator build, you need to upload code signing files in the next step.

### 3.7. Code signing
A successful device build will produce an ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload [a provisioning profile (.mobileprovision) and a valid certificate (.p12)](../../code-signing/uploading-files.md), along with the password for the certificate. You can read more about code signing and device provisioning of Xamarin iOS apps in the [Xamarin official documentation](https://developer.xamarin.com/guides/ios/getting_started/installation/device_provisioning/).

### 3.8. Launch your successful build on a real device
Use your newly produced IPA file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. You may want to check more [comprehensive guide about testing your builds](~/build/build-test-integration.md)

### 3.9. NuGet restore
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

### 3.10. Distribution to a distribution group
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
For a completed build (succeeded or failed), download the logs to understand more about how the build went. Mobile Center provides an archive with the following files:
```
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1> (e.g. 2_Get Sources.txt)
    |-- <build-step-2> (e.g. 3_Pod install.txt)
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```

The build step specific logs (located in the `build/` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app (.ipa or .app)
The .ipa is an iPhone application archive file which stores the iOS app. If the build has been correctly signed, the .ipa can be installed on a real device, corresponding to the provisioning profile used when signing. There are more [details about code signing and distribution with Mobile Center](../../code-signing/index.md).

If this is a simulator build, you can run the .app file on a simulator, but you cannot use it on a real device.

### 4.3. The symbol files (.dsym)
Symbol files are only generated for device builds.
The .dsym files contains the debug symbols for the app.
* if you have previously integrated the Mobile Center SDK in your app with the crash reporting module enabled, the crash reporting beacon requires this .dsym file for a build in order to display human readable (symbolicated) crash reports
* if you have previously integrated another SDK for crash reporting purposes in your app (e.g. HockeyApp SDK), the corresponding service requires the .dsym file in order to display human readable (symbolicated) crash reports

## Supported versions and requirements
Mobile Center supports Portable Class Library (PCL) projects, but does not currently support .NET Standard.
Mobile Center has no support for Components from the Xamarin Component Store and we advise using NuGet packages whenever they are available. If you are using a Component which cannot be replaced, please reach out to us: Click on the blue bubble on the bottom right corner once you're logged in to Mobile Center and share your feedback with us.
