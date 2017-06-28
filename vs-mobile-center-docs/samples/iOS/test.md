---
# required metadata

title: Test| Demo App Tutorials
description: onboard with the test beacon by using test feature through sample app.
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
## About this feature

Test runs native and hybrid mobile apps on hundreds of unique devices, with many models and operating system configurations, within a Microsoft data center. Test results are accessible through Mobile Center.

You can run tests on multiple devices, view screenshots captured within a test run, and view the device log for all selected devices in a test run.




## Prerequisite steps to work with test

#### Install Node.js
Install version 6.3 or later [here](https://nodejs.org/en/).

#### Install Mobile Center Command Line Interface
Install version 0.2.1 or later.
Run the following command in terminal:
```
npm install -g mobile-center-cli
```
To link your Mobile Center account with the tool, run the following and login to Mobile Center:
```
mobile-center login
```

#### Change project codesign information

1. Install an Apple developer certificate locally. This is essential for test in this case; additional information can be found [here](https://developer.apple.com/support/certificates/).
2. 

## Submit tests to Mobile Center


#### Go to the test beacon in Mobile Center
Click on **Start testing your app** in the center of the page.

Select one device, the Apple iPhone 7, and press **Select one device >** at the bottom right hand corner of the page.

The next page allows you to configure the test run. Make sure **Test series** and **System language** remain the same, master and English respectively, but change the **Test framework** to XCUITest. Click next.

On the Submit page, double check that all of the instructions have been followed. Press **Done**.

Your test should be able to run.
