---
title: Code Signing for macOS in App Center
description: Code signing apps built with App Center
keywords: code signing, mac, macos
author: andyzg
ms.author: t-anzha
ms.date: 11/01/2017
ms.topic: article
ms.assetid: 80c6e7cf-ec3a-437d-b0b4-222ff83c23ab
ms.service: app-center
ms.custom: build
ms.tgt_pltfrm: macos
---

# Code signing for macOS
Code signing enables macOS devices to verify the app developer’s identity. When running an app locally, [Gatekeeper](https://support.apple.com/en-us/HT202491) checks the identity of the app's developer and only runs apps from trusted sources. By default, Gatekeeper allows you to run apps that are signed with a Developer ID certificate or downloaded from the App Store. Also, for development, your device can be provisioned to pass Gatekeeper.

App Store apps are required to use [App Sandbox](https://developer.apple.com/library/content/documentation/Security/Conceptual/AppSandboxDesignGuide/AboutAppSandbox/AboutAppSandbox.html). Any app that uses App Sandbox is required to use provisioning. To sign an app, provisioning apps is optional whereas the certificate is always required. Consequently, signed apps aren't always using App Sandbox if they weren't signed with a provisioning profile. 

Make sure that the settings in your project target match the files you upload to the build configuration. [Learn more](~/build/macos/uploading-signing-files.md) about where to find the provisioning profiles and certificates that are required for signing.

## Certificates
- **Mac Development**
    "Mac Developer: Team Member Name" - Used to enable certain app services during development and testing.
- **Mac App Distribution**
    "3rd Party Mac Developer Application: Team Name" - Used to sign a Mac app before submitting it to the Mac App Store.
- **Developer ID Application**
    "Developer ID Application: Team Name" - Used to sign a Mac app before distributing it outside the Mac App Store.

## Provisioning Profiles
- **Mac App Development**
    A provisioning profile to install development apps on test devices.
- **Mac App Store**
    A distribution provisioning profile to submit your app to the Mac App Store.
- **Developer ID**
    A Developer ID provisioning profile to use Apple services with your Developer ID signed applications.

## Automatic vs. manual code signing
With Xcode 8, Apple has introduced a new way to manage code signing. After enabling "Automatically manage signing" in the target of your project, you can select the desired team and Xcode automatically creates or detects the certificate for you. However, Xcode's automatic provisioning only benefits iOS. When building Mac Apps, we recommmend manual signing so that you have full control and can select the respective team, certificate and provisioning profile.

>[!NOTE]
>To build your project with App Center, make sure that the files you are uploading match the code signing in the targets of your project. App Center will select the "build configuration" selected in the scheme. You can change the build configration by going to Edit Scheme -> Archive -> Build Configuration.

### Automatic signing and CI
With automatic signing, there are two steps to exporting an app: Archive and Export. Archive creates an archive file signed with **development code signing**. Export then re-signs the archive with a **certificate matching the export method** (App Store, Developer ID, Development). If the used export method is not Development then the signing process requires two different certificates and provisioning profiles: one for the Archive action and one for the Export action.

>[!NOTE]
>At the moment, App Center only supports to sign your app with the Mac Developer certificate when "Automatically manage signing" is enabled. We will add support to sign with a Developer ID or App Store certificate at a later time.

## Support

In preview, signing for the Mac App Store is not supported, but it will be added at a later time.

### Automatic signing
Currently, automatic signing does not work for Developer ID and App Store because automatic signing requires a development certificate and provisioning profile for archiving as well as another certificate and provisioning profile for exporting. Currently, App Center does not support uploading multiple certificates and provisioning profiles. We are currently working on adding support for this.

### Signing with a Mac App Development profile

To sign an app for development with a Mac App Development provisioning profile, it's required that the UUID of the device that the app is being built on is provisioned in the profile which is used. Since the physical UUID of Virtual Machines changes, it's not possible to support signing with a Mac Developer certificate and provisioning profile.
