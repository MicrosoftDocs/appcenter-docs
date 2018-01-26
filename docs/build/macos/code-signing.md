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

# Code signing 
Code signing is a process of digitally signing an app by a verified developer to
guarantee that the app has not been tampered with since it was signed. 
All apps are required to be code signed before they can be distributed to users. 
For details on the signing configurations we support, [click here](#support)


## Code signing for macOS
Code signing a macOS app requires a certificate (`.p12`) as well as an optional
provisioning profile (`.provisionprofile`). These files are created through the
[Apple Developer Center](https://developer.apple.com/account/), and are used by
App Center to sign your builds. The certificate also requires the private key from
your [Keychain](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingCertificates/MaintainingCertificates.html). If the provisioning profile is supplied, both
files need to be for the same export method. For macOS, there are three export
methods:

- **Mac App Development** – For development and testing.
- **Mac App Store** – For submitting apps to the App Store.
- **Developer ID** – For distributing apps outside of the App Store.

Apple's approach to code signing for macOS is to use 
[Gatekeeper](https://support.apple.com/en-us/HT202491), a security feature 
enforced by macOS, to verify the signature of every macOS app that gets run on 
the device. Gatekeeper by default allows macOS devices to run apps downloaded from the App
Store, or apps that are signed with a Developer ID certificate. Apps can also be
conditionally run if they are signed with a Mac App Development certificate and
the provisioning profile contains the device's UUID.

>[!NOTE]
>To build your project with App Center, make sure that the files you are uploading match the code signing in the targets of your project. App Center will build the "build configuration" selected in the scheme.

### App Sandbox
App Sandboxing is an access control technology that is designed to contain
damage to a system and a user's data if the app becomes compromised. It gives an
app access to the minimum set of privileges it needs to get its job done.

Apps using the [App Sandbox](https://developer.apple.com/library/content/documentation/Security/Conceptual/AppSandboxDesignGuide/AboutAppSandbox/AboutAppSandbox.html) are required to use provisioning. Apps that don't require App Sandbox don't need provisioning.

### Automatic signing and CI
When using automatic signing, the Archive action first creates an archive file signed with **development code signing**. Then, the Export action re-signs the archive with a **certificate matching the export method** (App Store, Developer ID, Development with or without Provisioning Profile). If the used export method is not Development then the signing process requires two different certificates and optionally provisioning profiles: one for the Archive action and one for the Export action.

>[!IMPORTANT]
>At the moment, Automatic signing only supports Development signing method on App Center. We will add support to sign with a Developer ID or App Store certificate at a later time.

## Signing files

### Certificates (.p12)
A certificate is always required to sign a macOS app. Each certificate is used
for a different purpose. 

- **Mac Development:** Used to enable certain app services during development and testing.
- **Mac App Distribution:** Used to sign a Mac app before submitting it to the Mac App Store.
- **Developer ID Application:** Used to sign a Mac app before distributing it outside the Mac App Store.

### Provisioning Profiles (.provisionprofile)
Provisioning profiles are optional, depending on your requirements and the
export method used. 

- **Mac App Development:** Install development apps on test devices.
- **Mac App Store:** Submitting to the Mac App Store.
- **Developer ID:** Use Apple services with your Developer ID signed applications.


## Support
The following Mac signing configurations are supported by App Center during preview:

- Manual signing – Development certificate without provisioning profile
- Manual signing – Developer ID certificate with and without provisioning profile
- Automatic signing – Development certificate with and without provisioning profile

> [!NOTE]
> Builds signed with a development certificate without a provisioning profile will not be able to pass a device's Gatekeeper for security concerns. 

### Notes
Currently, automatic signing does not work for Developer ID and App Store because automatic signing requires a development certificate and provisioning profile for archiving as well as another certificate and provisioning profile for exporting, and App Center does not support uploading multiple certificates and provisioning profiles. We are working on adding support for this.

Currently, Mac App Development signing method does not work with manual signing and a provisioning profile. To sign an app for development with a Mac App Development provisioning profile, it's required that the UUID of the device that the app is being built on is provisioned in the profile which is used. All of our builds run on one of our Virtual Machines chosen during runtime. Since the physical UUID of Virtual Machines changes, it's not possible to support signing with a Mac Developer certificate and provisioning profile.
