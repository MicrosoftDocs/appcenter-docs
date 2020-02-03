---
title: Distribution FAQ
description: Frequently asked questions about Distribution service
author: jeom
ms.author: jeom
ms.date: 10/18/2019
ms.topic: article
ms.assetid: 28011d49-082d-41e4-b3bb-2d51dbeb1192
ms.service: vs-appcenter
---

# Distribution FAQ

This document contains a list of frequently asked questions for Distribution in App Center. If you have questions that aren't answered here, please [contact support](~/general/support-center.md).

## Frequently asked questions
### Can I distribute using an App Store Provisioning Profile?
No, it's not possible to distribute apps using the App Store Provisioning profile outside of the store. You can use an Ad Hoc profile or an Enterprise profile. You can learn more by reading our [Device Registration and App Re-signing guide](~/distribution/auto-provisioning.md). 

### How do I add an iOS device for testing?
1. Invite a tester to a distribution group using their email address. If you don't have an existing distribution group, you'll need to create one. The tester will be notified that they've been invited to test your app.
2. Distribute a new release to the group.
3. The tester will be notified that a new release is available. The user will try to install and won't be able to download. 
4. Navigate to **Distribute** > **Groups** > **Select the Group** > **Devices**.
5. Find the user in the list and choose three bullet points on the right to find "Copy UDID".
6. Then follow the process of adding the UDID to your provisioning profile. For more information, read our [Device Registration and App Re-signing guide](~/distribution/auto-provisioning.md).

### How to inspect the iOS console log
If you're the developer of the app and can reproduce the problem on your device, please follow these steps:

1. Connect your iPhone, iPad, or iPod touch to your Mac.
2. Open Xcode, then go to **Window** > **Devices**.
3. Select your device in the left sidebar.
4. Open the device log by clicking on the little triangle at the bottom of the window.
 ![FAQ: how to inspect iOS console log](~/distribution/images/inspect_ios_console_log.png)
5. Start the installation of your app.

During the installation, you might see warnings or errors. If you need help with those messages, please save the log as a .txt file and send it to [support](~/general/support-center.md).

