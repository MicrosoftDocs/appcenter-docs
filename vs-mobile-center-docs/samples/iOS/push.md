---
# required metadata

title: Push | Demo App Tutorials
description: Tutorial to help user create push notifications.
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

![push capability](/Users/sherin/Downloads/ios-enable-push-capability.png
)

## Opt in to push service
1. Navigate to the **AppDelegate.swift** file. Insert the following:
```
import MobileCenter
import MobileCenterPush
```
2. In the same file, go to the `didFinishLaunchingWithOptions` method and insert the following:
```
MSMobileCenter.start("{Your App Secret}", withServices: [
      MSPush.self,
  ])
```
3. Replace `{Your App Secret}` with your actual app secret.
  - Obtain the **App Secret** unique to your app by navigating to the **Settings** page in Mobile Center. Once in **Settings**, find the app secret by following the arrow in the picture below:

  ![Find App Secret](/Users/sherin/Desktop/Screenshots/Screen Shot 2017-06-28 at 6.12.32 PM.jpg)
4. Save and close the file.
5. Build and launch your app.

## Configure push service in Mobile Center
1. Go to your [Apple Developer Account](https://developer.apple.com/account/) and obtain the **Key Identifier**, **Prefix and ID** and **Authentication Token**. Refer to the [Apple documentation](http://help.apple.com/xcode/mac/current/#/dev11b059073) for help.
2. Select **Sandbox** and click **Done**.

## Send push notifications
1. Once push is set up, you're ready to send push notifications to app users. Refer to the [distribute]() tutorial to download the app to your device.
2. Navigate to **Push** in Mobile Center and click **Send notification** at the top right hand corner of the page.
3. Type "Using Push Notifications" under **Campaign Name**. The **Title** will be "Push notification on sample app" and the message will be "testing". Custom data is optional. We are not using any in this case. There are two types for future reference:
  - **badge**: This key can be added to change the badge of your app icon. The badge does not change if the key is not included. If the key value is set to 0, the badge is removed.
  - **sound**: If you want to play a sound, set the value of this key to the name of a sound file in your app's main bundle or in the Library/Sounds folder of your app’s data container. The system plays the default alert sound without a custom sound.  
At this point, the page sidebar should look like this:
![](/Users/sherin/Desktop/Screen Shot 2017-06-28 at 8.58.44 PM.jpg
)

 Verify that it does and press **Next**
4. In the Target section, under **Who are you sending this notification to?**, select **All registered devices** and press **Next**.
5. In the final section, Review, press **Send notification**.
