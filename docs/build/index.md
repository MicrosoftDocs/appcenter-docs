---
title: App Center Build
description: Building apps with App Center
keywords: build
author: siminapasat
ms.author: siminap
ms.date: 09/12/2018
ms.topic: article
ms.assetid: 3ebe875a-e8e0-4b76-bba1-277047a321b7
ms.service: vs-appcenter
ms.custom: build
---

# App Center Build

The App Center Build service helps you build the Android, iOS, macOS, and UWP apps you and your team are working on, using a secure cloud infrastructure. Connect to your repo in App Center and start building your app in the cloud on every commit. With Build you can forget about configuring build servers locally, complicated configurations, and code that builds on a coworker's machine but not yours.

With the added power of App Center's other services, you can further automate your workflow. Automatically release builds to testers and public app stores with [App Center Distribute](~/distribution/index.md), or run automated UI tests on thousands of real device and OS configurations in the cloud with [App Center Test](~/test-cloud/index.md).

## Getting Started

![App Center Build Getting Started](~/build/images/build_getting-started-dashboard.jpg)

To get started using the Build service, you'll first need to connect to a source control system. On the Build getting started dashboard, select the repository where the app is located and then select the desired branch to be built. App Center currently supports building apps in Git repositories hosted on:

- Azure DevOps (formerly Visual Studio Team Services or VSTS)
- Bitbucket
- GitHub
- GitLab (currently in private preview)

App Center doesn't support Team Foundation Version Control (TFVC).

If you're having trouble with your builds, [contact our dedicated support team](https://intercom.help/appcenter/getting-started/getting-help-with-app-center) using the blue chat icon in the lower-right corner of every App Center page.


> [!NOTE]
> App Center build history and associated artifacts are available for 30 days. 
