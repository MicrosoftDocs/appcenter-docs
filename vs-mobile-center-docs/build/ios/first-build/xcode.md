---
title: Building Xcode iOS apps in Mobile Center
description: How to set up a build for iOS apps created with Xcode
keywords: build, ios
author: siminapasat
ms.author: siminap
ms.date: 04/26/2017
ms.topic: article
ms.assetid: 9e32f306-5be6-40e2-846c-1742d6b083aa
ms.service: mobile-center
ms.custom: build
ms.tgt_pltfrm: ios
---

# Building Xcode iOS apps

To start building a native iOS app, you will firstly need to connect to your repository service account (GitHub, Bitbucket, VSTS), select a repository and a branch where your app lives and then you can set up your first build. Choose the Xcode project or workspace and the scheme that you would like to build; for the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

## 1. Linking your repository
If you haven't previously connected to your repository service (GitHub, Bitbucket, VSTS) account, you will firstly need to do this. Once your account is connected, select the repository where your iOS project is located. In order to setup a build for a repository, you need admin and pull rights for it.

## 2. Selecting a branch
The next step once you have selected a repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

## 3. Setting up your first build
To kick off the first build, configure how the iOS project should get built.

### 3.1. Project/workspace and scheme

For a build configuration, an Xcode project or an Xcode workspace and a shared scheme are required. Mobile Center automatically detects the projects, workspaces and shared schemes in your branch. Select the project or the workspace you want to build and the corresponding scheme.
If no scheme can be found, make sure that the scheme you want to build with is shared and that the container for the scheme is the project or the workspace you have selected and that these changes are checked into the branch you are setting up the build for.

![Mark scheme as shared][xcode-share-scheme]

### 3.2. Xcode version
Select the Xcode version to run the build on.

### 3.3. Build triggers
By default a new build is triggered on every push a developer does to the configured branch. This is often referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

### 3.4 Tests
If the selected scheme has a test action with a test target selected, you can configure to run the tests as part of each build. Mobile Center can currently run XCTest unit tests.

### 3.5. Code signing
A successful build will produce a .ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload [a provisioning profile (.mobileprovision) and a valid certificate (.p12)](../code-signing/uploading-files.md), along with the password for the certificate. The settings in your Xcode project need to be compatible with the files you are uploading. You can read more about code signing [here](../code-signing/index.md) and in the [official Apple Developer documentation](https://developer.apple.com/support/code-signing/).

### 3.6. Launch your successful build on a real device
Use your newly produced IPA file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. Read more about it [here](~/build/build-test-integration.md)

### 3.7. CocoaPods
Mobile Center scans the selected branch and if it finds a Podfile, it will automatically do a `pod install` step at the beginning of every build. This will ensure that all dependencies are installed. 
If the repository already contains a */Pods* folder, Mobile Center assumes you have checked in the pods in your repository and will no longer perform `pod install`.

### 3.8. Distribution to a distribution group**
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

### 4.2. The app (.ipa)
The .ipa is an iPhone application archive file which contains the iOS app.
* if the build has been signed correctly, the .ipa can be installed on a real device, corresponding to the provisioning profile used when signing. More details about code signing and distribution with Mobile Center can be found [here](../code-signing/index.md).
* if the build has not been signed, the .ipa can be signed by the developer (e.g. locally using xcodesign) or used for other purposes (e.g. upload to TestCloud for UI testing on real devices or run in the simulator)

### 4.3. The symbols file (.dsym)
The .dsym files contain the debug symbols for the app.
* if you have previously integrated the Mobile Center SDK in your app with the crash reporting module enabled, the crash reporting service requires this .dsym file for a build in order to display human readable (symbolicated) crash reports
* if you have previously integrated another SDK for crash reporting purposes in your app (e.g. HockeyApp SDK), the corresponding service requires the .dsym file in order to display human readable (symbolicated) crash reports

Keep in mind that the .dsym files do not change upon code signing the .ipa. If you decide to code sign the build later, the .dsym generated before code signing is still valid.

[xcode-share-scheme]: images/xcode-share-scheme.png "Marking a scheme as shared in Xcode"

## Supported versions and requirements
The following versions of Xcode are currently supported on our VMs.

* Xcode 8.3.2
* Xcode 8.3.1
* Xcode 8.2.1
* Xcode 8.2
* Xcode 8.1
* Xcode 8.0

The build machines are running OS X 10.11.6 (15G1004). We keep an eye on the latest versions released by Apple and include them as soon as possible on the VMs used to run the builds.
