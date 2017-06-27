---
# required metadata

title: [Getting Started | Demo App Tutorials]
description: a tutorial to help a new user to get started using the demo app.
keywords: mobile-center
authors: [sabrinaj206 sshibu]
ms.author: [t-sajia t-shshib]
ms.date: 06/26/2017
ms.topic: article
ms.service: mobile-center
ms.custom:
ms.prod: .net-core
ms.assetid: f2af4edd-7d50-4e2d-8dd2-04eea4b755eb

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---

# Getting started
### About This Tutorial

This tutorial aims to help you easily onboard to Mobile Center by mirroring the process with a demo app. By the end of this tutorial, you will better understand how to use the services Mobile Center provides.  

This app in particular is intended for iOS developers programming in Swift.

### Prerequisites
- [GitHub account](https://github.com/join).
- CocoaPods installed. Skip the following section if this prerequisite is met.

---


#### 1. Fork the Repository
- Click [here](https://github.com/MobileCenter/demoapp-ios-swift) to access the GitHub repository containing the demo app.
- Click the Fork button at the top right hand corner of the page.

#### 2. Install CocoaPods
The following steps are reiterated on the Getting Started page in Mobile Center.
1. Run the following command in terminal to install CocoaPods:
    ```
    $ sudo gem install cocoapods
    ```
2. Create a Podfile in the app root directory, the folder containing the .xcodeproj file, by running
```
pod init
```
3. Open the Podfile and add the line
```
pod 'MobileCenter'
```
 to include all Mobile Center services within the app. If you'd only like to work with specific services, use one or more of the following lines:
 ````
 pod 'MobileCenter/Analytics'
 pod 'MobileCenter/Crashes'
 ````
 Save the file.

4. Run the command `pod install` in terminal.
5. Open the .xcworkspace file.



#### 3. Sign in to Mobile Center
We recommend using GitHub to login to the [Mobile Center portal](https://mobile.azure.com).

#### 4. Create a New App in Mobile Center
Click the Add new button on the upper right hand corner of the page.
Name the app whatever you'd like. Optional: add a brief description for your own reference. Make sure that iOS is selected as the OS and Objective-C/Swift is selected as the Platform.

# Insert page navigations here.
----

##### Sidenote
Throughout this process, remember intercom, the chat button at the lower right hand corner of the Mobile Center landing page. If you have any problems or questions at any stage of the process, please don't hesitate to reach out for help.
