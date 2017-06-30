---
# required metadata

title: Test| Demo App Tutorials
description: Tutorial to test the sample app with Mobile Center.
keywords: mobile-center
authors: sshibu
ms.author: t-shshib
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

In this tutorial you, will learn to run the sample app's UI tests using Mobile Center.

First, follow the [getting started tutorial](/getting-started.md) to set up the sample app.

### Prerequisites
- Provisioning profile and Certificate (optional)

## Install Mobile Center Command Line Interface

1. Install [Node.js](https://nodejs.org/en/) version 6.3 or later.
2. Open the terminal and run this to install the Mobile Center CLI:
```
npm install -g mobile-center-cli
```
3. Run this to log in to Mobile Center:
```
mobile-center login
```

## Codesign the project <!-- UPDATE THIS -->
1. Open **.xcworkspace** from the sample app's folder.
2. Go to **General** within the .xcodeproj file and changing the information under the **Signing** tabs.
3. Deselect "Automatically manage signing."
4. Change "Provisioning Profile" to match your own.
5. Go to the **Build Settings** tab and go to **Signing**, then **Code Signing Identity**. Change the selection for all four tabs under Code Signing Identity (Debug, Any iOS SDK, Release, Any iOS SDK) to your unique identity in keychain.
6. Change **Deployment Team** to your own and **Provisioning Profile** to your provisioning profile.
7. Going to **General** within the .xcodeproj file, going to the first subsection, **Identity** and changing the information for **Bundle Identifier**. Use the bundle associated with the app in your Apple Developer account. See additional information [here](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html).

## Submit tests to Mobile Center

1. Go to Test in Mobile Center
2. Click on **Start testing your app** at the center of the page.
3. Select one device, the **Apple iPhone 7**, and press **Select one device >** at the bottom right hand corner of the page.
4. The next page allows you to configure the test run. Make sure **Test series** and **System language** remain the same, master and English respectively, but change the **Test framework** to XCUITest. Click next.
5. Go to the **Running tests** section and copy the custom command. Make sure that pathToXCUItestBuildFolder is modified with the path to the build folder containing a .app file.
5. On the Submit page, double check that all of the instructions have been followed. Press **Done**.

Your test is now able to run.
