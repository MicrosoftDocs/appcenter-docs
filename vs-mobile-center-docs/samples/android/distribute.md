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
- Signed APK. Go to the [Android Developer Documentation](https://developer.android.com/studio/index.html) to learn about creating a new keystore and manually signing an APK.


## Choose a build to distribute
There are **two ways you can distribute** the app.
If you have already completed the [Build tutorial](build.md) and built the sample app:
1. Navigate to the **Build** service in Mobile Center and click on settings from your latest successful build.
2. Turn **Distribute builds** on and select a collaborator group. You can edit groups and add new groups in the **Distribute** service.
3. Click **Save** and allow the branch to build again.
  ![Distribute from Build](images/distributeFromBuild.gif)


Another way is to upload your own .apk file:
*Optional: From the Distribute service, click New Group at the top of the page to add people to test the app or collaborate with you.*
1. Click **Distribute new release** at the top of the page.
2. Under **Upload your release**, navigate to the app-release.apk file that was generated when you signed the APK. Click Next.  
  ![Distribute from Distribute](images/distributeFromBeacon.gif)
3. Leave Release notes blank. Click Next.
4. Under **Who are you distributing this release to?** select the distribution group. Click Next.
5. Click **Distribute**.



## Install the sample app
1. You, and all other specified testers, should receive an email with a link to download the sample app.
2. Open the link and follow the instructions to register your device with Mobile Center, and the app will begin installing.
