---
# required metadata

title: Build| Sample App Tutorials
description: Tutorial to build sample Android app in Mobile Center.
keywords: mobile-center
authors: sshibu
ms.author: t-shshib
ms.date: 07/27/2017
ms.topic: article
ms.service: mobile-center
ms.custom: samples
ms.prod: .net-core
ms.assetid: ea3f9263-5325-4bda-be1b-c0ec85284957

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---

# Build Sample App on Mobile Center
First, follow the [getting started tutorial](getting-started.md) to set up the sample app.

### Prerequisites
- [GitHub account](https://github.com/join)
- Optional: signed APK. Go to the [Android Developer Documentation](https://developer.android.com/studio/index.html) to learn about creating a new keystore and manually signing an APK.

## Set up the repository
1. Go to the **Build** service in [Mobile Center](https://mobile.azure.com/apps).
2. Choose **GitHub** as the selected service.
3. Sign in to GitHub, and click **Authorize MobileCenter**.
4. Choose **sampleapp-android**.

## Configure the build
1. Choose the **master** branch.
2. Click **Configure build**. The Build configuration panel will show up.
3. The default setting for build frequency is **Build this branch on every push**. Every time you push code to a configured branch, a build will automatically begin. You can enable this continuous integration feature or opt to manually choose when builds run.
![Continuous Integration](images/ContinuousIntegration.jpg)
4. If you want to run the build on a device, turn **Sign builds** on. Upload your keystore file and fill in the environment variables.
5. Click **Save** at the bottom of the page, and the build will begin.

The build can take a couple minutes, but you can click on it to view real-time output logs. After, if the build is successful, you can download the build, symbols, or logs by clicking **Download**.
