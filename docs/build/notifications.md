---
title: App Center Build Notifications
description: details about App Center notifications triggered by build outcomes.
keywords: build, notifications
author: lucen-ms
ms.author: lucen
ms.date: 08/11/2020
ms.topic: article
ms.assetid: a2a9a5ef-eed5-4a38-b34c-596c7d404401
ms.service: vs-appcenter
ms.custom: build
---

# Build Notifications
Email and custom webhook notifications give you continual real-time updates of your build status, as well as the permanency and ability to search and be directed to your builds in App Center. These notifications enable faster collaboration, since you can forward the build status emails or @ mention collaborators in a single workflow.

You can choose to have email and webhook notifications automatically sent for the following events:

- Build Success
   * **Always** When your app builds successfully.
   * **Only** if previously failed: When your app has successfully built after one or more failed builds.
   * **Never** You won't receive notifications for build success.

- Build failure
   * **Always** When your app fails to build.
   * **Only if previously successful** When your app has failed to build after one or more successful builds.
   * **Never** You won't receive notifications for build failure.

By default, email notifications are sent only when a new version is released. Whether you're an admin, app developer, or tester, it's important to know when a new app version is released. For admins or app developers involved in the Continuous Integration, Delivery, and Deployment process, it's useful to set up email and custom webhook notifications for build and distribute.