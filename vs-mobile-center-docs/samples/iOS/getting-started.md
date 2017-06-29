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


# Getting Started

## Login to Github and fork the repository
1. Login to your [GitHub account](https://github.com/join).
2. Click [here](https://github.com/MobileCenter/demoapp-ios-swift) to access the GitHub repository containing the sample app.
3. Click on **Fork** at the top right hand corner of the page.


## Install CocoaPods

1. Run the following command in terminal to install CocoaPods:
```
sudo gem install cocoapods
```
2. Run the following command in terminal to install the dependencies specified by the pod file in the repository.
```
pod install
```

3. Open the .xcworkspace file.



## Sign in to Mobile Center
We recommend using GitHub to login to the [Mobile Center portal](https://mobile.azure.com).


## Create a new app in Mobile Center
1. Click on **Add new** on the upper right hand corner of the page.
2. From the dropdown options, select **Add new app**.
3. Name the app **Sample iOS App**. Make sure that iOS is selected as the OS and Objective-C/Swift is selected as the platform.
4. Finish the process by pressing **Add new app** on the bottom right hand corner of the page.
