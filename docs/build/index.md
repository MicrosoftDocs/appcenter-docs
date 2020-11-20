---
title: App Center Build
description: Building apps with App Center
keywords: build
author: king-of-spades
ms.author: kegr
ms.date: 01/07/2019
ms.topic: article
ms.assetid: 3ebe875a-e8e0-4b76-bba1-277047a321b7
ms.service: vs-appcenter
ms.custom: build
---

# App Center Build

The App Center Build service helps you build Android, iOS, macOS, and UWP apps using a secure cloud infrastructure. Connect to your repo in App Center and start building your app in the cloud on every commit. With Build you can forget about configuring build servers locally, complicated configurations, and code that builds on a coworker's machine but not yours.

With App Center's other services, you can further automate your workflow: 
- Automatically release builds to testers and public app stores with [App Center Distribute](~/distribution/index.md). 
- Run automated UI tests on thousands of real device and OS configurations in the cloud with [App Center Test](~/build/build-test-integration.md).

## Getting Started

![App Center Build Getting Started](~/build/images/build_getting-started-dashboard.jpg)

To get started using the Build service, you first must connect to a source control system. On the Build getting started dashboard, select the repository where the app is located and then select the branch to be built. App Center currently supports building apps in Git repositories hosted on:

- Azure DevOps (formerly Visual Studio Team Services or VSTS)
- Bitbucket
- GitHub
- GitLab

App Center doesn't support Team Foundation Version Control (TFVC).

If you're having trouble with your builds, check the [troubleshooting guide](https://docs.microsoft.com/appcenter/build/troubleshooting/) or you can always reach out and let us know by opening a support ticket. Select the help menu (?) in the upper right corner of App Center portal, then choose 'Contact support'. Our dedicated support team will respond to your questions and feedback.


> [!NOTE]
> App Center build artifacts and logs are kept for 30 days after build completion.
