---
# required metadata

title: Getting Started | Sample App Tutorials
description: Tutorial to onboard an iOS application in Mobile Center
keywords: mobile-center
authors: sabrinaj206
ms.author: t-sajia
ms.date: 06/26/2017
ms.topic: article
ms.service: mobile-center
ms.custom: samples
ms.prod: .net-core
ms.assetid: f2af4edd-7d50-4e2d-8dd2-04eea4b755eb

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---

# Getting Started - Sample Swift App and Tutorials

In this tutorial, you will learn how to set up a sample Swift app with Mobile Center for iOS. Note that both Objective-C and Swift are supported.

### Prerequisites
- [GitHub account](https://github.com/join)
- [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12#)

## Login to Github and fork the repository
1. Login to your [GitHub account](https://github.com/join).
2. Access the [sample app's GitHub repository](https://github.com/MobileCenter/sampleapp-ios-swift).
3. Click **Fork** at the top right hand corner of the page, and clone the repository.

## Integrate CocoaPods
1. Open a terminal and go to the sample app's directory.
2. Run the command below to install CocoaPods:

  ```shell
  sudo gem install cocoapods
  ```

3. The included Podfile lists the dependencies in the source code. To install them, run the command below:

  ```shell
  pod install
  ```

4. Open the **.xcworkspace** and press **Run**. The app should build without error.

  <!--![Install Cocoapods](images/install_cocoapods_ios.gif)-->

## Sign in to Mobile Center
1. Open the [Mobile Center portal](https://mobile.azure.com).
2. Click **Connect with GitHub** and log in, or use another provider.

## Create a new app in Mobile Center
1. Click **Add new app**.
2. Name the app **Sample iOS App**.
3. Choose **iOS** and **Objective-C / Swift**.
4. Click **Add new app** at the bottom.  
  <!--![Make a new app](images/Make_new_app_ios.gif)-->

## Replace the App Secret

In order for the sample app to send information to Mobile Center, the app secret must be changed in Xcode.

1. Navigate to the **Settings** page in Mobile Center.
2. Copy the **App Secret** at the top.
3. Open the **.xcworkspace** from the sample app folder.
4. In **AppDelegate.swift**, edit the **didFinishLaunchingWithOptions** delegate method and paste your App Secret at the placeholder.
5. **Add, commit, and push changes to your forked repository.** This can be done from the terminal, or a tool of your choice.

  ![Replace the App Secret](images/Change_app_secret_ios.gif)

## Codesign the project

_Codesigning is optional, but recommended._

In order to run tests, distribute the app to users, and send push notifications, the code must be signed. Read more at the [Apple Developer Documentation](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html).

When creating a new App ID for this sample app, be sure to check the **Push Notifications** service under the **App Services** section.

  ![Push App Service](images/AppID_push_ios.png)

  1. Open **.xcworkspace** from the sample app's folder.
  2. Go to **General** within the .xcworkspace file.
  3. Under **Identity**, edit the **Bundle Identifier** to match the app ID.
  4. Import and select the provisioning profile under **Signing (Debug)** and **Signing (Release)**.
  5. **Add, commit, and push changes to your forked repository.** This can be done from the terminal, or a tool of your choice.

    ![Codesigning](images/Manual_sign_ios.png)
