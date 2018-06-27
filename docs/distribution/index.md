---
title: Distribute Mobile Apps with App Center
description: "How to add users and upload binaries to distribute apps in App Center."
keywords: distribution
author: JoshuaWeber
ms.author: JoshuaWeber
ms.date: 01/20/2017
ms.topic: article
ms.assetid: dda0e037-9f42-4e63-8ef8-e645d3e8fbda
ms.service: vs-appcenter
ms.custom: distribute
---

# Distribute

App Center Distribution is a tool for developers to release application binaries to their end user devices. The speed and integration capabilities make this tool perform admirably for release of pre-production or beta software to testing devices. App Center Distribution supports the distribution of application packages for iOS, Android, UWP, and macOS.

## Getting Started

Distributing with App Center is easy, and only requires a few steps. No need for an SDK. Just the application binary.

1. [Add users to your app][add_users] to grant access to all releases.
2. [Create Distribution Groups][dist_groups] to manage access.
3. [Upload][upload] a new application release.
    - At the completion of the upload an email will be sent to all users of the app to notify them of the new release.
4. [Install][install] the release onto your device by clicking on the link in the email.
5. Enable [In-App Updates][in-app-updates] to help your users stay always on the latest release.

[add_users]: ~/dashboard/creating-and-managing-apps.md
[dist_groups]: groups.md
[upload]: uploading.md
[install]: installation.md
[in-app-updates]: inappupdates.md
