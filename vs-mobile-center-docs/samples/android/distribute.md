---
# required metadata

title: Distribute Installable Sample App to Users | Sample App Tutorials
description: Tutorial to distribute a sample Android app to a group of users in Mobile Center.
keywords: mobile-center
authors: sshibu
ms.author: t-shshib
ms.date: 07/27/2017
ms.topic: article
ms.service: mobile-center
ms.custom: samples
ms.prod: .net-core
ms.assetid: 71de3de5-2def-462f-9177-228436ef336b

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---

# Distribute Installable Sample App to Users
### Prerequisites
- Follow the [getting started tutorial](getting-started.md) to set up the sample app.
- Optional: signed APK. Go to the [Android Developer Documentation](https://developer.android.com/studio/index.html) to learn about creating a new keystore and manually signing an APK.


## Choose a build to distribute
There are **two ways you can distribute** the app.

If you already completed the [Build tutorial](build.md) and built the sample app:
1. From the **Distribute** service, select the **Beta Testers** distribution group you just made.
2. Click **Distribute new release** at the top of the page.
3. Choose **Select Build from branch**.
4. Choose the **master** branch.  
  ![Distribute build from branch](images/build_from_branch_ios.png)
5. Click on the latest successful and signed build. If there isn't a build, then you haven't signed your builds. The [Build tutorial](build.md) has steps to do so.
6. Click **Next** twice. Leave the **Release notes** blank.

Another way is to upload your own .ipa file from XCode:
1. From the **Distribute** service, select the **Beta Testers** distribution group you just made.
2. Click **Distribute new release** at the top of the page.
3. Choose **Select Build from branch**.  
  ![Distribute .ipa file](images/upload_new_build_ios.png)
4. Upload your **.ipa** file.
5. Click **Next** twice. Leave the **Release notes** blank.


## Distribute the app
2. Click **New distribution group**.
3. Name the group **Beta Testers** and add your email in the invitation box below.
4. Press **Create Group**.
6. Click **Next** twice and then **Distribute build**.

By creating groups of users, you can easily distribute to them all at once, and add new testers when needed.

## Install the sample app
1. You should receive an email with a link to download the sample app.
2. Open the link and follow the instructions to register your device with Mobile Center, and the app will begin installing.
