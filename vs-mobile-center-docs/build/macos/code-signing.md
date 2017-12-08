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
Code signing enables macOS devices to verify the app developer’s identity. When running an app locally, [Gatekeeper](https://support.apple.com/en-us/HT202491) checks the identity of the app's developer and only runs apps from trusted sources. By default, Gatekeeper allows you to run apps that are signed with a Developer ID certificate, downloaded from the App Store or the device is provisioned. Apps using the [App Sandbox](https://developer.apple.com/library/content/documentation/Security/Conceptual/AppSandboxDesignGuide/AboutAppSandbox/AboutAppSandbox.html) require to use provisioning for others it's optional.

## Automatic vs. manual code signing
When **Automatically manage signing** is enabled only signing with a Mac Developer certificate is possible. For manual signing you can also provision your app. Learn more about where to [find the provisioning profiles and certificates](~/build/ios/uploading-signing-files.md) that are required for signing.

>[!NOTE]
>To build your project with App Center, make sure that the files you are uploading match the code signing in the targets of your project. App Center will build the "build configuration" selected in the scheme.

### Automatic signing and CI
When using automatic signing the `Archive` action first creates an archive file signed with **development code signing**. Then, the `Export` action re-signs the archive with a **certificate matching the export method** (App Store, Developer ID, Development with or without Provisioning Profile). If the used export method is not `development` then the signing process requires two different certificates and optionally provisioning profiles: one for the `Archive` action and one for the `Export` action.

>[!IMPORTANT]
>At the moment, App Center only supports to sign your app with the Mac Developer certificate when "Automatically manage signing" is enabled. We will add support to sign with a Developer ID or App Store certificate at a later time.

## Certificates (.p12)
- **Mac Development:** Used to enable certain app services during development and testing.
- **Mac App Distribution:** Used to sign a Mac app before submitting it to the Mac App Store.
- **Developer ID Application:** Used to sign a Mac app before distributing it outside the Mac App Store.

## Provisioning Profiles (.provisionprofile)
- **Mac App Development:** Install development apps on test devices.
- **Mac App Store** For submittion to the Mac App Store.
- **Developer ID** To use Apple services with your Developer ID signed applications.

## Support
In preview, signing for the Mac App Store is not supported, but it will be added at a later time.

### Automatic signing
Currently, automatic signing does not work for Developer ID and App Store because automatic signing requires a development certificate and provisioning profile for archiving as well as another certificate and provisioning profile for exporting. Currently, App Center does not support uploading multiple certificates and provisioning profiles. We are currently working on adding support for this.

### Signing with a Mac App Development profile

To sign an app for development with a Mac App Development provisioning profile, it's required that the UUID of the device that the app is being built on is provisioned in the profile which is used. Since the physical UUID of Virtual Machines changes, it's not possible to support signing with a Mac Developer certificate and provisioning profile.

