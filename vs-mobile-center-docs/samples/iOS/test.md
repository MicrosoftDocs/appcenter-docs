---
# required metadata

title: Test| Demo App Tutorials
description: Tutorial to test the sample app with Mobile Center.
keywords: mobile-center
authors: sabrinaj206 sshibu
ms.author: t-sajia t-shshib
ms.date: 06/26/2017
ms.topic: article
ms.service: mobile-center
ms.custom: samples
ms.prod: .net-core
ms.assetid: 6b151137-b1c3-41a7-bfbd-383c6f4c853c

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---

# Test

We've included XCUITests with the sample app. In this tutorial, you will learn to run the UI tests using Mobile Center.

First, follow the [getting started tutorial](/getting-started.md) to set up the sample app.

### Prerequisites
- Provisioning Profile and Certificate

## Install Mobile Center Command Line Interface

1. Install [Node.js](https://nodejs.org/en/) version 6.3 or later.
2. Open the terminal and run this to install the Mobile Center CLI:

```shell
npm install -g mobile-center-cli
```
3. Run this to log in to Mobile Center:

```shell
mobile-center login
```

## Codesign the project <!-- UPDATE THIS -->
1. Open **.xcworkspace** from the sample app's folder.
2. Go to **General** within the .xcodeproj file and changing the information under the **Signing** tabs.
3. Select **Automatically manage signing** to point to XCode to a certificate installed on your machine.
<!--
4. Change "Provisioning Profile" to match your own.
5. Go to the **Build Settings** tab and go to **Signing**, then **Code Signing Identity**. Change the selection for all four tabs under Code Signing Identity (Debug, Any iOS SDK, Release, Any iOS SDK) to your unique identity in keychain.
6. Change **Deployment Team** to your own and **Provisioning Profile** to your provisioning profile.
7. Going to **General** within the .xcodeproj file, going to the first subsection, **Identity** and changing the information for **Bundle Identifier**. Use the bundle associated with the app in your Apple Developer account. See additional information [here](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html).
-->
## Make the test folder
1. Open a terminal and go to the project directory.
2. Run this to remove the derivedDataPath if it exists:
```shell
rm -rf ddp
```
3. Run this to build the project for tests: <!-- NEEDS UPDATE-->
```shell
xcrun xcodebuild build-for-testing -configuration Debug -workspace YOUR_WORKSPACE -sdk iphoneos -scheme YOUR_APPLICATION_SCHEME -derivedDataPath ddp
```

## Prepare to run tests in Mobile Center
1. Go to the **Test** service in [Mobile Center](https://mobile.azure.com/apps).
2. Click on **Start testing your app**.
3. Select one device, the **Apple iPhone 7**, and press **Select one device** at the bottom.
4. Choose **XCUITest** as the Test framework.
5. Click **Next**.


## Run the tests
1. Copy the custom command under **Running tests**.
2. Paste it into the terminal while in the project directory.
3. Replace ```pathToXCUItestBuildFolder``` in the command. <!-- NEEDS UPDATE-->
4. Run the command. You will see the tests begin to run.
5. In Mobile Center, click **Done**.
