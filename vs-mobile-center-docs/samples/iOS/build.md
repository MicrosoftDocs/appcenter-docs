---
# required metadata

title: Build| Sample App Tutorials
description: Tutorial to build sample iOS app in Mobile Center.
keywords: mobile-center
authors: sabrinaj206
ms.author: t-sajia
ms.date: 06/27/2017
ms.topic: article
ms.service: mobile-center
ms.custom:
ms.prod: .net-core
ms.assetid: 3b78d40e-157f-415a-8680-ed889e95e517

# optional metadata

#ROBOTS:
#audience:
#ms.devlang: dotnet
#ms.reviewer: [ALIAS]

---

# Build
In this tutorial, you will learn to build a sample iOS app in Mobile Center.

First, follow the [getting started tutorial](/getting-started.md) to set up the sample app.

### Prerequisites
- [GitHub account](https://github.com/join)
- Provisioning Profile and Certificate (optional)

<!--
Add a shared scheme
To build the sample app, you'll first have to add a shared scheme to the project.
1. Open the sample app's **.xcworkspace** in XCode.
2. Select **Product** > **Scheme** > **Manage Schemes**.
3. Check the **shared** box for the project
4. Push the changes to GitHub.
-->
## Set up the repository
1. Go to the **Build** service in [Mobile Center](https://mobile.azure.com/apps).
2. Choose **GitHub** as the service to Build with.
3. Sign in to GitHub, and click **Authorize MobileCenter**.
4. Choose **demoapp-ios-swift**.

## Configure the build
1. Choose the **master** branch.
2. Click **Configure build**. The Build configuration panel will show up.
3. If you want to sign the builds, turn **Sign build** on. Upload your Provisioning Profile and Certificate, which can be found in the [Apple Developer Center](https://developer.apple.com/account/). This will let you distribute the app later.  
![Signing Builds](images/Signing_builds_ios.png)
4. Click **Save** at the bottom of the page, and the build will begin.

The build can take a couple minutes, but you can click on it to view real-time output logs. After, if the build is successful, you can download the build, symbols, or logs by clicking **Download**.

Every time you push code to a configured branch, a build will automatically begin. This helps you continuously deliver apps by making sure the latest changes to your app can build.
