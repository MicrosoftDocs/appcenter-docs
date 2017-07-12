---
# required metadata

title: Push | Sample App Tutorials
description: Tutorial to send a push notification to the sample ios app.
keywords: mobile-center
authors: sabrinaj206 sshibu
ms.author: t-sajia t-shshib
ms.date: 06/26/2017
ms.topic: article
ms.service: mobile-center
ms.custom: samples
ms.prod: .net-core
ms.assetid: c5e0de7e-63d8-41a4-839f-9fd210ba3aca

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---


# Push
In this tutorial you will learn how to send push notification to users through Mobile Center.

First, follow the [getting started tutorial](/getting-started.md) to set up the sample app.

### Prerequisites
 - Provisioning Profile and Certificate. Go to the [Apple Developer Documentation](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html) to learn about creating an App ID to codesign the sample iOS app with.
 - Distributed the sample app to your device (not running on a simulator).

## Set up Push in Mobile Center
1. Go to the **Push** service in [Mobile Center](https://mobile.azure.com/apps).
2. Click **next** to skip the first page. We've already included all the code shown here.

## Get your Apple Push Notification service Key
1. Go to your **[Keys](https://developer.apple.com/account/ios/authkey/)** on the Apple Developer website.
2. Create a new APNs Key if you don't have one. Fill in a Key name and check the **APNs** checkbox.
3. Copy the **Key ID** and download the **key file**. Paste it in the box in Mobile Center.

## Get the sample app's Prefix and ID
1. Go to your **[App IDs](https://developer.apple.com/account/ios/identifier/bundle)** on the Apple Developer Website.
2. Click on the sample app's ID.
3. Copy the **Prefix** and paste it in the box in Mobile Center.
4. Copy the **ID** and paste it in the box in Mobile Center.
5. Open the **key file** from your **Key ID**, and copy the authentication token. Paste it in the box.
5. Choose **Sandbox**.
6. Click **Done** at the bottom.

## Set up a Push notification
1. First, follow the [Distribute tutorial](distribute.md) to download the app to your device.
2. Navigate to the **Push** service in Mobile Center.
3. Click **Send notification**.
4. Set the **Campaign Name** as "Using Push Notifications". Set the **Message** as "Testing".  

## Send a push notification
1. Click **Next** at the bottom.
2. Choose **All registered devices**.
3. Click **Next** and **Send notification** at the bottom. **A push notification will be sent to the device you distributed to - it will not show up in the simulator.**  
  ![Send a Push notification](images/Send_push_ios.gif)
