---
title: Configure a Objective-C or Swift iOS build in App Center
description: How to set up a build for iOS apps created with Xcode
keywords: build, ios
author: siminapasat
ms.author: siminap
ms.date: 04/16/2018
ms.topic: article
ms.assetid: 9e32f306-5be6-40e2-846c-1742d6b083aa
ms.service: vs-appcenter
ms.custom: build
ms.tgt_pltfrm: ios
---

# Building Objective-C or Swift apps for iOS

To start building your first native iOS app, you will need to the following:
1. Connect to your repository service account (GitHub, Bitbucket, VSTS).
2. Select a repository and a branch where your app lives.
3. Configure the build's project or workspace, and the scheme you would like to build.

> [!NOTE]
> For the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

## 1. Linking your repository
If you haven't previously connected to your repository service account, you will need to do this. Once your account is connected, select the repository where your iOS project is located. In order to setup a build for a repository, you need admin and pull permission for it.

## 2. Selecting a branch
After selecting a repository, select the branch you want to build. By default, all the active branches will be listed. 

## 3. Setting up your first build
Before your first build, the iOS project needs to be configured.

### 3.1 Project/workspace and scheme
For a build configuration, an Xcode project or an Xcode workspace and a shared scheme are required. App Center automatically detects the projects, workspaces and shared schemes in your branch. Select the project or the workspace you want to build and the corresponding scheme.
If no scheme can be found, make sure that the scheme you want to build with is shared and that the container for the scheme is the project or the workspace you have selected and that these changes are checked into the branch you are setting up the build for.

![Mark scheme as shared][xcode-share-scheme]

### 3.2. Xcode version
Select the Xcode version to run the build on.

### 3.3. Build triggers
By default, a new build is triggered every time a developer pushes to a configured branch. This is referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the build configuration.

### 3.4. Increment build number
When enabled, the `CFBundleVersion` in the Info.plist of your app automatically increments for each build. The change happens pre-build and won't be committed to your repository.

### 3.5. Tests
If the selected scheme has a test action with a test target selected, you can configure the tests to run as part of each build. App Center can currently run XCTest unit tests.

### 3.6. Code signing
A successful build will produce a .ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload [a provisioning profile (.mobileprovision) and a valid certificate (.p12)](~/build/ios/uploading-signing-files.md), along with the password for the certificate. The settings in your Xcode project need to be compatible with the files you are uploading. You can read more about code signing [here](~/build/ios/code-signing.md) and in the [official Apple Developer documentation](https://developer.apple.com/support/code-signing/).

### 3.7. Launch your successful build on a real device
Use your newly produced .ipa file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. Read more about it [here](~/build/build-test-integration.md).

### 3.8. CocoaPods
App Center scans the selected branch and if it finds a Podfile, it will automatically do a `pod install` step at the beginning of every build. This will ensure that all dependencies are installed. 
If the repository already contains a */Pods* folder, App Center assumes you have checked in the pods in your repository and will no longer perform `pod install`.

### 3.9. Distribute to a distribution group**
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
    |-- <build-step-1> (e.g. 2_Get Sources.txt)
    |-- <build-step-2> (e.g. 3_Pod install.txt)
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```

The build step specific logs (located in the `build/` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

### 4.2. The app (.ipa)
The .ipa file is an iPhone application archive file which contains the iOS app.
* If the build has been signed correctly, the .ipa file can be installed on a real device corresponding to the provisioning profile used when signing. More details about code signing and distribution with App Center can be found [here](~/build/ios/code-signing.md).
* If the build has not been signed, the .ipa file can be signed by the developer (e.g. locally using codesign) or used for other purposes (e.g. upload to Test service for UI testing on real devices or run in the simulator).
* Unsigned builds will not produce an .ipa file. The artifact of an unsigned build is the .xcarchive file which can be used to generate an .ipa file with the Xcode Archives organizer.

### 4.3. The symbols file (.dsym)
The .dsym files contain the debug symbols for the app.
* If you have previously integrated the App Center SDK in your app with the crash reporting module enabled, the crash reporting service requires this .dsym file for a build in order to display human readable (symbolicated) crash reports.
* If you have previously integrated another SDK for crash reporting purposes in your app (e.g. HockeyApp SDK), the corresponding service requires the .dsym file in order to display human readable crash reports.

Keep in mind that the .dsym files do not change upon code signing the .ipa. If you decide to code sign the build later, the .dsym generated before code signing is still valid.

[xcode-share-scheme]: images/xcode-share-scheme.png "Marking a scheme as shared in Xcode"

## Supported versions and requirements
You can check out which Xcode versions we support [here](~/build/software.md#xcode).

The build machines are running OS X 10.11.6 (15G1004). We keep an eye on the latest versions released by Apple and include them as soon as possible on the VMs used to run the builds.
