---
# required metadata

title: Push | Demo App Tutorials
description: Tutorial to help user create and send push notifications.
keywords: mobile-center
authors: sshibu
ms.author: t-shshib
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
## Enable Apple Push Notifications service (APN)
1. Go to the Xcode project editor by clicking on the .xcworkspace file.
2. In the editor, click **Capabilities**. Turn **Push Notifications** ON.

![push capability](Images/ios-enable-push-capability.png)


## Configure push service in Mobile Center
1. Go to your [Apple Developer Account](https://developer.apple.com/account/) and obtain the **Key Identifier**, **Prefix and ID** and **Authentication Token**. Refer to the [Apple documentation](http://help.apple.com/xcode/mac/current/#/dev11b059073) for help.
2. Select **Sandbox** and click **Done**.

## Send push notifications
1. First, follow the [Distribute tutorial](distribute.md) to download the app to your device.
2. Navigate to the **Push** service in Mobile Center.
3. Click **Send notification** at the top of the page.
4. Type "Using Push Notifications" under **Campaign Name**. The **Title** will be "Push notification on sample app" and the message will be "testing".

![setting up push](Images/Screen%20Shot%202017-06-28%20at%208.58.44%20PM.jpg)

5. Press **Next**.
4. In the Target section, select **All registered devices**.
5. Press **Next**.
5. Press **Send notification**.
