---
# required metadata

title: Test| Demo App Tutorials
description: Tutorial for user to run a test with sample app.
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

In this tutorial you will test this app on Test Cloud. The test feature runs mobile apps on hundreds of unique devices within a Microsoft data center. Test results are accessible through Mobile Center.

You can run tests on multiple devices, view screenshots captured within a test run, and view the device log for all selected devices in a test run.




## Install CLI and codesign the project

1. Install Node.js version 6.3 or later [here](https://nodejs.org/en/).
2. Install Mobile Center Command Line Interface.
Run the following command in terminal:
```
npm install -g mobile-center-cli
```
Once the CLI tool is installed, run the following command to login to Mobile Center from the CLI:
```
mobile-center login
```

3. Codesign the project by:
  -  Having an Apple developer certificate available on your local machine. This is essential for test in this case; additional information can be found [here](https://developer.apple.com/support/certificates/).
  - Having a provisioning profile available on your local machine.
  - Going to **General** within the .xcodeproj file and changing the information under the **Signing** tabs.
    - First, deselect "Automatically manage signing."
    - Change "Provisioning Profile" to match your own.
    - Go to the **Build Settings** tab and go to **Signing**, then **Code Signing Identity**. Change the selection for all four tabs under Code Signing Identity (Debug, Any iOS SDK, Release, Any iOS SDK) to your unique identity in keychain.
    Change **Deployment Team** to your own and **Provisioning Profile** to your provisioning profile.
  - Going to **General** within the .xcodeproj file, going to the first subsection, **Identity** and changing the information for **Bundle Identifier**. Use the bundle associated with the app in your Apple Developer account. See additional information [here](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html).



## Submit tests to Mobile Center


1. Go to Test in Mobile Center
2. Click on **Start testing your app** at the center of the page.
3. Select one device, the **Apple iPhone 7**, and press **Select one device >** at the bottom right hand corner of the page.
4. The next page allows you to configure the test run. Make sure **Test series** and **System language** remain the same, master and English respectively, but change the **Test framework** to XCUITest. Click next.
5. Go to the **Running tests** section and copy the custom command. Make sure that pathToXCUItestBuildFolder is modified with the path to the build folder containing a .app file.
5. On the Submit page, double check that all of the instructions have been followed. Press **Done**.

Your test is now able to run.
