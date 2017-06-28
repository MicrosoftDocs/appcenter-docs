---
# required metadata

title: Getting Started | Demo App Tutorials
description: Tutorial to onboard an iOS application in Mobile Center
keywords: mobile-center
authors: sshibu
ms.author: t-shshib
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


# Getting started
## About This Tutorial

This tutorial aims to help you easily onboard to Mobile Center by mirroring the process with a sample app. By the end of this tutorial, you will better understand how to use the services Mobile Center provides.  

This app in particular is intended for iOS developers programming in Swift.

## Prerequisite
- [GitHub account](https://github.com/join).

---

## Preliminary Steps

#### 1. Fork the Repository

- Click [here](https://github.com/MobileCenter/demoapp-ios-swift) to access the GitHub repository containing the sample app.

- Click on **Fork** at the top right hand corner of the page.


#### 2. Install CocoaPods

1. Run the following command in terminal to install CocoaPods:
```
sudo gem install cocoapods
```
2. Run the following command in terminal.
```
pod install
```

3. Open the .xcworkspace file.



#### 3. Sign in to Mobile Center
We recommend using GitHub to login to the [Mobile Center portal](https://mobile.azure.com).

#### 4. Create a new app in Mobile Center

Click on **Add new** on the upper right hand corner of the page.

From the dropdown options, select **Add new app**.

Name the app **Sample iOS App**. Make sure that iOS is selected as the OS and Objective-C/Swift is selected as the platform.

Finish the process by pressing **Add new app** on the bottom right hand corner of the page.
