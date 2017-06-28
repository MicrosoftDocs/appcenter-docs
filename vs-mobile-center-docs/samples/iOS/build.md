---
# required metadata

title: Build| Demo App Tutorials
description: Tutorial to build sample app in the Mobile center portal.
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
In this tutorial, you will build the sample app in the Mobile Center portal.

If you have not already, first follow the [getting started tutorial](/getting-started.md) to set up the sample app.


### Prerequisites
- [GitHub account](https://github.com/join).
- Provisioning profile and certificate (optional)

<!--
## Add a shared scheme
To build the sample app, you'll first have to add a shared scheme to the project.
1. Open the sample app's **.xcworkspace** in XCode.
2. Select **Product** > **Scheme** > **Manage Schemes**.
3. Check the **shared** box for the project
4. Push the changes to GitHub.
-->
## Set up the repository
1. Navigate to the **Build tab** on the Mobile Center portal.
2. Select **GitHub** as the service to Build with.
3. Select the sample app's repo, **demoapp-ios-swift**.

## Configure the build
1. From the list of branches, select the **master** branch.
2. Click **Configure build**.
3. If you have a provisioning profile and certificate, enable code signing by flipping the switch next to **Sign build**, and upload the files.
4. Click **Save** at the bottom of the page, and the build will begin.

Your build should be queued, and should take a couple minutes to finish building. Click on the build to view the **build output**.

Every time you push code to a configured branch, a build will automatically begin. This helps you continuously deliver apps by ensuring the latest changes to your app can build.
