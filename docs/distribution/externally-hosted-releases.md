---
title: Distribute an externally hosted release
description: Host the binary of a release outside of App Center
keywords: distribution external release
author: derpixeldan
ms.author: daadam
ms.date: 11/07/2019
ms.topic: article
ms.service: vs-appcenter
ms.custom: distribute
ms.assetid: e771432a-73bc-4150-bee7-f88097e7171e
---

# Distributing externally hosted releases

You can create a release for your app in App Center without uploading the binary. You provide the link to the place where you're hosting the binary. App Center doesn't download the file. Some functionality will be missing, but mostly everything behaves the same way.

On this page you can read how to create externally hosted releases, and what the requirements and limitations are.

## Creating an externally hosted release

You start creating an externally hosted release just like you would any release to a group or tester:

1. Open your app in the App Center website and then either go to **Distribute** > **Releases** and choose **New release**.
2. Choose **Specify build URL** to go to the wizard for creating an externally hosted release.
3. Enter the required information
   1. The HTTPS URL pointing to the binary you're hosting.
   2. The version of your release. This is the version number users will see when asked to update.
   3. The build number of your release. This is for you to keep track of exactly which binary the release points to.
4. Choose **Next** to enter the rest of the release information. From here on, the flow is the same as for regular releases.
5. On the **Notes** tab, optionally enter the release notes for your testers. Choose **Next**.
6. On the **Destinations** tab, select the tester(s)/group(s) to distribute the release to. Choose **Next**.
7. On the **Review** tab, verify the details of the externally hosted release. Optionally select whether it's a mandatory update, or to not notify users of the release.
8. Finally choose **Distribute** to distribute the externally hosted release.

## Requirements and limitations

Externally hosted releases have the following requirements and limitations:

- You must host the binary behind a secure HTTPS URL. App Center doesn't accept URLs starting with `http://`, but only ones starting with `https://`.
- You can only distribute externally hosted releases to testers and groups. Stores like Google Play and the App Store require that you send them the binary.
- In-app updates currently don't work.
- App Center can't show the MD5 hash, file size, or provisioning profile of the binary.
- App Center can't re-sign your binary or automatically manage devices for iOS applications.
