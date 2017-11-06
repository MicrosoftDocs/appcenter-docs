---
# required metadata

title: Device registration | App Center Distribution
description: 
keywords: UDID, Distribution,
author: oddj0b
ms.author: vigimm

ms.date: 07/03/2017
ms.topic: article
ms.service: vs-appcenter

ms.assetid: 6060f562-4ca9-448b-aba1-fcd5f6734ceb

# optional metadata

#ROBOTS:
#audience:
ms.reviewer: siminap

---

# Device registration
**Preview feature** 

As a prerequisite for distributing your app to iOS devices, it is necessary to obtain the correct device ID and register it in the Apple developer portal. To help you with releasing apps to internal testers, App Center contains a tool for registering device IDs in Apple's developer portal. On top of that, App Center updates the provisioning profile used for distribution with the new IDs.

## How to get started
To initiate the device registration flow, select a distribution group with unprovisioned devices and navigate to the devices tab. Click the **Devices** tab and click the **Register devices** button. A dialog will prompt for your username and password used in the [Apple developer portal](https://developer.apple.com/).  Once you log in with your Apple username and password, App Center will add the unprovisioned devices to both your Apple developer account and the corresponding provisioning profile. It is possible to download the updated provisioning profile with the button on the review screen. Alternatively, the profile is available to download through Xcode or the Apple developer portal.

## Next step for this feature
The App Center roadmap includes a solution to automatically register device IDs with Apple developer portal, then apply it to your app so testers can install it within minutes.

## Privacy concerns on username and password
App Center only uses your Apple ID once as a one-time transaction, and it does not store or in any other way have access to your username and password. 

## What is happening when you click register devices
App Center registers device IDs in your Apple developer account and adds them to the provisioning profile used for distribution. An Apple Developer account has a finite number of spots for devices split by device type. Apple works with five device types, which are iPad, iPhone, iPod, Apple TV, and Apple Watches. Each of these has a limitation of 100 devices i.e. if you register six devices all of which is iPhones, you have 94 devices IDs left for iPhones and still have 100 left for each of the four other device types. You can read more about it in [Apple's documentation](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html#//apple_ref/doc/uid/TP40012582-CH30-SW10).

## Feedback
Contact us with questions or suggestions about device registration, by commenting on below or through App Center by clicking on the round blue chat button in the lower right-hand side of the screen.

