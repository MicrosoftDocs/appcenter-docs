---
# required metadata

title: Device registration | Mobile Center Distribution
description: 
keywords: UDID, Distribution, 
ms.author: vigimm

ms.date: 07/03/2017
ms.topic: article
ms.service: mobile-center

ms.assetid: 6060f562-4ca9-448b-aba1-fcd5f6734ceb

# optional metadata

#ROBOTS:
#audience:
ms.reviewer: siminap

---

# Device registration
**Preview feature** 

As a prerequisite for distributing your app to iOS devices, it is necessary to obtain the correct device ID and register it in the Apple developer portal. To help you with releasing apps to internal testers, we created a tool for registering device IDs in Apple's developer portal. On top of that, Mobile Center updates the provisioning profile used for distribution with the new IDs.

## How to get started
To initiate the device registration flow, select a distribution group with unprovisioned devices and navigate to the devices tab. Click the Devices tab and tab the "Register devices" button. On the screen, there's a login dialogue enter the username and password used for the [Apple developer portal](https://developer.apple.com/).  Once you log in with your Apple username and password, Mobile Center can add the unprovisioned devices to both your Apple developer account and your provisioning profile.It is possible to download the updated provisioning profile with the button on the review screen. Alternatively, the profile is available to download through Xcode or the Apple developer portal.

## Next step for this feature
We are working on a solution for credentials storage and incorporating it into a workflow where you as a developer add a tester to a distribution group, the tester signs-up and within minutes can download the latest release.

## Privacy concerns on username and password
Mobile Center only use your Apple ID once as a one-time transaction, and we do not store or in any other way have access to your username and password. 

## What is happening when you click register devices
Mobile Center register device IDs in your Apple developer account and add them to the provisioning profile used for distribution. An Apple Developer account has a finite number of spots for devices split by device type. Apple works with five device types, which are iPad, iPhone, iPod, Apple TV and Apple Watches. Each of these has a limitation of 100 devices. I.E. if you register six devices all of which is iPhones, you have 94 devices IDs left for iPhones and still, have 100 left for each of the four other device types. You can read more about it in [Apple's documentation](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html#//apple_ref/doc/uid/TP40012582-CH30-SW10).

## Feedback
Feel free to contact me with questions or suggestions to device registration. By commenting on below or through Mobile Center by clicking on the round blue chat button in the lower right-hand side of the screen.

